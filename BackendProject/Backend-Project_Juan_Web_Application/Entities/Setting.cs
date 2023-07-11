using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Setting
    {
        [Key]
        public string Key { get; set; }
        [Required]
        [MaxLength(100)]
        public string Value { get; set; }
    }
}
