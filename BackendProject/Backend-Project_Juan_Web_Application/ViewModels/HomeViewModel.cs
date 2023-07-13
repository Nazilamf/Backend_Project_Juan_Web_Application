using Backend_Project_Juan_Web_Application.Entities;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class HomeViewModel
    {
        public List<Slider> Sliders { get; set; }
        public List <Feature> Features { get; set; }
        public List<Product> FeaturedProducts { get; set; }

        public List<PostBanner> PostBanners { get; set; }
        public List<Product> TopSeller { get; set; }
    }
}
