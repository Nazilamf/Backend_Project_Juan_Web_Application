using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.DAL
{
    public class JuanDbContext:IdentityDbContext
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

        public DbSet <PostBanner> PostBanners { get; set; }

        public DbSet <AppUser> AppUsers { get; set; }   

        public DbSet <BasketItem> BasketItems { get; set; }

        public DbSet <OrderItem > OrderItems { get; set; }

        public DbSet <Order> Orders { get; set; }

        public DbSet <ProductReview > ProductReviews { get; set; }
        public DbSet <BrandLogo> BrandLogos { get; set; }   
        public DbSet<ContactUs> ContactUs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        { 
            modelBuilder.Entity<ProductSize>().HasKey(x => new { x.ProductId, x.SizeId });
            base.OnModelCreating(modelBuilder);
        }

    }
}
