using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class ShopViewModel
    {
        public List<Product> Products { get; set; }
        public List<Category> Categories { get; set;}

        public List<Brand> Brands { get; set; }

        public List<Size> Sizes { get; set; }

        public List<Color> Colors { get; set; } 

        public int ?SelectedCategoryId { get; set; }
        public List<int>SelectedBrandId { get; set; }

        public int?SelectedColorId { get; set; }
        public List<int> SelectSizesId { get; set; }

        public decimal MinPrice { get; set; }
        public decimal MaxPrice { get; set; }
        public decimal SelectedMinPrice { get; set; }
        public decimal SelectedMaxPrice { get; set; }
        public List<SelectListItem> SortItems { get; set; }




    }
}
