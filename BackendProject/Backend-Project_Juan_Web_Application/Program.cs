using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Backend_Project_Juan_Web_Application.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<JuanDbContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("Default"));
});

builder.Services.AddIdentity<AppUser, IdentityRole>(opt =>
{
    opt.Password.RequiredLength=8;
    opt.Password.RequireNonAlphanumeric =false;
}).AddDefaultTokenProviders().AddEntityFrameworkStores<JuanDbContext>();

builder.Services.AddScoped<LayoutService>();

builder.Services.AddHttpContextAccessor();

builder.Services.AddHttpContextAccessor();

builder.Services.ConfigureApplicationCookie(options =>
{
    options.Events.OnRedirectToAccessDenied= options.Events.OnRedirectToLogin = context =>
    {
        var uri = new Uri(context.RedirectUri);

        if (context.HttpContext.Request.Path.Value.StartsWith("/manage"))
            context.Response.Redirect("/manage/account/login"+uri.Query);
        else
            context.Response.Redirect("/account/login" + uri.Query);

        return Task.CompletedTask;
    };
});

var app = builder.Build();
app.UseStaticFiles();
app.UseAuthentication();
app.UseAuthorization();


app.MapControllerRoute(
      name: "areas",
      pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}"
    );
app.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");

app.Run();
