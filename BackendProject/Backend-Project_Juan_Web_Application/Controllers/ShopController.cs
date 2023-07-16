using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing;
using System.Security.Cryptography.Xml;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class ShopController : Controller
    {
        private readonly JuanDbContext _context;

        public ShopController(JuanDbContext context)
        {
            _context=context;
        }
        public IActionResult Index(int? categoryId = null, List<int> brandId = null, int?colorId =null, List<int>ProductSizesId = null,decimal?minPrice=null,decimal?maxPrice=null)

        {
            var query = _context.Products.Where(x=>x.IsDeleted ==false).Include(x => x.ProductImages.Where(x => x.PosterStatus ==true)).Include(x => x.Brand).Include(x => x.Category).Include(x => x.ProductSizes).ThenInclude(x => x.Size).AsQueryable();

            ShopViewModel vm = new ShopViewModel();
            vm.MaxPrice=query.Max(x => x.SalePrice);
            vm.MinPrice=query.Min(x => x.SalePrice);

            if (categoryId != null)
            {
                query =query.Where(x=>x.CategoryId== categoryId);   
            }
            if(brandId.Count>0)
            {
                query = query.Where(x => brandId.Contains(x.BrandId));
            }
            if(colorId !=null)
            {
               query=query.Where(x=>x.ColorId == colorId);
            }
            if (ProductSizesId.Count>0)
            {
                query =query.Where(x => ProductSizesId.Contains(x.Id));
            }

            if(minPrice != null && maxPrice!=null)
            {
                query =query.Where(x=>x.SalePrice>=minPrice && x.SalePrice<=maxPrice);
            }

            vm.Products= query.ToList();
                vm.Categories = _context.Categories.Include(x => x.Products).ToList();
                vm.Brands = _context.Brands.Include(x => x.Products).ToList();
                vm.Colors = _context.Colors.Include(x => x.Products).ToList();
                vm.Sizes = _context.Sizes.Include(x => x.ProductSizes).ToList();
                vm.SelectedCategoryId= categoryId;
            vm.SelectedBrandId= brandId;
            vm.SelectedColorId = colorId;
            vm.SelectSizesId=ProductSizesId;
            vm.SelectedMinPrice = minPrice==null ? vm.MinPrice :(decimal) minPrice;
            vm.SelectedMaxPrice =maxPrice==null ? vm.MaxPrice :(decimal) maxPrice;
       
            return View(vm);
        }
    }
}
