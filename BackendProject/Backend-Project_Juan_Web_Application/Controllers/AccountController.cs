using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public AccountController(UserManager<AppUser> userManager,SignInManager<AppUser> signInManager)
        {
            _userManager=userManager;
            _signInManager=signInManager;
        }
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(MemberRegisterViewModel memberVM)
        {

            if (!ModelState.IsValid) { return View(); }
            AppUser user = new AppUser()
            {
                FullName= memberVM.FullName,
                Email= memberVM.Email,
                UserName= memberVM.UserName,
                PhoneNumber = memberVM.Phone
                
            };

            var result =await _userManager.CreateAsync(user, memberVM.Password);
            if(!result.Succeeded) 
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                    return View();
                }
            }
            return RedirectToAction("Login");
        }
        public IActionResult Login()
        {
            return View();  
        }

        [HttpPost]
        public async Task<IActionResult>Login(MemberLoginViewModel memberVm)
        {
            if (!ModelState.IsValid) { return View(); }

            AppUser member = await _userManager.FindByNameAsync(memberVm.UserName);

            if(member == null)
            {
                ModelState.AddModelError(" ", "Shifre ve ya username yalnisdir");
                return View();  
            }

            var result = await _signInManager.PasswordSignInAsync(member,memberVm.Password,false,false);

            if(!result.Succeeded)
            {
                ModelState.AddModelError(" ", "Shifre ve ya username yalnisdir");
                return View();
            }

            return RedirectToAction("index","home");
        }

        public IActionResult Profile()
        {
            if (User.Identity.IsAuthenticated)
            {
                return Content(User.Identity.Name);
            }
            else return Content("User Logged out");
        }
    }
}
