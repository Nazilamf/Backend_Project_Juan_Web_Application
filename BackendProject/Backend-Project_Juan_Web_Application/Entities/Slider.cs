using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Slider
    {
        public int Id { get; set; }
        public int Order { get; set; }

        [MaxLength(50)]
        public string Title1 { get; set; }
        [MaxLength(50)]
        public string Title2 { get; set; }
        [MaxLength(150)]
        public string Desc { get; set; }
        [MaxLength(150)]
        public string ButtonText { get; set; }
        [MaxLength(150)]
        public string ButtonUrl { get; set; }
        [MaxLength(30)]
        public string ButtonBackgroundColor { get; set; }
        [Required] 
        [MaxLength(150)]
        public string ImageName { get; set; }
        
    }
}
