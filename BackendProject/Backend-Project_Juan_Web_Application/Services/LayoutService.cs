using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;

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

        public List<Category> GetCategories()
        {
            return _context.Categories.ToList();
        }

        public List<Brand> GetBrands()
        {
            return _context.Brands.ToList();    
        }
    }
}
