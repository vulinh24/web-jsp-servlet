USE [master]
GO
/****** Object:  Database [FirstProjectJavaWeb]    Script Date: 11-Oct-21 17:33:12 ******/
CREATE DATABASE [FirstProjectJavaWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FirstProjectJavaWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FirstProjectJavaWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FirstProjectJavaWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FirstProjectJavaWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FirstProjectJavaWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FirstProjectJavaWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET  MULTI_USER 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FirstProjectJavaWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FirstProjectJavaWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FirstProjectJavaWeb] SET QUERY_STORE = OFF
GO
USE [FirstProjectJavaWeb]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 11-Oct-21 17:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[user_username] [nvarchar](20) NOT NULL,
	[prod_id] [int] NOT NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_username] ASC,
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorys]    Script Date: 11-Oct-21 17:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorys](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11-Oct-21 17:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[prod_id] [int] IDENTITY(1,1) NOT NULL,
	[prod_name] [nvarchar](30) NOT NULL,
	[prod_price] [float] NULL,
	[prod_imgurl] [varchar](1000) NULL,
	[prod_description] [ntext] NULL,
	[cate_id] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11-Oct-21 17:33:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_username] [nvarchar](20) NOT NULL,
	[user_password] [nvarchar](20) NULL,
	[user_authorization] [varchar](20) NOT NULL,
	[user_name] [nvarchar](20) NULL,
 CONSTRAINT [pri_k] PRIMARY KEY CLUSTERED 
