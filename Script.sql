CREATE DATABASE [AuthenticationShop]
GO
USE [AuthenticationShop]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Status] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Maker] [nvarchar](256) NOT NULL,
	[Category] [nvarchar](256) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[MinQuantity] [int] NOT NULL,
	[ImageURL] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/7/2021 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Username] [nvarchar](256) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price], [CreateDate]) VALUES (N'6ec9bea0-0547-49ee-afa7-1ffe73655c1d', N'8c434a24-ee2a-49ba-bcc4-0b37ecede36a', 10, 1100, CAST(N'2021-06-07T13:04:58.823' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price], [CreateDate]) VALUES (N'6ec9bea0-0547-49ee-afa7-1ffe73655c1d', N'25354cc6-7e17-4c3d-86f2-fa2037193043', 100, 11111100, CAST(N'2021-06-07T13:04:58.820' AS DateTime))
GO
INSERT [dbo].[Orders] ([Id], [UserId], [Status], [CreateDate]) VALUES (N'6ec9bea0-0547-49ee-afa7-1ffe73655c1d', N'dc8b6030-cfb4-43f8-908b-d845b82b84fe', N'Confirmed', CAST(N'2021-06-07T13:04:58.797' AS DateTime))
GO
INSERT [dbo].[Products] ([Id], [Name], [Maker], [Category], [Quantity], [Price], [MinQuantity], [ImageURL], [CreateDate]) VALUES (N'8c434a24-ee2a-49ba-bcc4-0b37ecede36a', N'string', N'string', N'string', 124, CAST(110 AS Decimal(18, 0)), 10, N'str11111ing', CAST(N'2021-06-06T19:09:00.950' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [Maker], [Category], [Quantity], [Price], [MinQuantity], [ImageURL], [CreateDate]) VALUES (N'25354cc6-7e17-4c3d-86f2-fa2037193043', N'stringaaaaa', N'asdadssad', N'asdasd', 36, CAST(111111 AS Decimal(18, 0)), 112, N'asdasd1233', CAST(N'2021-06-06T20:22:10.017' AS DateTime))
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [CreateDate]) VALUES (N'72e1494c-cd14-4983-9bb0-0968c559c713', N'Admin', CAST(N'2021-06-06T18:23:34.150' AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [CreateDate]) VALUES (N'04bd15b7-4810-419a-b358-3a7a7b370cf1', N'Saler', CAST(N'2021-06-06T18:23:34.150' AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [CreateDate]) VALUES (N'e9004eb7-49de-43e8-b6fe-aa06e9e4d854', N'Modifier', CAST(N'2021-06-06T18:23:34.150' AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [CreateDate]) VALUES (N'9c076c5c-d4d9-4426-b6bf-da7b01c49d81', N'User', CAST(N'2021-06-06T18:23:34.147' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Email], [CreateDate]) VALUES (N'dc8b6030-cfb4-43f8-908b-d845b82b84fe', N'Tan Tai', N'votantai4899', N'tantai4899', N'votantai4899@gmail.com', CAST(N'2021-06-06T19:56:30.403' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4316F43F1]    Script Date: 6/7/2021 2:48:11 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
