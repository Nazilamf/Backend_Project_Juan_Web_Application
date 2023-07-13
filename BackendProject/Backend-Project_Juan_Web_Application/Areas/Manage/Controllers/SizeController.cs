using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize]
    [Area("manage")]
    public class SizeController : Controller
    {
        private readonly JuanDbContext _context;

        public SizeController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Sizes.Include(x=>x.ProductSizes).ThenInclude(x=>x.Product).AsQueryable();

            if (search!=null) query = query.Where(x => x.SizeName.Contains(search));

            var vm = PaginatedList<Size>.Create(query, page, 2);
            if (page>vm.TotalPages) return RedirectToAction("index", new { page = vm.TotalPages, search = search });

            return View(vm);
          
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Size size)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Sizes.Any(x => x.SizeName == size.SizeName))
            {
                ModelState.AddModelError("name", "name is already taken");
                return View();
            }

            _context.Sizes.Add(size);

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Size size = _context.Sizes.FirstOrDefault(x => x.Id == id);

            if (size == null) return View("error");


            return View(size);
        }

        [HttpPost]
        public IActionResult Edit(Size size)
        {
            if (!ModelState.IsValid)
                return View();

            Size existsize = _context.Sizes.FirstOrDefault(x => x.Id == size.Id);

            if (existsize == null) return View("error");

            if (size.SizeName!=existsize.SizeName &&  _context.Sizes.Any(x => x.SizeName==size.SizeName))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            existsize.SizeName = size.SizeName;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Size size = _context.Sizes.Find(id);

            if (size == null) return StatusCode(404);

            if (_context.ProductSizes.Any(x => x.SizeId == id)) return StatusCode(400);

            _context.Sizes.Remove(size);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

    }
}
