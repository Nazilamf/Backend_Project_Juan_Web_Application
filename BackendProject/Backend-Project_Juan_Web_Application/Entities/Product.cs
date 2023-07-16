using Backend_Project_Juan_Web_Application.Attributes;
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

        public bool? Gender { get; set; } = null!;
        public bool StockStatus { get; set; }
      
        public bool IsNew { get; set; }
        public bool IsDeleted { get; set; }

        public byte Rate { get; set; }



        public int ColorId { get; set; }
        public Color Color { get; set; }
        public Category Category { get; set; }
        public int CategoryId {get;set; }
        public int BrandId { get; set; }
        public Brand Brand { get; set; }
        public List<ProductSize> ProductSizes { get; set; }= new List<ProductSize>();
        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile PosterFile { get; set; }
        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public List<IFormFile> ImageFiles { get; set; } = new List<IFormFile>();
        [NotMapped]
        public List<int> SizeIds { get; set; } = new List<int>();
        [NotMapped]
        public List<int> ProductImageIds { get; set; } = new List<int>();
        public List<ProductImage> ProductImages { get; set; } = new List<ProductImage>();

        public ICollection<BasketItem> BasketItems { get; set; }

        public ICollection<ProductReview> ProductReviews { get; set; } = new List<ProductReview>();






    }
}
