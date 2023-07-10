using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Color
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        public List<Product> Products { get; set; } = new List<Product>();

    }
}
