using Backend_Project_Juan_Web_Application.Enums;
using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Order
    {

        public int Id { get; set; }
        public string? AppUserId { get; set; }
        [MaxLength(35)]
        public string FullName { get; set; }
        [MaxLength(35)]
        public string Email { get; set; }
        [MaxLength(50)]
        public string Adress { get; set; }
        [MaxLength(15)]
        public string Phone { get; set; }
        [MaxLength(300)]
        public decimal TotalAmount { get; set; }
        public string Note { get; set; }
        public DateTime CreatedDate { get; set; }

        public OrderStatus Status { get; set; }

        public AppUser AppUser { get; set; }
        public List<OrderItem> OrderItems { get; set; } 

    }
}
