using Backend_Project_Juan_Web_Application.Entities;
using System.Diagnostics.Eventing.Reader;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class ProductDetailViewModel
    {
        public Product Product { get; set; }

        public List<Product> RelatedProduct {  get; set; }

        public ProductReview productReview { get; set; }
    }
}
