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
    public class PosterBannerController : Controller
    {
        private readonly JuanDbContext _context;
        private readonly IWebHostEnvironment _env;

        public PosterBannerController(JuanDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.PostBanners.AsQueryable();
            return View(PaginatedList<PostBanner>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(PostBanner postBanner)
        {
            if (!ModelState.IsValid) return View();

            if (postBanner.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (postBanner.ImageFile.ContentType!="image/jpeg" && postBanner.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            postBanner.BackImage = FileManager.Save(postBanner.ImageFile, _env.WebRootPath, "manage/assets/uploads/banner");

            _context.PostBanners.Add(postBanner);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            PostBanner postBanner = _context.PostBanners.Find(id);

            if (postBanner == null) return View("Error");

            return View(postBanner);
        }

        [HttpPost]
        public IActionResult Edit(PostBanner postBanner)
        {
            if (!ModelState.IsValid) { return View(postBanner); }

            PostBanner existposterBanner = _context.PostBanners.Find(postBanner.Id);

            if (existposterBanner == null) return View("Error");


            string removableImageName = null;

            if (postBanner.ImageFile != null)
            {
                if (postBanner.ImageFile.ContentType != "image/jpeg" && postBanner.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(postBanner);
                }

                removableImageName = existposterBanner.BackImage;
                existposterBanner.BackImage = FileManager.Save(postBanner.ImageFile, _env.WebRootPath, "manage/assets/uploads/banner");
            }
            existposterBanner.Title1 = postBanner.Title1;
            existposterBanner.Title2= postBanner.Title2;
            existposterBanner.Title3= postBanner.Title3;

            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/banner", removableImageName);

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            PostBanner postBanner = _context.PostBanners.Find(id);

            if (postBanner == null) return StatusCode(404);

            if (_context.PostBanners.Any(x=>x.Id == id))
                return StatusCode(400);

            _context.PostBanners.Remove(postBanner);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
