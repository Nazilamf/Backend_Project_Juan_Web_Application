﻿using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.ViewModels;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace Backend_Project_Juan_Web_Application.Services
{
    public class LayoutService
    {
        private readonly JuanDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LayoutService(JuanDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }


        public Dictionary<string, string> GetSettings()
        {
            return _context.Settings.ToDictionary(x => x.Key, x => x.Value);
        }

        public List<Category> GetCategories()
        {
            return _context.Categories.ToList();
        }

        public List<Brand> GetBrands()
        {
            return _context.Brands.ToList();    
        }

        

        public BasketViewModel GetBasket()
        {

            var basketVM = new BasketViewModel();
            var basketstr = _httpContextAccessor.HttpContext.Request.Cookies["basket"];

            List<BasketCookieItemViewModel> cookieItems = null;
            if(basketstr== null)
            {
                cookieItems= new List<BasketCookieItemViewModel>();
            }
            else
            {
                cookieItems=JsonConvert.DeserializeObject<List<BasketCookieItemViewModel>>(basketstr);
            }

            basketVM.Items = new List<BasketItemViewModel>();
            foreach (var cookieItem in cookieItems)
            {
                BasketItemViewModel item = new BasketItemViewModel()
                {
                    Count= cookieItem.Count,
                    Product = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x => x.Id == cookieItem.ProductId)
                    

                };
                basketVM.Items.Add(item);
                basketVM.TotalAmount+=(item.Product.DiscountPrice*item.Count);
            }
            return basketVM;
        }
    }
}
