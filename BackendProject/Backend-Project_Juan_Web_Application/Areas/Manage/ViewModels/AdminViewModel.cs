using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Security.Cryptography.X509Certificates;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels
{
    public class AdminViewModel 
    {
        [Required]
        [MaxLength(20)]
        public string UserName { get; set; }

        [Required]
        [MaxLength(20)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        
    }
}
