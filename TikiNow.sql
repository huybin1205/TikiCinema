USE [TikiCenima]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  Table [dbo].[Cinemas]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  Table [dbo].[Films]    Script Date: 16/10/2021 11:42:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Category_Id] [int] NULL,
	[Author] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTheaters]    Script Date: 16/10/2021 11:42:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTheaters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cinema_Id] [int] NULL,
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
/****** Object:  Table [dbo].[Roles]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  Table [dbo].[RoleUsers]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  Table [dbo].[Seats]    Script Date: 16/10/2021 11:42:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieTheater_Id] [int] NULL,
	[VerticalSeatRow] [int] NULL,
	[HorizontalSeatRow] [int] NULL,
	[Status] [smallint] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDetails]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 16/10/2021 11:42:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Users]    Script Date: 16/10/2021 11:42:01 SA ******/
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
SET IDENTITY_INSERT [dbo].[Cinemas] ON 

INSERT [dbo].[Cinemas] ([Id], [Name], [Phone], [Email], [Address], [CreateDate], [Deleted]) VALUES (1, N'Cinema 1', N'+8111111', N'Cinema1@gmail.com', N'Cinema 1', CAST(N'2021-10-16T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Salt], [Name], [CreateDate], [LogOut], [LastActivity], [LastLogIn], [LastPasswordChanged], [LastLogOut], [Comment], [Deleted]) VALUES (1, N'admin', N'3B139304E76B060ACFB0D60C98731FD9', NULL, N'Administrator', CAST(N'2021-10-16T07:15:18.607' AS DateTime), 0, NULL, CAST(N'2021-10-16T07:34:39.363' AS DateTime), NULL, NULL, NULL, 0)
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
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 16/10/2021 11:42:01 SA ******/
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
        WHERE   Username = @username AND Password = @password;
    END;



GO
/****** Object:  StoredProcedure [dbo].[CheckUserHasLogin]    Script Date: 16/10/2021 11:42:01 SA ******/
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
/****** Object:  StoredProcedure [dbo].[GetListCinemar]    Script Date: 16/10/2021 11:42:01 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListCinemar]
AS
    BEGIN
        SELECT * FROM Cinemas
    END;



GO
