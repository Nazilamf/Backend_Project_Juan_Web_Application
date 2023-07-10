using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Size
    {
       public int Id { get; set; }
       [Required]
       [MaxLength(50)]
       public int SizeName { get; set; }
       public List <ProductSize > ProductSizes { get; set; } = new List <ProductSize > ();
    }
}
