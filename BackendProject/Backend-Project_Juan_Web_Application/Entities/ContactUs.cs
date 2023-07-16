using Backend_Project_Juan_Web_Application.Enums;
using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class ContactUs
    {
        public int Id { get; set; }
        public string? AppUserId { get; set; }
        [MaxLength(35)]
        public string FullName { get; set; }
        [MaxLength(35)]
        public string Email { get; set; }
        
        [MaxLength(15)]
        public string Phone { get; set; }
        [MaxLength(200)]
        public string Text { get; set; }
        [MaxLength(35)]
        public string Subject { get; set; }
        public DateTime CreatedDate { get; set; }

        public AppUser AppUser { get; set; }
    }
}
