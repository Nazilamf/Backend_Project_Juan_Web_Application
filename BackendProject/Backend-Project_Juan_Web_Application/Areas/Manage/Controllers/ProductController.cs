using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Area("manage")]
    public class ProductController : Controller
    {

        private readonly JuanDbContext _context;
        private readonly IWebHostEnvironment _env;

        public ProductController(JuanDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1)
        {
            var query = _context.Products.Include(x => x.Brand).Include(x => x.Category).Include(x => x.ProductSizes).Include(x => x.Color).Where(x => !x.IsDeleted);
            return View(PaginatedList<Product>.Create(query, page, 4));
        }

        public IActionResult Create()
        {
            ViewBag.Categories = _context.Categories.ToList();
            ViewBag.Brands = _context.Brands.ToList();
            ViewBag.Colors = _context.Colors.ToList();
            ViewBag.Sizes = _context.Sizes.ToList();



            return View();
        }

        [HttpPost]
        public IActionResult Create(Product product)
        {
            if (product.PosterFile == null)
                ModelState.AddModelError("PosterFile", "PosterFile is required");



            if (!ModelState.IsValid)
            {
                ViewBag.Categories = _context.Categories.ToList();
                ViewBag.Brands = _context.Brands.ToList();
                ViewBag.Colors = _context.Colors.ToList();
                ViewBag.Sizes = _context.Sizes.ToList();
                return View();
            }

            if (!_context.Categories.Any(x => x.Id == product.CategoryId))
                return View("error");

            if (!_context.Brands.Any(x => x.Id == product.BrandId))
                return View("error");

            if (!_context.Colors.Any(x => x.Id == product.ColorId))
                return View("error");

            ProductImage poster = new ProductImage
            {
                PosterStatus = true,
                ImageName = FileManager.Save(product.PosterFile, _env.WebRootPath, "manage/assets/uploads/products"),
            };
            product.ProductImages.Add(poster);




            foreach (var file in product.ImageFiles)
            {
                ProductImage productImage = new ProductImage
                {
                    PosterStatus = false,
                    ImageName = FileManager.Save(file, _env.WebRootPath, "manage/assets/uploads/products"),
                };
                product.ProductImages.Add(productImage);
            }

            foreach (var sizeid in product.SizeIds)
            {
                if (!_context.Sizes.Any(x => x.Id == sizeid))
                    return View("error");

                ProductSize size = new ProductSize
                {
                    SizeId = sizeid
                };

                product.ProductSizes.Add(size);
            }

            _context.Products.Add(product);

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {


            Product product = _context.Products.Include(x => x.ProductImages).Include(x => x.ProductSizes).FirstOrDefault(x => x.Id == id);

            if (product == null) return View("error");

            product.SizeIds = product.ProductSizes.Select(x => x.SizeId).ToList();

            ViewBag.Categories = _context.Categories.ToList();
            ViewBag.Brands = _context.Brands.ToList();
            ViewBag.Colors = _context.Colors.ToList();
            ViewBag.Sizes = _context.Sizes.ToList();

            return View(product);
        }

        [HttpPost]
        public IActionResult Edit(Product product)
        {
            Product existProduct = _context.Products.Include(x => x.ProductImages).Include(x => x.ProductSizes).FirstOrDefault(x => x.Id ==product.Id);
            if (existProduct == null) return View("Error");

            if (!_context.Categories.Any(x => x.Id == product.CategoryId))
                return View("error");

            if (!_context.Brands.Any(x => x.Id == product.BrandId))
                return View("error");

            if (!_context.Colors.Any(x => x.Id == product.ColorId))
                return View("error");

            existProduct.ProductSizes = new List<ProductSize>();

            foreach (var sizeId in product.SizeIds)
            {
                if (!_context.Sizes.Any(x => x.Id == sizeId))
                    return View("error");

                existProduct.ProductSizes.Add(new ProductSize { SizeId = sizeId });
            }



            existProduct.Name = product.Name;
            existProduct.BrandId = product.BrandId;
            existProduct.SalePrice = product.SalePrice;
            existProduct.CostPrice = product.CostPrice;
            existProduct.DiscountPrice =product.DiscountPrice;
            existProduct.IsNew = product.IsNew;
            existProduct.StockStatus = product.StockStatus;
            existProduct.CategoryId = product.CategoryId;
            existProduct.Gender = product.Gender;
            existProduct.ColorId = product.ColorId;

            List<string> removableImageNames = new List<string>();

            if (product.PosterFile != null)
            {
                ProductImage poster = existProduct.ProductImages.FirstOrDefault(x => x.PosterStatus == true);
                removableImageNames.Add(poster.ImageName);
                poster.ImageName = FileManager.Save(product.PosterFile, _env.WebRootPath, "manage/assets/uploads/product");
            }


            var removableImages = existProduct.ProductImages.FindAll(x => x.PosterStatus==null && !product.ProductImageIds.Contains(x.Id));
            _context.ProductImages.RemoveRange(removableImages);

            removableImageNames.AddRange(removableImages.Select(x => x.ImageName).ToList());


            foreach (var file in product.ImageFiles)
            {
                ProductImage image = new ProductImage
                {
                    PosterStatus = false,
                    ImageName = FileManager.Save(file, _env.WebRootPath, "manage/assets/uploads/product")
                };

                existProduct.ProductImages.Add(image);
            }

            _context.SaveChanges();
            FileManager.DeleteAll(_env.WebRootPath, "manage/uploads/books", removableImageNames);


            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Product product = _context.Products.Find(id);

            if (product == null) return NotFound();

            product.IsDeleted = true;
            _context.SaveChanges();

            return Ok();
        }
    }
}

