USE [master]
GO
/****** Object:  Database [UdemyDemo]    Script Date: 3.08.2020 18:26:33 ******/
CREATE DATABASE [UdemyDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UdemyDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UdemyDemo.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UdemyDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UdemyDemo_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UdemyDemo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UdemyDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UdemyDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UdemyDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UdemyDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UdemyDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UdemyDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [UdemyDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UdemyDemo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UdemyDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UdemyDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UdemyDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UdemyDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UdemyDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UdemyDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UdemyDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UdemyDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UdemyDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UdemyDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UdemyDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UdemyDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UdemyDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UdemyDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UdemyDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UdemyDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UdemyDemo] SET RECOVERY FULL 
GO
ALTER DATABASE [UdemyDemo] SET  MULTI_USER 
GO
ALTER DATABASE [UdemyDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UdemyDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UdemyDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UdemyDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UdemyDemo', N'ON'
GO
USE [UdemyDemo]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsSubCategoryOf] [int] NULL,
	[IsPopular] [bit] NOT NULL,
	[AddedAt] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryWords]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryWords](
	[Id] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Word] [varchar](100) NOT NULL,
	[AddedAt] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryWords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[Id] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](500) NOT NULL,
	[Subtitle] [varchar](500) NOT NULL,
	[PublishedAt] [date] NOT NULL,
	[UpdatedAt] [date] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Instructors](
	[UserId] [int] NOT NULL,
	[SubInfo] [varchar](100) NOT NULL,
	[Biography] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AddedAt] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Placeholders]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Placeholders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[AddedAt] [date] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Placeholders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlaceholderWords]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlaceholderWords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PlaceholderId] [int] NOT NULL,
	[Word] [varchar](250) NOT NULL,
 CONSTRAINT [PK_PlaceholderWords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3.08.2020 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PasswordHash] [varchar](250) NOT NULL,
	[Promotionable] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [UK_CategoryWords_CategoryId_LanguageId]    Script Date: 3.08.2020 18:26:33 ******/
ALTER TABLE [dbo].[CategoryWords] ADD  CONSTRAINT [UK_CategoryWords_CategoryId_LanguageId] UNIQUE NONCLUSTERED 
(
	[CategoryId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_CourseInstructor_CourseId_UserId]    Script Date: 3.08.2020 18:26:33 ******/
ALTER TABLE [dbo].[CourseInstructor] ADD  CONSTRAINT [UK_CourseInstructor_CourseId_UserId] UNIQUE NONCLUSTERED 
(
	[CourseId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_PlaceholderWords_LanguageId_PlaceholderId]    Script Date: 3.08.2020 18:26:33 ******/
ALTER TABLE [dbo].[PlaceholderWords] ADD  CONSTRAINT [UK_PlaceholderWords_LanguageId_PlaceholderId] UNIQUE NONCLUSTERED 
(
	[LanguageId] ASC,
	[PlaceholderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryWords]  WITH CHECK ADD  CONSTRAINT [FK_CategoryWords_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryWords] CHECK CONSTRAINT [FK_CategoryWords_Categories]
GO
ALTER TABLE [dbo].[CategoryWords]  WITH CHECK ADD  CONSTRAINT [FK_CategoryWords_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[CategoryWords] CHECK CONSTRAINT [FK_CategoryWords_Languages]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Courses]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Instructors] FOREIGN KEY([UserId])
REFERENCES [dbo].[Instructors] ([UserId])
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Instructors]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK_Instructors_Users]
GO
ALTER TABLE [dbo].[PlaceholderWords]  WITH CHECK ADD  CONSTRAINT [FK_PlaceholderWords_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[PlaceholderWords] CHECK CONSTRAINT [FK_PlaceholderWords_Languages]
GO
ALTER TABLE [dbo].[PlaceholderWords]  WITH CHECK ADD  CONSTRAINT [FK_PlaceholderWords_Placeholders] FOREIGN KEY([PlaceholderId])
REFERENCES [dbo].[Placeholders] ([Id])
GO
ALTER TABLE [dbo].[PlaceholderWords] CHECK CONSTRAINT [FK_PlaceholderWords_Placeholders]
GO
USE [master]
GO
ALTER DATABASE [UdemyDemo] SET  READ_WRITE 
GO
