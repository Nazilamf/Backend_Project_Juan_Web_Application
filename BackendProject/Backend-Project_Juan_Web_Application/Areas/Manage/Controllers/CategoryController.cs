using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Area("manage")]
    public class CategoryController : Controller
    {



        private readonly JuanDbContext _context;

        public CategoryController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Categories.Include(x => x.Products).AsQueryable();

            if (search!=null) query = query.Where(x => x.Name.Contains(search));

            return View(PaginatedList<Category>.Create(query, page, 2));
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Category category)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Categories.Any(x => x.Name == category.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }

            _context.Categories.Add(category);

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Category category = _context.Categories.FirstOrDefault(x => x.Id == id);

            if (category == null) return View("error");


            return View(category);
        }

        [HttpPost]
        public IActionResult Edit(Category category)
        {
            if (!ModelState.IsValid)
                return View();

            Category existCategory = _context.Categories.FirstOrDefault(x => x.Id == category.Id);

            if (existCategory == null) return View("error");

            if (category.Name!=existCategory.Name &&  _context.Categories.Any(x => x.Name==category.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            existCategory.Name = category.Name;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Category category = _context.Categories.Find(id);

            if (category == null) return StatusCode(404);

            if (_context.Products.Any(x => x.CategoryId == id)) return StatusCode(400);

            _context.Categories.Remove(category);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
