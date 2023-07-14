using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NuGet.Packaging.Signing;
using System.Security.Claims;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class ProductController : Controller
    {
        private readonly JuanDbContext _context;

        public ProductController(JuanDbContext context)
        {
            _context = context;
        }
        public IActionResult GetDetail(int id)
        {

            Product product = _context.Products.Include(x=>x.ProductImages).Include(x=>x.ProductSizes).Include(x=>x.Category).Include(x=>x.Brand).FirstOrDefault(x => x.Id== id);
            return PartialView("_ProductModalPartial", product);
        }   

        public IActionResult AddToBasket(int id)
        {
            BasketViewModel basketVM = new BasketViewModel();
            if (User.Identity.IsAuthenticated)
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
               var basketItems = _context.BasketItems.Where(x => x.AppUserId = userId).ToList();

                var basketItem = basketItems.Fi

            }
            else
            {
                var basketstr = Request.Cookies["basket"];
                List<BasketCookieItemViewModel> cookieitems = null;
                if (basketstr== null)
                {

                    cookieitems = new List<BasketCookieItemViewModel>();
                }
                else
                {
                    cookieitems= JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);

                }

                BasketCookieItemViewModel cookieitem = cookieitems.FirstOrDefault(x => x.ProductId== id);
                if (cookieitem==null)
                {
                    cookieitem = new BasketCookieItemViewModel()
                    {
                        ProductId= id,
                        Count=1
                    };
                    cookieitems.Add(cookieitem);
                }
                else
                {
                    cookieitem.Count++;
                }


                HttpContext.Response.Cookies.Append("basket", JsonConvert.SerializeObject(cookieitems));

                
                foreach (var ci in cookieitems)
                {
                    BasketItemViewModel basketItem = new BasketItemViewModel()
                    {

                        Count = ci.Count,
                        Product = _context.Products.Include(x => x.ProductImages.Where(x => x.PosterStatus==true)).FirstOrDefault(x => x.Id == ci.ProductId)
                    };

                    basketVM.Items.Add(basketItem);
                }


                
            }

            return PartialView("_BasketPartialView", basketVM);
        }

        public IActionResult ShowBasket()
        {
            var datastr = HttpContext.Request.Cookies["basket"];
            var data = JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(datastr);
            return Json(data);
        }
    }
}
