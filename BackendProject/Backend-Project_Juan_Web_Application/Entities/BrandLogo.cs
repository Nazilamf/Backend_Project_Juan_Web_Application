using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class BrandLogo
    {
        public int Id { get; set; }
        [MaxLength(50)]
        public string ImageName { get; set; }
    }
}
