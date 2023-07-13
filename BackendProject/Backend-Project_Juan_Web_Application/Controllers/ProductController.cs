using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NuGet.Packaging.Signing;

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
            var basketstr = Request.Cookies["basket"];
            List<BasketCookieItemViewModel> items = null;
            if (basketstr== null)
            {

                 items = new List<BasketCookieItemViewModel>();
            }
            else
            {
                items= JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);
               
            }

            BasketCookieItemViewModel item = items.FirstOrDefault(x=>x.ProductId== id); 
            if(item==null)
            {
                item = new BasketCookieItemViewModel()
                {
                    ProductId= id,
                    Count=1
                };
                items.Add(item);
            }
            else
            {
                item.Count++;
            }
         
            items.Add(item);
            HttpContext.Response.Cookies.Append("basket", JsonConvert.SerializeObject(items));
            return RedirectToAction("Index","home");   
        }

        public IActionResult ShowBasket()
        {
            var datastr = HttpContext.Request.Cookies["basket"];
            var data = JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(datastr);
            return Json(data);
        }
    }
}
