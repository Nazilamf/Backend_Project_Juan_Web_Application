using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class ContactUsController : Controller
    {
        private readonly JuanDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public ContactUsController(JuanDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;

        }


        public IActionResult Index()
        {
            ContactViewModel Vm = new ContactViewModel();
           

            string userId = User.Identity.IsAuthenticated ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

         
            if (userId != null)
            {

                AppUser user = _userManager.FindByIdAsync(userId).Result;
                Vm.FullName = user.FullName;
                Vm.Email = user.Email;
                Vm.Phone =user.PhoneNumber;
                



            }
            return View(Vm);

        }


        [HttpPost]
        public async Task<IActionResult> Create(ContactUs contact)


        {
          
            string userId = (User.Identity.IsAuthenticated && User.IsInRole("Member")) ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            AppUser user = (User.Identity.IsAuthenticated && User.IsInRole("Member")) ? await _userManager.FindByIdAsync(userId) : null;

            if (!ModelState.IsValid)
            {
                ContactUs contactUs = new ContactUs
                { AppUserId=contact.AppUserId,
                FullName= contact.FullName,
                    Email= contact.Email,
                    Phone= contact.Phone,
                    Subject= contact.Subject,
                    Text= contact.Text,

                };
                
            }

            _context.ContactUs.Add(contact);
            _context.SaveChanges();
            

           
            return RedirectToAction("index", "home");
        }

    }
}
