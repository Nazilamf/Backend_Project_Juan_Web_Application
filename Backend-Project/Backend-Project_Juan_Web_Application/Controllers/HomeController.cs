using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
