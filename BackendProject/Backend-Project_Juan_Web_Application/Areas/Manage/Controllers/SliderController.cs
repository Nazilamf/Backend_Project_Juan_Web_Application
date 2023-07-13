using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Helpers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize]
    [Area("manage")]
    public class SliderController : Controller
    {
       
        private readonly JuanDbContext _context;
        private readonly IWebHostEnvironment _env;

        public SliderController(JuanDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.Sliders.AsQueryable();
            return View(PaginatedList<Slider>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Slider slider)
        {
            if (!ModelState.IsValid) return View();

            if (slider.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            if (slider.ImageFile.ContentType!="image/jpeg" && slider.ImageFile.ContentType != "image/png")
            {
                ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                return View();
            }

            slider.ImageName = FileManager.Save(slider.ImageFile, _env.WebRootPath, "manage/assets/uploads/slider");

            _context.Sliders.Add(slider);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Slider slider = _context.Sliders.Find(id);

            if (slider == null) return View("Error");

            return View(slider);
        }

        [HttpPost]
        public IActionResult Edit(Slider slider)
        {
            if (!ModelState.IsValid) { return View(slider); }

            Slider existSlider = _context.Sliders.Find(slider.Id);

            if (existSlider == null) return View("Error");


            string removableImageName = null;

            if (slider.ImageFile != null)
            {
                if (slider.ImageFile.ContentType != "image/jpeg" && slider.ImageFile.ContentType != "image/png")
                {
                    ModelState.AddModelError("ImageFile", "ImageFile must be .jpg,.jpeg or .png");
                    return View(slider);
                }

                removableImageName = existSlider.ImageName;
                existSlider.ImageName = FileManager.Save(slider.ImageFile, _env.WebRootPath, "manage/assets/uploads/slider");
            }
            existSlider.Order = slider.Order;
            existSlider.Title1 = slider.Title1;
            existSlider.Title2 = slider.Title2;
            existSlider.ButtonText = slider.ButtonText;
            existSlider.ButtonUrl = slider.ButtonUrl;
            existSlider.Desc = slider.Desc;
          
           

            _context.SaveChanges();

            if (removableImageName!=null) FileManager.Delete(_env.WebRootPath, "manage/assets/uploads/slider", removableImageName);

            return RedirectToAction("index");
        }
    }
}
