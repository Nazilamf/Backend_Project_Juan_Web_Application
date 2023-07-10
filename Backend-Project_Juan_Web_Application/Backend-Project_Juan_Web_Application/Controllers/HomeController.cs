using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class HomeController : Controller
    {

        private readonly JuanDbContext _context;

        public HomeController(JuanDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            HomeViewModel vm = new HomeViewModel
            {
                Sliders = _context.Sliders.OrderBy(x => x.Order).ToList(),
                Features = _context.Features.Take(4).ToList(),
            };
            return View(vm);
        }
    }
}
