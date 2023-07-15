using Backend_Project_Juan_Web_Application.Entities;

namespace Backend_Project_Juan_Web_Application.ViewModels
{
    public class ProfileViewModel
    {
        public MemberUpdateViewModel Member { get; set; }

        public List <Order> Orders { get; set; }
    }
}
