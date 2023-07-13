using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Authorize]
    [Area("manage")]
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {

            return View();
        }
    }
}
