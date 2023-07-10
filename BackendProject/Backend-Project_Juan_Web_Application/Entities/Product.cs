using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Product
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal SalePrice { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal DiscountPrice { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal CostPrice { get; set; }

        public bool Gender { get; set; }  
        public bool StockStatus { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsNew { get; set; }
        public bool IsDeleted { get; set; }



        public int ColorId { get; set; }
        public Color Color { get; set; }
        public Category Category { get; set; }
        public int CategoryId {get;set; }
        public int BrandId { get; set; }
        public Brand Brand { get; set; }
        public List<ProductSize> ProductSizes { get; set; }= new List<ProductSize>();



        
        
    }
}
