using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Size
    {
       public int Id { get; set; }
       [Required]
       [MaxLength(50)]
       public string SizeName { get; set; }
       public ICollection <ProductSize > ProductSizes { get; set; } = new List <ProductSize> ();
    }
}
