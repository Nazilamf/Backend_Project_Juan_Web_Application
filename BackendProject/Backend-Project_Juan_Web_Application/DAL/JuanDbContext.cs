using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.DAL
{
    public class JuanDbContext:DbContext
    {
        public JuanDbContext(DbContextOptions<JuanDbContext>options ):base(options) 
        {

        }

        public DbSet<Brand> Brands { get; set; }
        public DbSet <Category> Categories { get; set; }
        public DbSet <Color> Colors { get; set; }
        public DbSet <Size> Sizes { get; set; }
        public DbSet <Slider > Sliders { get; set; }    
        public DbSet<ProductSize > ProductSizes { get; set; }   
        public DbSet <Product> Products { get; set; }

        public DbSet <Feature> Features { get; set; }   

        public DbSet <Setting> Settings { get; set; }  
        public DbSet <ProductImage> ProductImages { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductSize>().HasKey(x => new { x.ProductId, x.SizeId });
            base.OnModelCreating(modelBuilder);
        }

    }
}
