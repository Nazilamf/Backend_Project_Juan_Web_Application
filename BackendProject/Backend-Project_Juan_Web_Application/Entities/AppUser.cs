using Microsoft.AspNetCore.Identity;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class AppUser:IdentityUser
    {
        public string FullName { get; set; }
        public ICollection<BasketItem> BasketItems { get; set; } 
    }
}
