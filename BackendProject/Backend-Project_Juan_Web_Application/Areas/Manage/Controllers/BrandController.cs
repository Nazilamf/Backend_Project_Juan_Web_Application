using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Humanizer.Localisation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Area("manage")]
    public class BrandController : Controller
    {
        private readonly JuanDbContext _context;

        public BrandController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;

            var query = _context.Brands.Include(x => x.Products).AsQueryable();

            if (search!=null) query = query.Where(x => x.Name.Contains(search));

            return View(PaginatedList<Brand>.Create(query, page, 2));
        }


        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Brand brand)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Brands.Any(x => x.Name == brand.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }

            _context.Brands.Add(brand);

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
           Brand brand = _context.Brands.FirstOrDefault(x => x.Id == id);

            if (brand == null) return View("error");


            return View(brand);
        }

        [HttpPost]
        public IActionResult Edit(Brand brand)
        {
            if (!ModelState.IsValid)
                return View();

            Brand existBrand = _context.Brands.FirstOrDefault(x => x.Id == brand.Id);

            if (existBrand == null) return View("error");

            if (brand.Name!=existBrand.Name &&  _context.Brands.Any(x => x.Name==brand.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            existBrand.Name = brand.Name;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
           Brand brand = _context.Brands.Find(id);

            if (brand == null) return StatusCode(404);

            if (_context.Products.Any(x => x.BrandId == id)) return StatusCode(400);

            _context.Brands.Remove(brand);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
