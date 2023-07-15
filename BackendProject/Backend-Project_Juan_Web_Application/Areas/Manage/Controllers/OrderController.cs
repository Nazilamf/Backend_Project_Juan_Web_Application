using Backend_Project_Juan_Web_Application.Areas.Manage.ViewModels;
using Backend_Project_Juan_Web_Application.DAL;
using Backend_Project_Juan_Web_Application.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace Backend_Project_Juan_Web_Application.Areas.Manage.Controllers
{
    [Area("manage")]
    public class OrderController : Controller
    {
        private readonly JuanDbContext _context;

        public OrderController(JuanDbContext context)
        {
            _context=context;
        }
        public IActionResult Index( int page=1)
        {

            var query = _context.Orders.Include(x => x.OrderItems).AsQueryable();   
            return View(PaginatedList<Order>.Create(query,page,4));

            return View();
        }

        public IActionResult Edit(int id) 
        {
            Order order = _context.Orders.Include(x => x.OrderItems).ThenInclude(x => x.Product).FirstOrDefault(x => x.Id == id);

            if (order == null) return View("error");

            return View(order);
            
        }


        public async Task<IActionResult> Accept(int id)
        {
            Order order = _context.Orders.Include(x => x.AppUser).FirstOrDefault(x => x.Id == id);

            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Accepted;
            _context.SaveChanges();

           

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Reject(int id)
        {
            Order order = _context.Orders.Include(x => x.AppUser).FirstOrDefault(x => x.Id == id);

            if (order == null || order.Status != Enums.OrderStatus.Pending) return View("error");

            order.Status = Enums.OrderStatus.Rejected;
            _context.SaveChanges();

          

            return RedirectToAction("Index");
        }
    }
}

