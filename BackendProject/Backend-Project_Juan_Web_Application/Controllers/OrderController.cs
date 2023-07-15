using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Migrations;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NuGet.Protocol;
using System.Diagnostics.Eventing.Reader;
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
            Vm.TotalAmount=Vm.Items.Sum(x => x.Price *x.Count);


            string userId = User.Identity.IsAuthenticated ? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            Vm.Items = _generateCheckoutItems(userId);
            if(userId != null)
            {

                AppUser user = _userManager.FindByIdAsync(userId).Result;
                Vm.Order.FullName = user.FullName;
                Vm.Order.Email = user.Email;
                Vm.Order.Phone =user.PhoneNumber;

               
            }
              return View(Vm);

        }

        [HttpPost]
        public async Task<IActionResult> Create(OrderCreateViewModel orderVm)
               

        {
            string userId =( User.Identity.IsAuthenticated && User.IsInRole("Member" ))? User.FindFirstValue(ClaimTypes.NameIdentifier) : null;

            AppUser user =( User.Identity.IsAuthenticated && User.IsInRole("Member")) ? await _userManager.FindByIdAsync(userId) : null;

            if (!ModelState.IsValid)
            {
                CheckOutViewModel vm = new CheckOutViewModel();
                vm.Order = orderVm;
                vm.Items = _generateCheckoutItems(userId);
                vm.TotalAmount=vm.Items.Sum(x => x.Price *x.Count);
                return View("Checkout", vm);
            }

            Order order = new Order
            {
                FullName= user== null?orderVm.FullName: user.FullName,
                Email=user== null ? orderVm.Email: user.Email,
                Phone=user== null ? orderVm.Phone:user.PhoneNumber,
                Adress= orderVm.Adress,
                CreatedDate = DateTime.UtcNow.AddHours(4),
                Status= Enums.OrderStatus.Pending,
                Note= orderVm.Note,
                AppUserId = userId,
                OrderItems = _generateOrderItems(userId)

            };
        
            order.TotalAmount = order.OrderItems.Sum(x => x.UnitDiscountPrice *x.Count);


            _context.Orders.Add(order);
            _context.SaveChanges();
            _clearBasket(userId);

            if(user!= null)
            {
                return RedirectToAction("profile", "account",new {tab="order"});
            }
            return RedirectToAction("index", "home");
        }

        private List<OrderItem>_generateOrderItems(string userId =null )
        {
            List<OrderItem> items = new List<OrderItem>();
            if (userId != null)
            {
                var basketItems = _context.BasketItems.Include(x => x.Product).ThenInclude(x => x.ProductImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId== userId).ToList();
                items = basketItems.Select(x => new OrderItem
                {
                    ProductId= x.ProductId,
                    Count =x.Count,
                    UnitDiscountPrice =x.Product.DiscountPrice,
                    UnitCostPrice = x.Product.CostPrice,
                    UnitSalePrice = x.Product.SalePrice

                }).ToList();

            }
            else
            {
                var basketstr = Request.Cookies["basket"];

                if(basketstr != null)
                {
                    var basketitems = JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);

                    foreach (var bi in basketitems)
                    {
                        var product = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x => x.Id==bi.ProductId);
                        OrderItem orderItem = new OrderItem
                        {
                            ProductId= bi.ProductId,
                            Count = bi.Count,
                            UnitCostPrice = product.CostPrice,
                            UnitSalePrice = product.SalePrice,
                            UnitDiscountPrice= product.DiscountPrice

                        };
                    }
                }
            }
            return items;
        }

       private  List<CheckOutItemViewModel> _generateCheckoutItems (string userId = null)
        {
            List<CheckOutItemViewModel> items = new List<CheckOutItemViewModel>();
            if (userId != null)
            {
                var basketItems = _context.BasketItems.Include(x => x.Product).ThenInclude(x => x.ProductImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId== userId).ToList();

                items =basketItems.Select(x => new CheckOutItemViewModel
                {
                    Count = x.Count,
                    ProductName =x.Product.Name,
                    Price=x.Product.DiscountPrice,
                    Image=x.Product.ProductImages.FirstOrDefault(x => x.PosterStatus==true).ImageName,


                }).ToList();

                
            }

            else
            {
                string basketstr = Request.Cookies["basket"];

                if (basketstr!= null)
                {
                    List<BasketCookieItemViewModel> basketItems = JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);

                    foreach (var item in basketItems)
                    {
                        var product = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x => x.Id==item.ProductId);
                        var checkoutitem = new CheckOutItemViewModel
                        {
                            Count = item.Count,
                            ProductName =product.Name,
                            Price=product.DiscountPrice,
                            Image=product.ProductImages.FirstOrDefault(x => x.PosterStatus==true).ImageName
                        };
                        items.Add(checkoutitem);

                    }

                }
            }
            return items;
        }

        private void _clearBasket(string userId= null)
        {
            if (userId == null)
                Response.Cookies.Delete("basket");
            else
            {
                _context.RemoveRange(_context.BasketItems.Where(x => x.AppUserId == userId).ToList());
                _context.SaveChanges();
            }
        }
    }
}

