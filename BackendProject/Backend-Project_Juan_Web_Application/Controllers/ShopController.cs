using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class ShopController : Controller
    {
        private readonly JuanDbContext _context;

        public ShopController(JuanDbContext context)
        {
            _context=context;
        }
        public IActionResult Index()
        {
            var products = _context.Products.Where(x=>x.IsDeleted ==false).Include(x => x.ProductImages.Where(x => x.PosterStatus ==true)).Include(x => x.Brand).Include(x => x.Category).Include(x => x.ProductSizes).ThenInclude(x => x.Size).ToList();
             
            ShopViewModel vm = new ShopViewModel
            {
                Products= products
            };
            return View(vm);
        }
    }
}
