namespace Backend_Project_Juan_Web_Application.Entities
{
    public class BasketItem
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int Count { get; set; }  

        public string AppUserId { get; set; }

        public Product Product { get; set; }
        public AppUser AppUser { get; set; }

    }
}
