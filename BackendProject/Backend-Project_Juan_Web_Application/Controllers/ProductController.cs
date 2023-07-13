using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
    }
}
