using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Migrations;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Security.Claims;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class OrderController : Controller
    {
        private readonly JuanDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public OrderController(JuanDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;

        }


        public IActionResult CheckOut()
        {
            CheckOutViewModel Vm = new CheckOutViewModel();
            Vm.Order= new OrderCreateViewModel();
           

            string userId = User.Identity.IsAuthenticated ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            if (userId != null)
            {
                var basketItems = _context.BasketItems.Include(x => x.Product).ThenInclude(x => x.ProductImages.Where(x=>x.PosterStatus==true)).Where(x => x.AppUserId== userId).ToList();

                Vm.Items =basketItems.Select(x => new CheckOutItemViewModel
                {
                    Count = x.Count,
                    ProductName =x.Product.Name,
                    Price=x.Product.DiscountPrice,
                    Image=x.Product.ProductImages.FirstOrDefault(x => x.PosterStatus==true).ImageName,


                }).ToList();

                Vm.TotalAmount= Vm.Items.Sum(x => x.Price *x.Count); 

                AppUser user = _userManager.FindByIdAsync(userId).Result;
                Vm.Order.FullName = user.FullName;
                Vm.Order.Email = user.Email;
                Vm.Order.Phone =user.PhoneNumber;

            }

            else
            {
                string basketstr = Request.Cookies["basket"];

                if(basketstr!= null)
                {
                    List<BasketCookieItemViewModel> basketItems = JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);

                    foreach (var item in basketItems)
                    {
                        var product = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x=>x.Id==item.ProductId);
                        var checkoutitem = new CheckOutItemViewModel
                        {
                            Count = item.Count,
                            ProductName =product.Name,
                            Price=product.DiscountPrice,
                            Image=product.ProductImages.FirstOrDefault(x => x.PosterStatus==true).ImageName
                        };
                        Vm.Items.Add(checkoutitem);

                        Vm.TotalAmount= Vm.Items.Sum(product => product.Price *item.Count);


                    }

                }
            }
            return View(Vm);

        }

        [HttpPost]
        public IActionResult Create(OrderCreateViewModel orderVm)
        {
            string userId = User.Identity.IsAuthenticated ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            Order order = new Order
            {
                FullName= orderVm.FullName,
                Email= orderVm.Email,
                Phone= orderVm.Phone,
                Adress= orderVm.Adress,
                CreatedDate = DateTime.UtcNow.AddHours(4),
                Status= Enums.OrderStatus.Pending,
                Note= orderVm.Note,
                AppUserId = userId
                
            };
            if (userId != null)
            {
                var basketItems = _context.BasketItems.Include(x => x.Product).Where(x => x.AppUserId == userId).ToList();
                order.OrderItems = basketItems.Select(x => new /*orderItem*/
                {
            //    ProductId => x.ProductId,
            //    Count= x.Count,
            //    UnitDisc});
            //}

            _context.Orders.Add(order);
            _context.SaveChanges();
            return RedirectToAction("index","home");
        }
    }
}

