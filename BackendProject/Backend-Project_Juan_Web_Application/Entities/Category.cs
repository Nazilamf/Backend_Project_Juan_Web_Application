using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Category
    {
        public int Id { get; set; }
        [MaxLength(50)]
        public string Name { get; set; }
        public List<Product> Products { get; set; } = new List<Product>();
    }
}
