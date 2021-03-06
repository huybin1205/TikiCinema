USE [TikiCinema]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Alias] [nchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
	[Author] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindOfSeats]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KindOfSeats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_KindOfSeats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTheaters]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTheaters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cinema_Id] [int] NULL,
	[Name] [nvarchar](20) NULL,
	[HorizontalSeats] [int] NULL,
	[VerticalSeats] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_MovieTheaters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nchar](10) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUsers]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieTheater_Id] [int] NULL,
	[KindOfSeat_Id] [int] NULL,
	[HorizontalSeatRow] [int] NULL,
	[VerticalSeatRow] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Status] [smallint] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ticket_Id] [int] NULL,
	[Seat_Id] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_TicketDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Film_Id] [int] NULL,
	[Cinema_Id] [int] NULL,
	[User_Id] [int] NULL,
	[GroupTicket] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](128) NULL,
	[Salt] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LogOut] [bit] NULL,
	[LastActivity] [datetime] NULL,
	[LastLogIn] [datetime] NULL,
	[LastPasswordChanged] [datetime] NULL,
	[LastLogOut] [datetime] NULL,
	[Comment] [nvarchar](100) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreateDate], [Deleted]) VALUES (1, N'Kinh dị', NULL, CAST(N'2021-10-17T00:06:44.680' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreateDate], [Deleted]) VALUES (2, N'Hành động', NULL, CAST(N'2021-10-17T00:06:44.680' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreateDate], [Deleted]) VALUES (3, N'Phiêu lưu', NULL, CAST(N'2021-10-17T00:06:44.680' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreateDate], [Deleted]) VALUES (4, N'Hoạt hình', NULL, CAST(N'2021-10-17T00:06:44.680' AS DateTime), 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [CreateDate], [Deleted]) VALUES (5, N'Tình cảm', NULL, CAST(N'2021-10-17T00:06:44.680' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cinemas] ON 

INSERT [dbo].[Cinemas] ([Id], [Name], [Phone], [Email], [Address], [CreateDate], [Deleted]) VALUES (1, N'Cinema 1', N'+8111111', N'Cinema1@gmail.com', N'Cinema 1', CAST(N'2021-10-16T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([Id], [Category_Id], [Title], [Alias], [Description], [Poster], [Author], [CreateDate], [Deleted]) VALUES (5, 1, N'Bố Già', N'bo-gia                                                                                                                                                                                                  ', N'Nội dung phim xoay quanh gia đình của ông Ba Sang sống tại khu phố lao động nghèo, trong đó Ba Sang là một người ngoài lạnh trong nóng, luôn chịu vất vả để lo cho gia đình. Tuy nhiên trong nhà ông Ba Sang luôn xảy ra các cuộc cãi vã giữa hai cha con bởi khoảng cách thế hệ trong lối suy nghĩ.', N'bo-gia.jpg', N'Vũ Ngọc Đãng, Trấn Thành', CAST(N'2021-10-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Films] ([Id], [Category_Id], [Title], [Alias], [Description], [Poster], [Author], [CreateDate], [Deleted]) VALUES (6, 2, N'Lật Mặt: 48h', N'lat-mat-48h                                                                                                                                                                                             ', N'Lật Mặt: 48h xoay quanh Hiền - một tay đấm bốc đã "rửa tay gác kiếm" đang trong quá trình chạy trốn khỏi sự truy đuổi của bọn xã hội đen. Mọi việc bắt đầu khi anh rơi vào bẫy của bọn chúng chỉ vì tiền. Đó là lý do Hiền cùng vợ con phải trốn về quê để bắt đầu cuộc sống mới. Tuy nhiên bọn chúng vẫn mò đến nơi ở của gia đình Hiền và anh phải tìm mọi cách bảo vệ vợ con mình. ', N'lat-mat.jpg', N'Lý Hải', CAST(N'2021-10-18T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Films] OFF
GO
SET IDENTITY_INSERT [dbo].[KindOfSeats] ON 

INSERT [dbo].[KindOfSeats] ([Id], [Name]) VALUES (1, N'Ghế thường')
INSERT [dbo].[KindOfSeats] ([Id], [Name]) VALUES (2, N'Ghế VIP')
INSERT [dbo].[KindOfSeats] ([Id], [Name]) VALUES (3, N'Ghế SweetBox')
SET IDENTITY_INSERT [dbo].[KindOfSeats] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieTheaters] ON 

INSERT [dbo].[MovieTheaters] ([Id], [Cinema_Id], [Name], [HorizontalSeats], [VerticalSeats], [CreateDate], [Deleted]) VALUES (1, 1, N'Rạp số 1', 10, 10, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[MovieTheaters] ([Id], [Cinema_Id], [Name], [HorizontalSeats], [VerticalSeats], [CreateDate], [Deleted]) VALUES (2, 1, N'Rạp số 2', 10, 10, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MovieTheaters] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (1, 1, 1, 0, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (2, 1, 1, 0, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (3, 1, 1, 0, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (4, 1, 1, 0, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (5, 1, 1, 0, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (6, 1, 1, 0, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (7, 1, 1, 0, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (8, 1, 1, 0, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (9, 1, 1, 0, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (10, 1, 1, 0, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (11, 1, 1, 1, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (12, 1, 1, 1, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (13, 1, 1, 1, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (14, 1, 1, 1, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (15, 1, 1, 1, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (16, 1, 1, 1, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (17, 1, 1, 1, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (18, 1, 1, 1, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (19, 1, 1, 1, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (20, 1, 1, 1, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (21, 1, 1, 2, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (22, 1, 1, 2, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (23, 1, 1, 2, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (24, 1, 1, 2, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (25, 1, 1, 2, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (26, 1, 1, 2, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (27, 1, 1, 2, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (28, 1, 1, 2, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (29, 1, 1, 2, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (30, 1, 1, 2, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (31, 1, 2, 3, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (32, 1, 2, 3, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (33, 1, 2, 3, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (34, 1, 2, 3, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (35, 1, 2, 3, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (36, 1, 2, 3, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (37, 1, 2, 3, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (38, 1, 2, 3, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (39, 1, 2, 3, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (40, 1, 2, 3, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (41, 1, 2, 4, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (42, 1, 2, 4, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (43, 1, 2, 4, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (44, 1, 2, 4, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (45, 1, 2, 4, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (46, 1, 2, 4, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (47, 1, 2, 4, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (48, 1, 2, 4, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (49, 1, 2, 4, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (50, 1, 2, 4, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (51, 1, 2, 5, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (52, 1, 2, 5, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (53, 1, 2, 5, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (54, 1, 2, 5, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (55, 1, 2, 5, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (56, 1, 2, 5, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (57, 1, 2, 5, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (58, 1, 2, 5, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (59, 1, 2, 5, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (60, 1, 2, 5, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (61, 1, 2, 6, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (62, 1, 2, 6, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (63, 1, 2, 6, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (64, 1, 2, 6, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (65, 1, 2, 6, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (66, 1, 2, 6, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (67, 1, 2, 6, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (68, 1, 2, 6, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (69, 1, 2, 6, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (70, 1, 2, 6, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (71, 1, 2, 7, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (72, 1, 2, 7, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (73, 1, 2, 7, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (74, 1, 2, 7, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (75, 1, 2, 7, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (76, 1, 2, 7, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (77, 1, 2, 7, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (78, 1, 2, 7, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (79, 1, 2, 7, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (80, 1, 2, 7, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (81, 1, 2, 8, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (82, 1, 2, 8, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (83, 1, 2, 8, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (84, 1, 2, 8, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (85, 1, 2, 8, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (86, 1, 2, 8, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (87, 1, 2, 8, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (88, 1, 2, 8, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (89, 1, 2, 8, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (90, 1, 2, 8, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (91, 1, 2, 9, 0, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (92, 1, 2, 9, 1, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (93, 1, 2, 9, 2, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (94, 1, 2, 9, 3, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (95, 1, 2, 9, 4, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (96, 1, 2, 9, 5, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (97, 1, 2, 9, 6, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (98, 1, 2, 9, 7, CAST(15.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (99, 1, 2, 9, 8, CAST(15.00 AS Decimal(10, 2)), 0, 0)
GO
INSERT [dbo].[Seats] ([Id], [MovieTheater_Id], [KindOfSeat_Id], [HorizontalSeatRow], [VerticalSeatRow], [Price], [Status], [Deleted]) VALUES (100, 1, 2, 9, 9, CAST(15.00 AS Decimal(10, 2)), 0, 0)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketDetails] ON 

INSERT [dbo].[TicketDetails] ([Id], [Ticket_Id], [Seat_Id], [Price], [Deleted]) VALUES (1, 1, 21, CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[TicketDetails] ([Id], [Ticket_Id], [Seat_Id], [Price], [Deleted]) VALUES (2, 1, 22, CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[TicketDetails] ([Id], [Ticket_Id], [Seat_Id], [Price], [Deleted]) VALUES (3, 2, 53, CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[TicketDetails] ([Id], [Ticket_Id], [Seat_Id], [Price], [Deleted]) VALUES (4, 2, 54, CAST(15.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[TicketDetails] ([Id], [Ticket_Id], [Seat_Id], [Price], [Deleted]) VALUES (5, 2, 55, CAST(15.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[TicketDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [Film_Id], [Cinema_Id], [User_Id], [GroupTicket], [CreateDate], [Deleted]) VALUES (1, 5, 1, 1, 1, CAST(N'2021-10-18T20:43:29.673' AS DateTime), 0)
INSERT [dbo].[Tickets] ([Id], [Film_Id], [Cinema_Id], [User_Id], [GroupTicket], [CreateDate], [Deleted]) VALUES (2, 5, 1, 1, 0, CAST(N'2021-10-18T20:55:55.203' AS DateTime), 0)
INSERT [dbo].[Tickets] ([Id], [Film_Id], [Cinema_Id], [User_Id], [GroupTicket], [CreateDate], [Deleted]) VALUES (3, 5, 1, 1, 0, CAST(N'2021-10-18T21:23:34.133' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Salt], [Name], [CreateDate], [LogOut], [LastActivity], [LastLogIn], [LastPasswordChanged], [LastLogOut], [Comment], [Deleted]) VALUES (1, N'admin', N'3B139304E76B060ACFB0D60C98731FD9', NULL, N'Administrator', CAST(N'2021-10-16T07:15:18.607' AS DateTime), 1, NULL, CAST(N'2021-10-18T22:41:46.120' AS DateTime), NULL, CAST(N'2021-10-18T22:41:48.460' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Categories]
GO
ALTER TABLE [dbo].[MovieTheaters]  WITH CHECK ADD  CONSTRAINT [FK_MovieTheaters_Cinemas] FOREIGN KEY([Cinema_Id])
REFERENCES [dbo].[Cinemas] ([Id])
GO
ALTER TABLE [dbo].[MovieTheaters] CHECK CONSTRAINT [FK_MovieTheaters_Cinemas]
GO
ALTER TABLE [dbo].[RoleUsers]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RoleUsers] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[RoleUsers]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RoleUsers] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_MovieTheaters] FOREIGN KEY([MovieTheater_Id])
REFERENCES [dbo].[MovieTheaters] ([Id])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_MovieTheaters]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_Seats] FOREIGN KEY([Seat_Id])
REFERENCES [dbo].[Seats] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_Seats]
GO
ALTER TABLE [dbo].[TicketDetails]  WITH CHECK ADD  CONSTRAINT [FK_TicketDetails_Tickets] FOREIGN KEY([Ticket_Id])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[TicketDetails] CHECK CONSTRAINT [FK_TicketDetails_Tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Cinemas] FOREIGN KEY([Cinema_Id])
REFERENCES [dbo].[Cinemas] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Cinemas]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Films] FOREIGN KEY([Film_Id])
REFERENCES [dbo].[Films] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Films]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Users]
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLogin]
    @username NVARCHAR(50),
	@password NVARCHAR(128)
AS
    BEGIN
        SELECT  Users.Id
        FROM    Users
        WHERE   Username = @username AND Password = @password AND Deleted = 0;
    END;



GO
/****** Object:  StoredProcedure [dbo].[CheckUserHasLogin]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUserHasLogin]
    @id INT
AS
    BEGIN
		DECLARE @idLogin INT = (SELECT  Users.Id FROM Users WHERE   Id = @id AND LogOut = 0);
		IF @idLogin IS NULL
			BEGIN
				UPDATE Users SET LogOut = 0, LastLogIn = GETDATE();
				SELECT [Status] = 1;
			END
		ELSE
			SELECT [Status] = 0;
    END;
GO
/****** Object:  StoredProcedure [dbo].[GetListCinemas]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListCinemas]
AS
    BEGIN
        SELECT * FROM Cinemas
    END;



GO
/****** Object:  StoredProcedure [dbo].[GetListFilms]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListFilms]
AS
    BEGIN
        SELECT 
			Films.Id,
			Films.Category_Id,
			Films.Title,
			Films.Alias,
			Films.[Description],
			Films.Poster,
			Films.Author,
			Films.CreateDate,
			Films.Deleted,
			Categories.[Name] AS [CategoryName]
		FROM Films, Categories
		WHERE Films.Category_Id = Categories.Id
    END;
GO
/****** Object:  StoredProcedure [dbo].[GetListKindOfSeats]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListKindOfSeats]
AS
    BEGIN
        SELECT * FROM KindOfSeats
    END;
GO
/****** Object:  StoredProcedure [dbo].[GetListMovieTheaters]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListMovieTheaters]
AS
    BEGIN
        SELECT * FROM MovieTheaters
    END;
GO
/****** Object:  StoredProcedure [dbo].[GetListMovieTheatersByCinemaId]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListMovieTheatersByCinemaId]
	@cinemaId INT
AS
    BEGIN
        SELECT 
			Cinemas.Id,
			Cinemas.[Name], 
			MovieTheaters.[Name], 
			MovieTheaters.HorizontalSeats,
			MovieTheaters.VerticalSeats,
			MovieTheaters.Deleted
		FROM MovieTheaters, Cinemas 
		WHERE MovieTheaters.Cinema_Id = @cinemaId AND MovieTheaters.Cinema_Id = Cinemas.Id;
    END;



GO
/****** Object:  StoredProcedure [dbo].[GetListSeatsByMovieTheaterId]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListSeatsByMovieTheaterId]
	@movieTheaterId INT
AS
    BEGIN
		SELECT 
			Seats.Id AS [SeatID],
			MovieTheaters.Id,
			MovieTheaters.[Name],
			Seats.HorizontalSeatRow,
			Seats.VerticalSeatRow,
			Seats.Price,
			Seats.KindOfSeat_Id,
			KindOfSeats.[Name],
			Seats.[Status],
			Seats.Deleted
		FROM Seats, MovieTheaters, KindOfSeats
		WHERE 
			Seats.MovieTheater_Id = MovieTheaters.Id AND Seats.MovieTheater_Id =  @movieTheaterId
			AND KindOfSeats.Id = Seats.KindOfSeat_Id

    END;
GO
/****** Object:  StoredProcedure [dbo].[GetMovieTheaterById]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMovieTheaterById]
	@movieTheaterId INT
AS
BEGIN
	SELECT * FROM MovieTheaters
	WHERE Id = @movieTheaterId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTicket]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertTicket]
			@Film_Id INT,
			@Cinema_Id INT,
			@User_Id INT,
			@GroupTicket BIT,
			@ListId varchar(MAX)
AS
BEGIN
BEGIN TRAN
	BEGIN TRY
	   INSERT INTO  [dbo].[Tickets]
				   ([Film_Id]
				   ,[Cinema_Id]
				   ,[User_Id]
				   ,[GroupTicket]
				   ,[CreateDate]
				   ,[Deleted]) VALUES(@Film_Id,@Cinema_Id,@User_Id,@GroupTicket,GETDATE(),0)
		DECLARE @ticketID INT = (SELECT SCOPE_IDENTITY());

		DECLARE @i INT = 1;
		DECLARE @result INT = 0;
		WHILE @i <= (SELECT count(value) FROM STRING_SPLIT(@ListId, '_') WHERE RTRIM(value) <> '')
		BEGIN
			DECLARE @temp INT = 0;
			SET @result = (SELECT TOP 1 value FROM STRING_SPLIT(@ListId, '_') WHERE value > @result AND RTRIM(value) <> '' ORDER BY value);

			IF (@result IS NOT NULL)
				BEGIN	
					DECLARE @priceTicket decimal(10, 2) = (SELECT Price FROM Seats WHERE id = @result);
					INSERT INTO [dbo].[TicketDetails]
					   ([Ticket_Id],
					   [Seat_Id]
					   ,[Price]
					   ,[Deleted])
					VALUES (@ticketID,@result, @priceTicket, 0)
					UPDATE Seats SET [Status] = 1 WHERE Id = @result;
				END
			SET @i = @i + 1;
		END	
	COMMIT
	SELECT 1 AS [Success]
	END TRY
	BEGIN CATCH
		SELECT 0 AS [Success]
	   ROLLBACK
	   DECLARE @ErrorMessage VARCHAR(2000)
	   RAISERROR(@ErrorMessage, 16, 1)
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[Logout]    Script Date: 18/10/2021 11:10:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Logout]
	@id INT
AS
BEGIN
	UPDATE Users SET LastLogOut = GETDATE(), LogOut = 1 WHERE Id = @id
END
GO
