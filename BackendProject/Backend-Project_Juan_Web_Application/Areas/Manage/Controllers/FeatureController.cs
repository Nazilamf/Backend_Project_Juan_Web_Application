using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize(Roles = "Admin,SuperAdmin")]
    [Area("manage")]
    public class FeatureController : Controller
    {
        private readonly JuanDbContext _context;
        private readonly IWebHostEnvironment _env;

        public FeatureController(JuanDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.Features.AsQueryable();

            return View(PaginatedList<Feature>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Feature feature)
        {
            if (!ModelState.IsValid) return View();

            if (feature.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (feature.ImageFile.ContentType!="image/jpeg" && feature.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            feature.Icon = FileManager.Save(feature.ImageFile, _env.WebRootPath, "manage/assets/uploads/icon");

            _context.Features.Add(feature);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Feature feature = _context.Features.Find(id);

            if (feature == null) return View("Error");

            return View(feature);
        }

        [HttpPost]
        public IActionResult Edit(Feature feature)
        {
            if (!ModelState.IsValid) { return View(feature); }

            Feature existFeature = _context.Features.Find(feature.Id);

            if (existFeature == null) return View("Error");


            string removableImageName = null;

            if (feature.ImageFile != null)
            {
                if (feature.ImageFile.ContentType != "image/jpeg" && feature.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(feature);
                }

                removableImageName = existFeature.Icon;
                existFeature.Icon = FileManager.Save(feature.ImageFile, _env.WebRootPath, "manage/assets/uploads/icon");
            }
            existFeature.Title = feature.Title;
            existFeature.Desc = feature.Desc;
            existFeature.Color = feature.Color;

            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/icon", removableImageName);

            return RedirectToAction("index");
        }


        public IActionResult Delete(int id)
        {
            Feature feature = _context.Features.Find(id);

            if (feature == null) return StatusCode(404);

            _context.Features.Remove(feature);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}


