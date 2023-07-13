using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.InteropServices;
using System.Security.Claims;

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

            await _userManager.AddToRoleAsync(user, "Member");
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

        [Authorize(Roles="Member")]
        public async  Task<IActionResult> Profile()
        {
            if (User.Identity.IsAuthenticated)
            {
                AppUser member = await _userManager.FindByNameAsync(User.Identity.Name);

                ProfileViewModel vm = new ProfileViewModel()
                {
                  
                    Member = new MemberUpdateViewModel
                    {
                        FullName= member.FullName,
                        UserName=member.UserName,
                        Email=member.Email,
                        Phone=member.PhoneNumber

                    }
                };
                return View(vm);
                    

            }


            else return Content("User Logged out");
        }

        public async Task<IActionResult> MemberUpdate(MemberUpdateViewModel memberVM)
        {
            if (!ModelState.IsValid)
            {
                ProfileViewModel vm = new ProfileViewModel() { Member= memberVM };
                return View("profile", vm);

            }
                AppUser member = await _userManager.FindByNameAsync(User.Identity.Name);
                member.FullName= memberVM.FullName;
                member.UserName= memberVM.UserName;
                member.Email= memberVM.Email;
                member.PhoneNumber= memberVM.Phone;

             var result=await _userManager.UpdateAsync(member);

            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)   
                    ModelState.AddModelError("", item.Description);
                    ProfileViewModel vm = new ProfileViewModel() { Member= memberVM };
                    return View("profile", vm);
                
            }

            //changepassword
                await _signInManager.SignInAsync(member, false);

            return RedirectToAction("profile");

         
        }



        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("index", "home");
        }
    }
}