(
	[user_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[carts] ([user_username], [prod_id], [amount]) VALUES (N'NguyenA', 3, 2)
INSERT [dbo].[carts] ([user_username], [prod_id], [amount]) VALUES (N'NguyenA', 4, 1)
INSERT [dbo].[carts] ([user_username], [prod_id], [amount]) VALUES (N'NguyenA', 8, 1)
GO
SET IDENTITY_INSERT [dbo].[categorys] ON 

INSERT [dbo].[categorys] ([cate_id], [cate_name]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[categorys] ([cate_id], [cate_name]) VALUES (2, N'Laptop')
INSERT [dbo].[categorys] ([cate_id], [cate_name]) VALUES (3, N'Máy tính bảng')
INSERT [dbo].[categorys] ([cate_id], [cate_name]) VALUES (4, N'Đồng Hồ')
SET IDENTITY_INSERT [dbo].[categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (1, N'Iphone 12', 20499000, N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-xanh-duong-new-2-600x600.jpg', N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB. Hiệu năng vượt xa mọi giới hạn Apple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (2, N'Iphone 13 ProMax', 33990000, N'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', N'iPhone 13 Pro Max 128GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (3, N'Iphone 12 ProMax', 30990000, N'https://cdn.tgdd.vn/Products/Images/42/213033/iphone-12-pro-max-xanh-duong-new-600x600-600x600.jpg', N'Thay đổi thiết kế mới sau 6 năm Theo chu kỳ cứ mỗi 3 năm thì iPhone lại thay đổi thiết kế và 2020 là năm đánh dấu cột mốc quan trong này, vì thế rất có thể đây là thời điểm các mẫu iPhone 12 sẽ có một sự thay đổi mạnh mẽ về thiết kế.  iPhone 12 Pro Max sở hữu diện mạo mới mới với khung viền được vát thẳng và mạnh mẽ như trên iPad Pro 2020, chấm dứt hơn 6 năm với kiểu thiết kế bo cong trên iPhone 6 được ra mắt lần đầu tiên vào năm 2014.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (4, N'Iphone 12 Pro', 27490000, N'https://cdn.tgdd.vn/Products/Images/42/213032/iphone-12-pro-gold-600x600.jpg', N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB. Hiệu năng vượt xa mọi giới hạn Apple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 Pro đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (5, N'Iphone 13 Mini', 21990000, N'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-starlight-1-600x600.jpg', N'iPhone 13 Mini - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (6, N'Iphone 11', 15990000, N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-xi-xanhla-600x600.jpg', N'Tháng 09/2019, Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (7, N'Iphone XR', 12990000, N'https://cdn.tgdd.vn/Products/Images/42/190325/iphone-xr-hopmoi-den-600x600-2-600x600.jpg', N'Màn hình 6.1", Chip Apple A12 Bionic  RAM 3 GB, ROM 64 GB  Camera sau: 12 MP  Camera trước: 7 MP  Pin 2942 mAh, Sạc 15 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (8, N'Iphone SE', 12490000, N'https://cdn.tgdd.vn/Products/Images/42/222629/iphone-se-128gb-2020-do-600x600.jpg', N'Màn hình 4.7", Chip Apple A13 Bionic  RAM 3 GB, ROM 128 GB  Camera sau: 12 MP  Camera trước: 7 MP  Pin 1821 mAh, Sạc 18 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (9, N'Samsung Galaxy ZFold3', 43000000, N'https://cdn.tgdd.vn/Products/Images/42/248284/samsung-galaxy-z-fold-3-green-1-600x600.jpg', N'Màn hình Chính 7.6" & Phụ 6.2", Chip Snapdragon 888  RAM 12 GB, ROM 512 GB  Camera sau: 3 camera 12 MP  Camera trước: 10 MP & 4 MP  Pin 4400 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (10, N'Samsung Galaxy A50', 10990000, N'https://cdn.tgdd.vn/Products/Images/42/247507/samsung-galaxy-a52s-5g-mint-600x600.jpg', N'Màn hình 6.5", Chip Snapdragon 778G 5G 8 nhân  RAM 8 GB, ROM 128 GB  Camera sau: Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP  Camera trước: 32 MP  Pin 4500 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (11, N'Samsung Galaxy ZFlip', 25900000, N'https://cdn.tgdd.vn/Products/Images/42/248283/samsung-galaxy-z-flip-3-violet-1-600x600.jpg', N'Màn hình Chính 6.7" & Phụ 1.9", Chip Snapdragon 888  RAM 8 GB, ROM 256 GB  Camera sau: 2 camera 12 MP  Camera trước: 10 MP  Pin 3300 mAh, Sạc 15 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (12, N'Samsung Galaxy S21', 25900000, N'https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-600x600.jpg', N'Màn hình 6.8", Chip Exynos 2100  RAM 12 GB, ROM 128 GB  Camera sau: Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP  Camera trước: 40 MP  Pin 5000 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (13, N'Samsung Galaxy S20', 17900000, N'https://cdn.tgdd.vn/Products/Images/42/220833/samsung-galaxy-s21-trang-600x600.jpg', N'Màn hình 6.2", Chip Exynos 2100  RAM 8 GB, ROM 128 GB  Camera sau: Chính 12 MP & Phụ 64 MP, 12 MP  Camera trước: 10 MP  Pin 4000 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (14, N'Samsung Galaxy A70', 10500000, N'https://cdn.tgdd.vn/Products/Images/42/226101/samsung-galaxy-a72-thumb-violet-600x600-600x600.jpg', N'Màn hình 6.7", Chip Snapdragon 720G  RAM 8 GB, ROM 256 GB  Camera sau: Chính 64 MP & Phụ 12 MP, 8 MP, 5 MP  Camera trước: 32 MP  Pin 5000 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (15, N'Samsung Galaxy A51', 10000000, N'https://cdn.tgdd.vn/Products/Images/42/217536/samsung-galaxy-m51-trang-new-600x600-600x600.jpg', N'Màn hình 6.7", Chip Snapdragon 730  RAM 8 GB, ROM 128 GB  Camera sau: Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP  Camera trước: 32 MP  Pin 7000 mAh, Sạc 25 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (16, N'Samsung Galaxy A31', 6000000, N'https://cdn.tgdd.vn/Products/Images/42/234315/samsung-galaxy-a32-4g-thumb-tim-600x600-600x600.jpg', N'Màn hình 6.4", Chip MediaTek Helio G80  RAM 6 GB, ROM 128 GB  Camera sau: Chính 64 MP & Phụ 8 MP, 5MP, 5MP  Camera trước: 20 MP  Pin 5000 mAh, Sạc 15 W', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (17, N'Iphone 13 ProMax', 33990000, N'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', N'iPhone 13 Pro Max 128GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (18, N'Iphone 13 ProMax', 33990000, N'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', N'iPhone 13 Pro Max 128GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (19, N'Iphone 13 ProMax', 33990000, N'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB. Hiệu năng vượt xa mọi giới hạn Apple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (20, N'Iphone 13 ProMax', 30000000, N'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg', N'iPhone 13 Pro Max 128GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.', 1)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (22, N'MacBook Air M1', 37000000, N'https://cdn.tgdd.vn/Products/Images/44/243952/apple-macbook-air-m1-2020-z12a00050-600x600.jpg', N'M.HÌNH 13.3", Retina  CPU Apple M1  CARD 8 nhân GPU  PIN Khoảng 10 tiếng', 2)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (23, N'Lenovo Idea Pad', 19000000, N'https://cdn.tgdd.vn/Products/Images/44/232192/lenovo-ideapad-slim-5-15itl05-i5-82fg001pvn-144320-064322-600x600.jpg', N'M.HÌNH 15.6", Full HD  CPU i5, 1135G7, 2.4GHz  CARD Intel Iris Xe  PIN 3-cell, 45Wh', 2)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (24, N'MacBook Air M1', 43000000, N'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg', N'M.HÌNH 13.3", Retina  CPU Apple M1  CARD 8 nhân GPU  PIN Khoảng 10 tiếng', 2)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (25, N'MacBook Air M1 2021', 39000000, N'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg', N'M.HÌNH 13.3", Retina  CPU Apple M1  CARD 8 nhân GPU  PIN Khoảng 10 tiếng', 2)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (26, N'Ipad Pro', 33990000, N'https://cdn.tgdd.vn/Products/Images/522/238651/ipad-pro-2021-129-inch-gray-600x600.jpg', N'Màn hình 12.9", Liquid Retina XDR mini-LED LCD  Chip Apple M1 8 nhân  RAM 8 GB, ROM 256 GB  5G, Nghe gọi qua FaceTime  Pin 40.88 Wh (~ 10.835 mAh), Sạc 20 W', 3)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (27, N'Ipad Pro 2021', 43000000, N'https://cdn.tgdd.vn/Products/Images/522/221774/ipad-pro-11-inch-wifi-cellular-128gb-2020-xam-600x600-1-600x600.jpg', N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB. Hiệu năng vượt xa mọi giới hạn Apple đã trang bị con chip mới nhất của hãng (tính đến 11/2020) cho iPhone 12 đó là A14 Bionic, được sản xuất trên tiến trình 5 nm với hiệu suất ổn định hơn so với chip A13 được trang bị trên phiên bản tiền nhiệm iPhone 11.', 3)
INSERT [dbo].[products] ([prod_id], [prod_name], [prod_price], [prod_imgurl], [prod_description], [cate_id]) VALUES (28, N'Apple watch', 5000000, N'https://cdn.tgdd.vn/Products/Images/7077/234912/s6-44mm-vien-nhom-day-cao-su-den-glr-1-org.jpg', N'Apple Watch series 6 44 mm viền nhôm dây cao su là một siêu phẩm đến từ nhà Táo, nhờ có thiết kế tinh xảo, độ hoàn thiện cao, màu đen sang trọng phù hợp với mọi lứa tuổi và giới tính, chiếc đồng hồ luôn thu hút rất nhiều người khi xuất hiện.', 4)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[users] ([user_username], [user_password], [user_authorization], [user_name]) VALUES (N'admin', N'admin', N'admin', NULL)
INSERT [dbo].[users] ([user_username], [user_password], [user_authorization], [user_name]) VALUES (N'NguyenA', N'12345', N'customer', NULL)
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([prod_id])
REFERENCES [dbo].[products] ([prod_id])
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([user_username])
REFERENCES [dbo].[users] ([user_username])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[categorys] ([cate_id])
GO
USE [master]
GO
ALTER DATABASE [FirstProjectJavaWeb] SET  READ_WRITE 
GO
