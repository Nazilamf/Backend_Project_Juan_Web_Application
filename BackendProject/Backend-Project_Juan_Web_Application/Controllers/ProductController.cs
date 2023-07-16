using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Authorization;
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
                var basketItems = _context.BasketItems.Where(x => x.AppUserId ==userId);

                var basketItem = basketItems.FirstOrDefault(x => x.ProductId==id);
                if(basketItem ==null)
                {
                    basketItem = new BasketItem
                    {
                        ProductId = id,
                        Count=1,
                        AppUserId =userId

                    };
                    _context.BasketItems.Add(basketItem);
                }
                else
                {
                    basketItem.Count++;
                }

                _context.SaveChanges();

                var items =_context.BasketItems.Include(x => x.Product).ThenInclude(x => x.ProductImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId ==userId);
                foreach (var bi in items)
                {
                    BasketItemViewModel item = new BasketItemViewModel()
                    {

                        Count = bi.Count,
                        Product = bi.Product
                    };

                    basketVM.Items.Add(item);
                    basketVM.TotalAmount+=(item.Product.DiscountPrice*item.Count);
                }


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
                    basketVM.TotalAmount+=(basketItem.Product.DiscountPrice*basketItem.Count);
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

        public IActionResult DeleteBasket(int id)
        {

            BasketViewModel basketVM = new BasketViewModel();
            if (User.Identity.IsAuthenticated)
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var basketItems = _context.BasketItems.Where(x => x.AppUserId ==userId);

                var basketItem = basketItems.FirstOrDefault(x => x.ProductId==id);

                if (basketItem== null) return View("error");
                else
                {
                    _context.BasketItems.Remove(basketItem);
                    _context.SaveChanges();
                }

                var items = _context.BasketItems.Include(x => x.Product).ThenInclude(x => x.ProductImages.Where(x => x.PosterStatus==true)).Where(x => x.AppUserId ==userId);
                foreach (var bi in items)
                {
                    BasketItemViewModel item = new BasketItemViewModel()
                    {

                        Count = bi.Count,
                        Product = bi.Product
                    };

                    basketVM.Items.Add(item);
                    basketVM.TotalAmount+=(item.Product.DiscountPrice*item.Count);
                }
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
                if(cookieitem==null) { return View("error"); }
                else
                {
                    cookieitems.Remove(cookieitem); 
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
                    basketVM.TotalAmount+=(basketItem.Product.DiscountPrice*basketItem.Count);
                }


            }
            return PartialView("_BasketPartialView", basketVM);

        }


        public IActionResult Detail(int id)
        {
          var vm  =_getProductDetailVm(id);
            if(vm.Product == null)
            {
                return View("error");
            }
            
            return View(vm);
        }


        [Authorize(Roles ="Member")]
        [HttpPost]
        public IActionResult Review(ProductReview productreview)
        {


            if (!ModelState.IsValid)
            {
                var vm = _getProductDetailVm(productreview.ProductId);
                vm.productReview = productreview;

                return View("Detail", vm);
            }
            Product product = _context.Products.Include(x => x.ProductReviews).FirstOrDefault(x => x.Id == productreview.ProductId);
            if (product== null) { return View("error"); }


            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            productreview.AppUserId= userId;
            productreview.ReviewDate = DateTime.UtcNow.AddHours(4);
            product.ProductReviews.Add(productreview);  
            product.Rate =(byte)Math.Ceiling(product.ProductReviews.Average(x => x.Rate)); 
            _context.SaveChanges();
            return RedirectToAction("detail", new { id = productreview.ProductId });


        }

        private ProductDetailViewModel _getProductDetailVm( int id)
        {
            var product = _context.Products.Include(x => x.ProductReviews).ThenInclude(x => x.AppUser).Include(x => x.Category).Include(x => x.Brand).Include(x => x.Color).Include(x => x.ProductSizes).ThenInclude(x => x.Size).Include(x => x.ProductImages).FirstOrDefault(x => x.Id == id);

            var vm = new ProductDetailViewModel
            {
                Product = product,
                RelatedProduct =product!=null? _context.Products.Include(x => x.ProductImages.Where(x => x.PosterStatus==true)).Include(x => x.Brand).Where(x => x.BrandId == product.BrandId).Take(6).ToList(): null ,
                productReview = new ProductReview
                {
                    ProductId = id,
                }
            };

            return vm;
        }




    }
   
}
