using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddScoped<LayoutService>();

builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<JuanDbContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("Default"));
});



builder.Services.AddHttpContextAccessor();

var app = builder.Build();
app.UseStaticFiles();

app.MapControllerRoute(
      name: "areas",
      pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}"
    );
app.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");

app.Run();
