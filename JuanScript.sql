USE [master]
GO
/****** Object:  Database [Juan_Web_Application]    Script Date: 18.07.2023 00:39:11 ******/
CREATE DATABASE [Juan_Web_Application]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Juan_Web_Application', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Juan_Web_Application.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Juan_Web_Application_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Juan_Web_Application_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Juan_Web_Application] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Juan_Web_Application].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Juan_Web_Application] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET ARITHABORT OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Juan_Web_Application] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Juan_Web_Application] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Juan_Web_Application] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Juan_Web_Application] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Juan_Web_Application] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Juan_Web_Application] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Juan_Web_Application] SET  MULTI_USER 
GO
ALTER DATABASE [Juan_Web_Application] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Juan_Web_Application] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Juan_Web_Application] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Juan_Web_Application] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Juan_Web_Application] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Juan_Web_Application] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Juan_Web_Application] SET QUERY_STORE = ON
GO
ALTER DATABASE [Juan_Web_Application] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Juan_Web_Application]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18.07.2023 00:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandLogos]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandLogos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_BrandLogos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](35) NULL,
	[Email] [nvarchar](35) NULL,
	[Phone] [nvarchar](15) NULL,
	[Text] [nvarchar](200) NULL,
	[Subject] [nvarchar](35) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[Desc] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitDiscountPrice] [decimal](18, 2) NOT NULL,
	[UnitSalePrice] [decimal](18, 2) NOT NULL,
	[UnitCostPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](35) NULL,
	[Email] [nvarchar](35) NULL,
	[Adress] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostBanners]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostBanners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title1] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Title3] [nvarchar](50) NULL,
	[BackImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_PostBanners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageName] [nvarchar](100) NOT NULL,
	[PosterStatus] [bit] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReviews]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[Rate] [tinyint] NOT NULL,
	[Text] [nvarchar](200) NULL,
	[ReviewDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SalePrice] [decimal](18, 2) NOT NULL,
	[DiscountPrice] [decimal](18, 2) NOT NULL,
	[CostPrice] [decimal](18, 2) NOT NULL,
	[Gender] [bit] NULL,
	[StockStatus] [bit] NOT NULL,
	[IsNew] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ColorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[Rate] [tinyint] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSizes]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSizes](
	[ProductId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
 CONSTRAINT [PK_ProductSizes] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Key] [nvarchar](25) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 18.07.2023 00:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Order] [int] NOT NULL,
	[Title1] [nvarchar](50) NULL,
	[Title2] [nvarchar](50) NULL,
	[Desc] [nvarchar](150) NULL,
	[ButtonText] [nvarchar](150) NULL,
	[ButtonUrl] [nvarchar](150) NULL,
	[ButtonBackgroundColor] [nvarchar](30) NULL,
	[ImageName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230710062142_CreateTables', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230710073412_CreateFeatures', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230710113734_SettingTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230710134024_ColorPropertyIntoFeature', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711063837_CreateProductImage', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711103514_SetTitle1AndTitle2AsNullableInSliders', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711103641_ChangeTables', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711105051_ChangeSizeNameType', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711124130_GenderAsNullable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712044503_CreatePosterBanner', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712102238_AppUserTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714124339_IdColumAddedToSettingTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714140346_NonRequiredIconIntoFeature', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714144528_BasketItems', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714232235_OrderAndORderItem', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230714233820_ChangeTypePhone', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230715141553_UpdateOrderItem', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230715160742_TotalAmountintoOrder', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230716104622_ProductReviewCreate', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230716115552_ReviewDate', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230716210248_BrandLogo', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230716225040_Contacts', N'6.0.16')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3955de54-f27b-40c1-a677-3f57947dacca', N'Admin', N'ADMIN', N'392d6c35-0c12-4920-a2d2-35011766c454')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3d122462-a4e5-4166-bc9f-058a521f4a9e', N'SuperAdmin', N'SUPERADMIN', N'806aa288-e322-4257-9e4f-f1361b334321')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e2718673-d668-4c53-8d61-5f682684135f', N'Member', N'MEMBER', N'75d8f5f9-e420-4690-9b3e-962390be166a')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'74fe2ea1-6376-42b2-b51a-16ba5a857b7c', N'3d122462-a4e5-4166-bc9f-058a521f4a9e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'e2718673-d668-4c53-8d61-5f682684135f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5a8fc00a-31a0-4733-a3c3-64afa3cf8fef', N'e2718673-d668-4c53-8d61-5f682684135f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'AppUser', N'Nazila Farajova', N'nazilamf', N'NAZILAMF', N'nazilamf@code.edu.az', N'NAZILAMF@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEBrOIUcy/59WLndKbs2h6fNRBu7AcdmcIBqbinwuZy+mcTSRG7YSzm7TAHy4WHWXlA==', N'I7SA2VBTMTBQ5AQXED4TADUARMFKGLFW', N'4a7abc1d-21b2-46ab-ae90-9175696adf98', N'0504585884', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5a8fc00a-31a0-4733-a3c3-64afa3cf8fef', N'AppUser', N'Mehman', N'mehmanis', N'MEHMANIS', N'mehman@ismailov.com', N'MEHMAN@ISMAILOV.COM', 0, N'AQAAAAEAACcQAAAAEClFMiz1UXKtnTYFbesH/rsBOcgceVP5MxobIbTxQCi33xSBja6FHnYa0Qu6JJIEaQ==', N'3EWKP7QRTJL6Z66BJQRCKPCI4NKMXW6E', N'd02ad678-4e2e-40b9-83a6-86bbc2c8c713', N'0556354675', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'74fe2ea1-6376-42b2-b51a-16ba5a857b7c', N'AppUser', N'SuperAdmin', N'SuperAdmin', N'SUPERADMIN', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEPQOlsG4vqKv2feKYGy0Un1jJF3SWPJgL8y85MvnoR7P2T+U5kkwMYy+CMPRrZdJcg==', N'5TOMA6CCLEKSP3OHVWOL44BYIYO566GT', N'c8300f43-63b0-4884-92cb-5d1cfc6639ee', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([Id], [ProductId], [Count], [AppUserId]) VALUES (5, 3, 1, N'74fe2ea1-6376-42b2-b51a-16ba5a857b7c')
