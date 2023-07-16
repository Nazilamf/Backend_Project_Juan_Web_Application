using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class ProductReview
    {
        public int Id { get; set; }
        public int  ProductId { get; set;}

        public string AppUserId { get; set;}
       
        [Range(1,5)]
        public byte Rate { get; set;}
        [MaxLength(200)]
        public string Text { get; set;}

        public DateTime ReviewDate { get; set;}
        public Product Product { get; set;}

        public AppUser AppUser { get; set;}
    }
}
