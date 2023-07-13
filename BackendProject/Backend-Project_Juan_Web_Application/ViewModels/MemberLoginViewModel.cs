using System.ComponentModel.DataAnnotations;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class MemberLoginViewModel
    {
        [Required]
        [MaxLength(50)]
        public string UserName { get; set; }
        [Required]
        [MaxLength(30)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
