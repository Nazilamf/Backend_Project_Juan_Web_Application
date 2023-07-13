using Backend_Project_Juan_Web_Application.Attributes;
using Microsoft.EntityFrameworkCore.Diagnostics;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class PostBanner
    {
        public int Id { get; set; } 

        [MaxLength(50)]
        public string Title1 { get; set; }
        [MaxLength(50)]
        public string Title2 { get; set; }
        [MaxLength(50)]
        public string Title3 { get; set; }

        public string BackImage { get; set; }

        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }
    }
}
