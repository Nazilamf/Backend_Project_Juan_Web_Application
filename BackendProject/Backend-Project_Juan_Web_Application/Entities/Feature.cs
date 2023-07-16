using Backend_Project_Juan_Web_Application.Attributes;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Feature
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(25)]
        public string Title { get; set; }
        [MaxLength(50)]
        public string Desc { get; set; }
        
        [MaxLength(50)]

        public string Icon { get; set; }
        [MaxLength(50)]
        public string Color { get; set; }


        [NotMapped]
        [MaxFileLength(2097152)]
        [AllowedTypes("image/png", "image/jpeg")]
        public IFormFile ImageFile { get; set; }
    }
}
