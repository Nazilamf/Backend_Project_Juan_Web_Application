namespace Backend_Project_Juan_Web_Application.Entities
{
    public class OrderItem
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }

        public int Count;

        public decimal UnitDiscountPrice { get; set; }
        public decimal UnitCostPrice { get; set; }

        public decimal UnitSalePrice { get; set; }

        public Product Product { get; set; }
        public Order Order { get; set; }

    }
}
