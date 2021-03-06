USE [master]
GO
/****** Object:  Database [Games2]    Script Date: 29.07.2021 22:40:51 ******/
CREATE DATABASE [Games2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Games2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Games2.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Games2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Games2_log.ldf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Games2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Games2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Games2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Games2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Games2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Games2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Games2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Games2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Games2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Games2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Games2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Games2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Games2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Games2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Games2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Games2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Games2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Games2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Games2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Games2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Games2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Games2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Games2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Games2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Games2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Games2] SET  MULTI_USER 
GO
ALTER DATABASE [Games2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Games2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Games2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Games2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Games2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Games2] SET QUERY_STORE = OFF
GO
USE [Games2]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[IdDeveloper] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[IdDeveloper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](50) NOT NULL,
	[IDGenre] [int] NULL,
	[IDDeveloper] [int] NULL,
	[IDPublisher] [int] NULL,
	[ReleaseDate] [date] NOT NULL,
	[Price] [money] NOT NULL,
	[Mode] [nvarchar](50) NOT NULL,
	[GameStatus] [nvarchar](30) NOT NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameImage]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL,
	[ImageSource] [varbinary](max) NULL,
 CONSTRAINT [PK_GameImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[IDGenre] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[IDGenre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[IDPublisher] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[IDPublisher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL,
	[GameEstimation] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](530) NOT NULL,
	[UserStatus] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 29.07.2021 22:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (1, N'The Fun Pimps')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (2, N'CD PROJECT RED')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (3, N'Empyrean')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (4, N'
Innersloth')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (5, N'
Studio Wildcard')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (6, N'Instinct Games')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (7, N'Targem Games')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (8, N'Desertkun')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (9, N'Gearbox Software')
INSERT [dbo].[Developer] ([IdDeveloper], [DeveloperName]) VALUES (10, N'Aspyr')
SET IDENTITY_INSERT [dbo].[Developer] OFF
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 1, N'7 Days to Die', 1, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 2, N'7 Days to Die', 2, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 3, N'7 Days to Die', 5, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 4, N'7 Days to Die', 8, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 5, N'7 Days to Die', 9, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 6, N'7 Days to Die', 10, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (1, 7, N'7 Days to Die', 12, 1, 1, CAST(N'2013-12-13' AS Date), 449.0000, N'Многопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (2, 9, N'Ведьмак 3: Дикая охота', 9, 2, 2, CAST(N'2015-05-18' AS Date), 1199.0000, N'Однопользовательская', N'Активна', NULL, NULL)
INSERT [dbo].[Game] ([GameID], [ID], [GameName], [IDGenre], [IDDeveloper], [IDPublisher], [ReleaseDate], [Price], [Mode], [GameStatus], [ImagePreview], [Rating]) VALUES (3, 10, N'Among Us', 7, 4, 4, CAST(N'2018-11-16' AS Date), 133.0000, N'Многопользовательская', N'Активна', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (1, N'Экшен')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (2, N'Инди')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (3, N'Гонки')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (5, N'Ранний доступ')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (6, N'ММО')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (7, N'Казуальная')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (8, N'Приключение')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (9, N'Ролевая')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (10, N'Симулятор')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (11, N'Спортивная')
INSERT [dbo].[Genre] ([IDGenre], [GenreName]) VALUES (12, N'Стратегия')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (1, N'
The Fun Pimps Entertainment LLC')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (2, N'
CD PROJEKT RED')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (3, N'Frozen District')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (4, N'
Innersloth')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (5, N'
Studio Wildcard')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (6, N'
2K Aspyr')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (7, N'
VALOFE')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (8, N'Aspyr (Mac)')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (9, N'Aspyr (Linux)')
INSERT [dbo].[Publisher] ([IDPublisher], [PublisherName]) VALUES (10, N'
Desertkun')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([ID], [GameID], [GameEstimation], [UserID]) VALUES (1, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Nickname], [Email], [Password], [UserStatus]) VALUES (1, N'AnNik1', N'angelina.berezhnova@yandex.ru', N'Niki1985', 0)
INSERT [dbo].[User] ([UserID], [Nickname], [Email], [Password], [UserStatus]) VALUES (2, N'Test', N'Test', N'1111', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([UserID], [Status], [ID]) VALUES (1, 0, 1)
INSERT [dbo].[UserStatus] ([UserID], [Status], [ID]) VALUES (2, 0, 2)
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Developer] FOREIGN KEY([IDDeveloper])
REFERENCES [dbo].[Developer] ([IdDeveloper])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Developer]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Genre] FOREIGN KEY([IDGenre])
REFERENCES [dbo].[Genre] ([IDGenre])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Genre]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Publisher] FOREIGN KEY([IDPublisher])
REFERENCES [dbo].[Publisher] ([IDPublisher])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Publisher]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Rating] FOREIGN KEY([Rating])
REFERENCES [dbo].[Rating] ([ID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Rating]
GO
ALTER TABLE [dbo].[GameImage]  WITH CHECK ADD  CONSTRAINT [FK_GameImage_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([ID])
GO
ALTER TABLE [dbo].[GameImage] CHECK CONSTRAINT [FK_GameImage_Game]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[UserStatus]  WITH CHECK ADD  CONSTRAINT [FK_UserStatus_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserStatus] CHECK CONSTRAINT [FK_UserStatus_User]
GO
USE [master]
GO
ALTER DATABASE [Games2] SET  READ_WRITE 
GO
