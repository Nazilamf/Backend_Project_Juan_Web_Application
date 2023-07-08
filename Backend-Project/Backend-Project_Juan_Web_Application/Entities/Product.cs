namespace Backend_Project_Juan_Web_Application.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal SalePrice { get; set; }
        public decimal DiscountPrice { get; set; }
        public decimal CostPrice { get; set; }
        public bool StockStatus { get; set; }
        public int SizeId { get; set; }
        public int ColorId { get; set; }
        public int CategoryId {get;set; }
        public int GenderId { get; set; }    



        
        
    }
}
