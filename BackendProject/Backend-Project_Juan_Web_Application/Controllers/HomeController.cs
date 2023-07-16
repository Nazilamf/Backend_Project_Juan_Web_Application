﻿using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Controllers
{
    public class HomeController : Controller
    {

        private readonly JuanDbContext _context;

        public HomeController(JuanDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            HomeViewModel vm = new HomeViewModel
            {
                Sliders = _context.Sliders.OrderBy(x => x.Order).ToList(),
                Features = _context.Features.Take(4).ToList(),
                FeaturedProducts = _context.Products.Include(x => x.ProductImages.Where(x => x.PosterStatus==true)).Take(20).ToList(),
                PostBanners = _context.PostBanners.Take(2).ToList(),
                TopSeller = _context.Products.Include(x => x.ProductImages.Where(x => x.PosterStatus==true)).Where(x => x.Rate>3).Take(4).ToList(),
                BrandLogos = _context.BrandLogos.Take(4).ToList()
            };
            return View(vm);
        }
    }
}
