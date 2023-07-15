using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_Project_Juan_Web_Application.Migrations
{
    public partial class UpdateOrderItem : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "CostPrice",
                table: "OrderItems",
                newName: "UnitSalePrice");

            migrationBuilder.AddColumn<decimal>(
                name: "UnitCostPrice",
                table: "OrderItems",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UnitCostPrice",
                table: "OrderItems");

            migrationBuilder.RenameColumn(
                name: "UnitSalePrice",
                table: "OrderItems",
                newName: "CostPrice");
        }
    }
}
