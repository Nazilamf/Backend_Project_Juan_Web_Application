using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Linq;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize(Roles = "Admin,SuperAdmin")]
    [Area("manage")]
    public class SettingController : Controller
    {
        private readonly JuanDbContext _context;

        public SettingController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page = 1, string search = null)
        {
            ViewBag.Search = search;
          
            
                var query = _context.Settings.AsQueryable();
            if (search!=null) query = query.Where(x=>x.Value.Contains(search));  
            return View(PaginatedList<Setting>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Setting setting)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Settings.Any(x => x.Value == setting.Value))
            {
                ModelState.AddModelError("Value", "Value is already taken");
                return View();
            }

            _context.Settings.Add(setting);

            _context.SaveChanges();

            return RedirectToAction("index");
        }
        public IActionResult Edit( string key)
        {
            Setting setting = _context.Settings.FirstOrDefault(x => x.Key == key);

            if (setting == null) return View("error");


            return View(setting);
        }

        [HttpPost]
        public IActionResult Edit(Setting setting)
        {
            if (!ModelState.IsValid)
                return View();

            Setting existSetting = _context.Settings.FirstOrDefault(x => x.Key == setting.Key);

            if (existSetting == null) return View("error");

            if (setting.Value!=existSetting.Value &&  _context.Settings.Any(x => x.Value==setting.Value))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            existSetting.Value = setting.Value;
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(string key)
        {
            Setting setting = _context.Settings.Find(key);

            if (setting == null) return StatusCode(404);

            if (_context.Settings.Any(x =>x.Key == key)) return StatusCode(400);

            _context.Settings.Remove(setting);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
