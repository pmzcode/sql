USE [master]
GO
/****** Object:  Database [Staff]    Script Date: 11.02.2017 3:04:50 ******/
CREATE DATABASE [Staff]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Staff', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Staff.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ),
( NAME = N'pes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\pes.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Staff_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Staff_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Staff] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staff].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staff] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staff] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staff] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staff] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staff] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staff] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staff] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staff] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staff] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staff] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staff] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staff] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staff] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staff] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staff] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staff] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staff] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staff] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staff] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staff] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staff] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staff] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staff] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Staff] SET  MULTI_USER 
GO
ALTER DATABASE [Staff] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staff] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staff] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staff] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Staff] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Staff]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 11.02.2017 3:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[chief] [varchar](50) NULL,
	[phone_number] [varchar](50) NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[posts]    Script Date: 11.02.2017 3:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[posts](
	[id] [int] NOT NULL,
	[post] [varchar](50) NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[private_info]    Script Date: 11.02.2017 3:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[private_info](
	[worker_id] [int] NOT NULL,
	[birth_date] [date] NULL,
	[birth_place] [varchar](50) NULL,
	[passport] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[registration_address] [varchar](50) NULL,
	[marital_status] [varchar](50) NULL,
 CONSTRAINT [PK_private_info] PRIMARY KEY CLUSTERED 
(
	[worker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service_info]    Script Date: 11.02.2017 3:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[service_info](
	[worker_id] [int] NOT NULL,
	[surname] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[department_id] [int] NULL,
	[post_id] [int] NULL,
	[education] [varchar](50) NULL,
	[specialty_id] [int] NULL,
 CONSTRAINT [PK_service_info] PRIMARY KEY CLUSTERED 
(
	[worker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[specialties]    Script Date: 11.02.2017 3:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[specialties](
	[id] [int] NOT NULL,
	[speciality] [varchar](50) NULL,
 CONSTRAINT [PK_specialties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[service_info]  WITH CHECK ADD  CONSTRAINT [FK_service_info_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[service_info] CHECK CONSTRAINT [FK_service_info_departments]
GO
ALTER TABLE [dbo].[service_info]  WITH CHECK ADD  CONSTRAINT [FK_service_info_posts] FOREIGN KEY([post_id])
REFERENCES [dbo].[posts] ([id])
GO
ALTER TABLE [dbo].[service_info] CHECK CONSTRAINT [FK_service_info_posts]
GO
ALTER TABLE [dbo].[service_info]  WITH CHECK ADD  CONSTRAINT [FK_service_info_private_info] FOREIGN KEY([worker_id])
REFERENCES [dbo].[private_info] ([worker_id])
GO
ALTER TABLE [dbo].[service_info] CHECK CONSTRAINT [FK_service_info_private_info]
GO
ALTER TABLE [dbo].[service_info]  WITH CHECK ADD  CONSTRAINT [FK_service_info_specialties] FOREIGN KEY([specialty_id])
REFERENCES [dbo].[specialties] ([id])
GO
ALTER TABLE [dbo].[service_info] CHECK CONSTRAINT [FK_service_info_specialties]
GO
USE [master]
GO
ALTER DATABASE [Staff] SET  READ_WRITE 
GO
