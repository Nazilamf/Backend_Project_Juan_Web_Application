using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend_Project_Juan_Web_Application.Migrations
{
    public partial class CreatePosterBanner : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "postBanners",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title1 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Title2 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Title3 = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    BackImage = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_postBanners", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "postBanners");
        }
    }
}
