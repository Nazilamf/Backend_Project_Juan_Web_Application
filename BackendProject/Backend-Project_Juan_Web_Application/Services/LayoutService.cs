using Backend_Project_Juan_Web_Application.DAL;

namespace Backend_Project_Juan_Web_Application.Services
{
    public class LayoutService
    {
        private readonly JuanDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LayoutService(JuanDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }


        public Dictionary<string, string> GetSettings()
        {
            return _context.Settings.ToDictionary(x => x.Key, x => x.Value);
        }
    }
}
