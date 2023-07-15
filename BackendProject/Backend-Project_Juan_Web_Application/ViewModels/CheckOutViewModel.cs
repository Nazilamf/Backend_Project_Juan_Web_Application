using Microsoft.AspNetCore.Mvc;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class CheckOutViewModel
    {
        public List<CheckOutItemViewModel> Items{ get; set; }  = new List<CheckOutItemViewModel>();
        public decimal TotalAmount { get; set; }

        public OrderCreateViewModel Order { get; set; }

    }
    
}
