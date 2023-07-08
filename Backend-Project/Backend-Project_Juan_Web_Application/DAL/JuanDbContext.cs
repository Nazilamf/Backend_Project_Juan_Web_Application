using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.DAL
{
    public class JuanDbContext:DbContext
    {
        public JuanDbContext(DbContextOptions<JuanDbContext>options ):base(options) 
        {

        }
    }
}
