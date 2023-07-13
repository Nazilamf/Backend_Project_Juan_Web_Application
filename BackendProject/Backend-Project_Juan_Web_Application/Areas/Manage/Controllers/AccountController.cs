using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Area("manage")]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public AccountController(UserManager<AppUser>userManager,SignInManager<AppUser>signInManager)
        {
            _userManager= userManager;
            _signInManager=signInManager;
        }

        

        //public async Task<IActionResult> CreateAdmin()
        //{
        //    AppUser admin = new AppUser
        //    {
        //        FullName= "Admin",
        //        UserName = "admin",

        //    };
        //     var result = await _userManager.CreateAsync(admin,"Admin123");
           
        //    return Content("Created");
        //}


        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(AdminViewModel adminVM) 
        {

            AppUser admin =await _userManager.FindByNameAsync(adminVM.UserName);
            if(admin == null) 
            {
                ModelState.AddModelError("","Sifre ve ya username yalnisdir!");
                return View();
            }

            var result = await _signInManager.PasswordSignInAsync(admin, adminVM.Password,false,false);
            if (!result.Succeeded) 
            {
                ModelState.AddModelError("", "Sifre ve ya username yalnisdir!");
                return View();
            }
            return RedirectToAction("Index", "Dashboard");
        }
    }
}
