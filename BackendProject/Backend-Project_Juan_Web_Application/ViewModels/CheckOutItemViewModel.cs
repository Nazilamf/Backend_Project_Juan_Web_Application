using Backend_Project_Juan_Web_Application.Entities;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class CheckOutItemViewModel
    {
        public string Image { get; set; }
        public string ProductName { get; set; }

        public int Count { get; set; }

        public decimal Price { get; set; }
    }
}
