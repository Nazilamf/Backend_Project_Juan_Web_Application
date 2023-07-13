using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize]
    [Area("manage")]
    public class ColorController : Controller
    {
        private readonly JuanDbContext _context;

        public ColorController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Colors.Include(x => x.Products).AsQueryable();

            if (search!=null) query = query.Where(x => x.Name.Contains(search));

            var vm = PaginatedList<Color>.Create(query, page, 2);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Color color)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Colors.Any(x => x.Name == color.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }

            _context.Colors.Add(color);

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Color color = _context.Colors.FirstOrDefault(x => x.Id == id);

            if (color == null) return View("error");


            return View(color);
        }

        [HttpPost]
        public IActionResult Edit(Color color)
        {
            if (!ModelState.IsValid)
                return View();

            Color existColor = _context.Colors.FirstOrDefault(x => x.Id == color.Id);

            if (existColor == null) return View("error");

            if (color.Name!=existColor.Name &&  _context.Colors.Any(x => x.Name==color.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            existColor.Name = color.Name;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Color color = _context.Colors.Find(id);

            if (color == null) return StatusCode(404);

            if (_context.Products.Any(x => x.ColorId == id)) return StatusCode(400);

            _context.Colors.Remove(color);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