INSERT [dbo].[BasketItems] ([Id], [ProductId], [Count], [AppUserId]) VALUES (6, 4, 1, N'74fe2ea1-6376-42b2-b51a-16ba5a857b7c')
INSERT [dbo].[BasketItems] ([Id], [ProductId], [Count], [AppUserId]) VALUES (13, 5, 1, N'3c74dd6a-8934-4d34-8a84-a7436657a95f')
INSERT [dbo].[BasketItems] ([Id], [ProductId], [Count], [AppUserId]) VALUES (14, 1, 3, N'74fe2ea1-6376-42b2-b51a-16ba5a857b7c')
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
GO
SET IDENTITY_INSERT [dbo].[BrandLogos] ON 

INSERT [dbo].[BrandLogos] ([Id], [ImageName]) VALUES (1, N'br1.png')
INSERT [dbo].[BrandLogos] ([Id], [ImageName]) VALUES (2, N'br2.png')
INSERT [dbo].[BrandLogos] ([Id], [ImageName]) VALUES (3, N'br3.png')
INSERT [dbo].[BrandLogos] ([Id], [ImageName]) VALUES (4, N'br4.png')
INSERT [dbo].[BrandLogos] ([Id], [ImageName]) VALUES (5, N'br5.png')
SET IDENTITY_INSERT [dbo].[BrandLogos] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'
Champion')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Converse')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Nike')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Adidas')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Reebok')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (9, N'NewBalance')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Running Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Walking Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Training&Gym shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Hiking Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Squash Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Outdoor Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Football Shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Tennis shoes')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Casuall')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Black')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Pink')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'White')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Orange')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Green')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Purple')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (9, N'Grey')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (11, N'Blue')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([Id], [AppUserId], [FullName], [Email], [Phone], [Text], [Subject], [CreatedDate]) VALUES (4, NULL, N'Nazila Farajova', N'nazilamf@code.edu.az', N'0504585884', N'Sifarisimde problem var', N'Melumat', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContactUs] ([Id], [AppUserId], [FullName], [Email], [Phone], [Text], [Subject], [CreatedDate]) VALUES (6, NULL, N'Nazila Farajova', N'nazilamf@code.edu.az', N'0504585884', N'Mailda problem var', N'Mail', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [Title], [Desc], [Icon], [Color]) VALUES (4, N'FREE SHIPPING', N'Free shipping on all order', N'policy-1.png', N'bg-1')
INSERT [dbo].[Features] ([Id], [Title], [Desc], [Icon], [Color]) VALUES (5, N'ONLINE SUPPORT', N'Online support 24 hours a day', N'policy-2.png', N'bg-2')
INSERT [dbo].[Features] ([Id], [Title], [Desc], [Icon], [Color]) VALUES (6, N'MONEY RETURN', N'Back guarantee under 5 days', N'policy-3.png', N'bg-3')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (1, 1, 1, CAST(160.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (2, 1, 3, CAST(200.00 AS Decimal(18, 2)), CAST(241.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (3, 2, 1, CAST(160.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (4, 2, 3, CAST(200.00 AS Decimal(18, 2)), CAST(241.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (5, 4, 3, CAST(200.00 AS Decimal(18, 2)), CAST(241.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (6, 4, 4, CAST(410.00 AS Decimal(18, 2)), CAST(466.00 AS Decimal(18, 2)), CAST(380.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (7, 5, 2, CAST(215.00 AS Decimal(18, 2)), CAST(241.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (8, 5, 3, CAST(200.00 AS Decimal(18, 2)), CAST(241.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [UnitDiscountPrice], [UnitSalePrice], [UnitCostPrice]) VALUES (9, 5, 4, CAST(410.00 AS Decimal(18, 2)), CAST(466.00 AS Decimal(18, 2)), CAST(380.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [Note], [CreatedDate], [Status], [TotalAmount]) VALUES (1, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0504585884', NULL, CAST(N'2023-07-15T20:33:11.6990393' AS DateTime2), 3, CAST(560.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [Note], [CreatedDate], [Status], [TotalAmount]) VALUES (2, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0504585884', NULL, CAST(N'2023-07-15T20:53:30.1459191' AS DateTime2), 3, CAST(560.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [Note], [CreatedDate], [Status], [TotalAmount]) VALUES (3, NULL, N'Fidan quliyeva', N'fidan@quliyeva.com', N'Baku', N'0552324547', NULL, CAST(N'2023-07-15T21:06:50.7309621' AS DateTime2), 2, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [Note], [CreatedDate], [Status], [TotalAmount]) VALUES (4, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0504585884', NULL, CAST(N'2023-07-16T00:07:47.0796900' AS DateTime2), 3, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [AppUserId], [FullName], [Email], [Adress], [Phone], [Note], [CreatedDate], [Status], [TotalAmount]) VALUES (5, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', N'Nazila Farajova', N'nazilamf@code.edu.az', N'Baku', N'0504585884', NULL, CAST(N'2023-07-16T12:02:07.9575940' AS DateTime2), 1, CAST(825.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PostBanners] ON 

INSERT [dbo].[PostBanners] ([Id], [Title1], [Title2], [Title3], [BackImage]) VALUES (1, N'SPORTS SHOES', N'20% OFF', N'FOR SPORTS MEN', N'90848a45-e966-412a-98ad-b5aa6bd58c0bnike.jpg')
INSERT [dbo].[PostBanners] ([Id], [Title1], [Title2], [Title3], [BackImage]) VALUES (2, N'SPORTS SHOES', N'50% OFF', N'FOR SPORTS WOMEN', N'99cbea1d-9256-496c-a784-41dcc0e1bd32best-running-shoes-2022-1665658335.png')
SET IDENTITY_INSERT [dbo].[PostBanners] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (1, 1, N'61207c75-6b17-4ee6-adb8-dcd09e0ad0d6nike-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (2, 1, N'e74f183d-57f6-4839-9efd-cba6e524ff4fnike-1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (3, 1, N'dc28ee3a-4e0a-4625-a503-c22c6c6ae74cnike-2.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (4, 1, N'1897f306-c99d-4b5a-a03d-6cdf915cdab9nike-3.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (5, 2, N'f2e078c4-b197-49d4-8d94-2c240a34a75cnike-men-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (6, 2, N'fb29ee71-67f8-4376-9962-90d960a81321nike-men-2.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (7, 3, N'4051715b-b1cd-4b1a-8fae-3c7643a1b7f4product-1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (8, 3, N'07bd6a59-1f81-4e43-9e69-83df6b6807c5product-12.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (9, 4, N'1b9104c5-a560-46dd-be00-8810aaebe2e6s82281_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (10, 4, N'b036d2c4-7a94-4819-b357-4663f524bdf1s82281_2.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (11, 5, N'7dd3d6cc-23b0-4f53-91e7-e79be6ed7f4cCQ2442_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (12, 5, N'd1311f89-67d6-47e9-b5bd-e346f2b226b2CQ2442_3.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (13, 6, N'5cbfb221-a362-4c72-b3fd-90bb47b21c80s21943-es007_3_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (14, 6, N'b6d4d9f3-99c1-43bb-a2fe-24ecfbca7e10s21943-es007_2_1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (15, 9, N'7bedc27f-3ebe-432e-8764-3eabaf71ce93M9166_1_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (16, 9, N'ab7e0caf-7bbb-445f-9a78-42df19fcf9faM9166_3_1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (17, 10, N'58d155b3-73ae-4c71-b352-e306bc353393100069570_SLC_eCom-tif.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (18, 10, N'e44a613b-6f6f-4439-8a12-f08a97a279be100069570_FLT_eCom-tif.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (19, 11, N'9d163dc8-21ac-4041-aba1-847f332bb814Screenshot 2023-07-11 164902.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (20, 11, N'5d090077-8082-4f6c-9683-37f1edecf926Screenshot 2023-07-11 164928.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (21, 12, N'd38c805b-14e0-49c1-8384-3b73aa1e3fc04012f737-20a4-4321-92b4-89f5e6ed3688product-10.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (22, 12, N'66f50c60-b0d1-422e-81b5-ed6227608266slider-2.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (23, 13, N'8691158f-e03d-4f4a-8284-2d645959c311slider-2.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (24, 13, N'62ab744d-dde8-44e0-a2e7-8e945d82a90da7708593-e66c-47be-b907-a277a0856f2bproduct-10.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (25, 14, N'381bb70a-f625-4812-a366-d7ecfb4fef215ab92799-936e-4127-ae62-20af4611c790product-9.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (26, 14, N'bb458d3a-967e-41fe-9dfc-7b6472808b0206ebc6e2-0483-430a-9f51-1876d78163f7nike.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (28, 15, N'd0961a3c-5763-4157-837c-b8dfa608c1d2a7708593-e66c-47be-b907-a277a0856f2bproduct-10.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (29, 15, N'a286c6ce-72cf-4ee3-bb39-76a707bc57415ab92799-936e-4127-ae62-20af4611c790product-9.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (30, 16, N'30a9e36b-ea15-4fcc-85f0-f4c1435441adby1993_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (31, 16, N'b00307b8-2c85-4c89-b09d-9ecf31794957100069570_SLC_eCom-tif.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (32, 16, N'a6bbe598-a6d4-4c94-9454-7485dd365da0by1993_1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (33, 17, N'b47d7635-c801-4a3d-bfc2-86fedabf7af2CQ2035_1_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (34, 17, N'54e1c3c3-e633-44d4-99a3-8e8ea03a6e42100069570_SLC_eCom-tif.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (35, 17, N'09ab1ce6-c972-4b6c-a11d-3bb9e261c7c7by1993_1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (36, 17, N'8ad57721-49d9-4216-890c-1e2e4519a5cbCQ2035_1_1.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (37, 18, N'cc0dfcb4-cda7-46bb-9345-0778ea058ea3by1992_1.jpg', 1)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (38, 18, N'fb8c7e8b-85e6-45f9-99f5-a29e0d9ca256100069570_SLC_eCom-tif.jpg', 0)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus]) VALUES (39, 18, N'cf6fd482-23f5-4c5d-9590-5082e24b7b86by1992_1.jpg', 0)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReviews] ON 

INSERT [dbo].[ProductReviews] ([Id], [ProductId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (5, 3, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', 4, N'Good Product', CAST(N'2023-07-16T17:46:44.5556376' AS DateTime2))
INSERT [dbo].[ProductReviews] ([Id], [ProductId], [AppUserId], [Rate], [Text], [ReviewDate]) VALUES (6, 1, N'3c74dd6a-8934-4d34-8a84-a7436657a95f', 5, N'Like it
', CAST(N'2023-07-16T17:53:06.0796019' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (1, N'Nike Air Max Intrlk Lite', CAST(170.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 1, 1, 1, 0, 4, 1, 3, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (2, N'Nike Precision VI', CAST(241.00 AS Decimal(18, 2)), CAST(215.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 0, 1, 1, 0, 4, 3, 3, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (3, N'Nike Air Zoom Pegasus 39', CAST(241.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), 0, 1, 1, 0, 2, 8, 3, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (4, N'Adidas Nemeziz17 360 Agility Legendink', CAST(466.00 AS Decimal(18, 2)), CAST(410.00 AS Decimal(18, 2)), CAST(380.00 AS Decimal(18, 2)), 0, 1, 1, 0, 11, 7, 4, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (5, N'Adidas Men Nmd_Racer Primeknit Shoes', CAST(387.00 AS Decimal(18, 2)), CAST(166.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 1, 1, 1, 0, 3, 6, 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (6, N'Champion Jolt Low Cut Shoe', CAST(68.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 0, 1, 1, 0, 9, 10, 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (9, N'Converse Chuck Taylor As Core', CAST(90.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), NULL, 1, 1, 0, 2, 10, 2, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (10, N'Nano X3 Shoes', CAST(300.00 AS Decimal(18, 2)), CAST(280.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), NULL, 1, 1, 0, 6, 5, 5, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (11, N'FuelCell SuperComp Trainer', CAST(240.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), NULL, 1, 1, 0, 5, 2, 9, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (12, N'jnde sm ', CAST(100.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 1, 1, 1, 1, 1, 1, 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (13, N'frmdk', CAST(100.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 1, 1, 1, 1, 1, 1, 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (14, N'NAMe', CAST(30.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 1, 1, 1, 1, 1, 1, 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (15, N'Teze Ayaqqabi', CAST(200.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), 0, 1, 1, 1, 2, 1, 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (16, N'Adidas Acetango 17 Energyaqua', CAST(260.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), 0, 1, 1, 0, 11, 1, 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (17, N'Adidas Swift Run Pk', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), NULL, 1, 1, 0, 2, 4, 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [DiscountPrice], [CostPrice], [Gender], [StockStatus], [IsNew], [IsDeleted], [ColorId], [CategoryId], [BrandId], [Rate]) VALUES (18, N'Adidas Acetango17', CAST(241.00 AS Decimal(18, 2)), CAST(211.00 AS Decimal(18, 2)), CAST(130.00 AS Decimal(18, 2)), 0, 0, 1, 0, 2, 1, 4, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (5, 1)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 1)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (11, 1)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (17, 1)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (1, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (3, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (5, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (13, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (16, 2)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (1, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (3, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (5, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (11, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (14, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (16, 3)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (1, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (3, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (5, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (9, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (11, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (12, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (17, 4)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (3, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (4, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (9, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (15, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (18, 5)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (4, 6)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 6)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (11, 6)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (18, 6)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (2, 7)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (4, 7)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (6, 7)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (10, 7)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (11, 7)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (4, 8)
INSERT [dbo].[ProductSizes] ([ProductId], [SizeId]) VALUES (6, 8)
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'Adress', N'Səməd Vurğun 34 | AF Mall', 1)
INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'Email', N'E-poçt: unitedsportbaku@gmail.com', 3)
INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'Logo', N'logo.png', 4)
INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'Phone', N'Telefon: +994 12 597 90 34', 5)
INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'ContactText', N'Suallara 7/24 online cavab verilir.Bizimle elaqe:', 13)
INSERT [dbo].[Settings] ([Key], [Value], [Id]) VALUES (N'WorkingHours', N'Bazar ertəsi - Cümə 9:00 – 18:00* Şənbə: 10:00 –15:00 Bazar: fəaliyyət göstərmir.', 14)
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (1, N'36')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (2, N'37')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (3, N'38')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (4, N'39')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (5, N'40')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (6, N'41')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (7, N'42')
INSERT [dbo].[Sizes] ([Id], [SizeName]) VALUES (8, N'43')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (4, 1, N'Summer Sale', N'Buy Now!', N'Endirim qiymətlərindən faydalan!', N'Buy Now!', N'https://unitedsport.az/', N'#E9B42D', N'adidas.jpg')
INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (10, 3, N'Special Edition adidas Speedform ', N'Champions League', N'Buy it now!', N'For more', N'ndfklmd', N'#E9B42D', N'6adc2095-e969-45fc-bca1-8ae8591c39baslider-2.jpg')
INSERT [dbo].[Sliders] ([Id], [Order], [Title1], [Title2], [Desc], [ButtonText], [ButtonUrl], [ButtonBackgroundColor], [ImageName]) VALUES (13, 3, N'Special Edition adidas Speedform ', N'Champions League', N'Click now!', N'For more', N'mkdms', N'cgtfcvhg', N'29d090f7-dddf-4694-af5d-72af8d94b9d506ebc6e2-0483-430a-9f51-1876d78163f7nike.jpg')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 18.07.2023 00:39:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 18.07.2023 00:39:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BasketItems_AppUserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_AppUserId] ON [dbo].[BasketItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_ProductId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_ProductId] ON [dbo].[BasketItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContactUs_AppUserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_ContactUs_AppUserId] ON [dbo].[ContactUs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_ProductId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_ProductId] ON [dbo].[OrderItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_AppUserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_AppUserId] ON [dbo].[Orders]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductReviews_AppUserId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_ProductReviews_AppUserId] ON [dbo].[ProductReviews]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductReviews_ProductId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_ProductReviews_ProductId] ON [dbo].[ProductReviews]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ColorId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ColorId] ON [dbo].[Products]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSizes_SizeId]    Script Date: 18.07.2023 00:39:12 ******/
CREATE NONCLUSTERED INDEX [IX_ProductSizes_SizeId] ON [dbo].[ProductSizes]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT ((0.0)) FOR [UnitCostPrice]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0.0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[ProductReviews] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [ReviewDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([tinyint],(0))) FOR [Rate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Products_ProductId]
GO
ALTER TABLE [dbo].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_ContactUs_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContactUs] CHECK CONSTRAINT [FK_ContactUs_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD  CONSTRAINT [FK_ProductReviews_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProductReviews] CHECK CONSTRAINT [FK_ProductReviews_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD  CONSTRAINT [FK_ProductReviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReviews] CHECK CONSTRAINT [FK_ProductReviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Colors_ColorId]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizes_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizes_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizes_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizes_Sizes_SizeId]
GO
USE [master]
GO
ALTER DATABASE [Juan_Web_Application] SET  READ_WRITE 
GO
