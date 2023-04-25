USE [master]
GO
/****** Object:  Database [HR]    Script Date: 25.4.2023 10.01.30 ******/
CREATE DATABASE [HR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HR] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR] SET RECOVERY FULL 
GO
ALTER DATABASE [HR] SET  MULTI_USER 
GO
ALTER DATABASE [HR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HR] SET QUERY_STORE = OFF
GO
USE [HR]
GO
/****** Object:  User [ulla.unhola]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [ulla.unhola] FOR LOGIN [MAINTENANCE\ulla.unhola] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [testi]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [testi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pomo_user]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [pomo_user] FOR LOGIN [pomo_login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [oikeustestaaja]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [oikeustestaaja] FOR LOGIN [MAINTENANCE\mika.vainio.adm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MAINTENANCE\uolevi.untamo]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [MAINTENANCE\uolevi.untamo] FOR LOGIN [MAINTENANCE\uolevi.untamo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MAINTENANCE\assi.kalma]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [MAINTENANCE\assi.kalma] FOR LOGIN [MAINTENANCE\assi.kalma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [duunari_user]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [duunari_user] FOR LOGIN [duunari_login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [calle.keckelberg]    Script Date: 25.4.2023 10.01.30 ******/
CREATE USER [calle.keckelberg] FOR LOGIN [MAINTENANCE\calle.keckelberg] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ulla.unhola]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MAINTENANCE\uolevi.untamo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [MAINTENANCE\assi.kalma]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MAINTENANCE\assi.kalma]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MAINTENANCE\assi.kalma]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [calle.keckelberg]
GO
ALTER ROLE [db_datareader] ADD MEMBER [calle.keckelberg]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [calle.keckelberg]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 25.4.2023 10.01.30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Department] [int] NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departement]    Script Date: 25.4.2023 10.01.30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departement](
	[DepartementID] [int] IDENTITY(1,1) NOT NULL,
	[DepartementName] [nvarchar](50) NOT NULL,
	[Manager] [int] NULL,
 CONSTRAINT [PK_Departement] PRIMARY KEY CLUSTERED 
(
	[DepartementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employment]    Script Date: 25.4.2023 10.01.30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employment](
	[EmploymentID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Wage] [float] NOT NULL,
 CONSTRAINT [PK_Employment] PRIMARY KEY CLUSTERED 
(
	[EmploymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Palkat]    Script Date: 25.4.2023 10.01.30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Palkat]
AS
SELECT        dbo.Departement.DepartementName AS Osasto, dbo.Employee.FirstName AS Etunimi, dbo.Employee.LastName AS Sukunimi, dbo.Employment.Wage AS Kuukausipalkka
FROM            dbo.Employee INNER JOIN
                         dbo.Departement ON dbo.Employee.Department = dbo.Departement.DepartementID INNER JOIN
                         dbo.Employment ON dbo.Employee.EmployeeID = dbo.Employment.EmployeeID
WHERE        (dbo.Employment.EndDate IS NULL)
GO
SET IDENTITY_INSERT [dbo].[Departement] ON 
GO
INSERT [dbo].[Departement] ([DepartementID], [DepartementName], [Manager]) VALUES (1, N'Hallinto', 1005)
GO
INSERT [dbo].[Departement] ([DepartementID], [DepartementName], [Manager]) VALUES (2, N'ICT', 1001)
GO
INSERT [dbo].[Departement] ([DepartementID], [DepartementName], [Manager]) VALUES (3, N'Markkinointi', 1008)
GO
INSERT [dbo].[Departement] ([DepartementID], [DepartementName], [Manager]) VALUES (4, N'Logistiikka', NULL)
GO
INSERT [dbo].[Departement] ([DepartementID], [DepartementName], [Manager]) VALUES (5, N'Talous', 1003)
GO
SET IDENTITY_INSERT [dbo].[Departement] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1000, N'Jakke', N'Jäynä', 2, N'Järjestelmätukihenkilö')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1001, N'Calle', N'Keckelberg', 2, N'Tietohallintopäällikkö')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1002, N'Tuittu', N'Kiukkunen', 1, N'Johdon sihteeri')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1003, N'Assi', N'Kalma', 5, N'Talousjohtaja')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1004, N'Mauri', N'Möttönen', 4, N'Varastomies')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1005, N'Kullervo', N'Kalpa', 1, N'Hallintojohtaja')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1006, N'Harri', N'Horna', 3, N'Myyntipäällikkö')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1007, N'Eevert', N'Hutikainen', NULL, N'Työterveyslääkäri')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1008, N'Håkan', N'Olfredsson', 3, N'Markkinointipäällikkö')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1009, N'Reino', N'Rautahanska', 4, N'Pääluottamusmies')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1010, N'Uolevi', N'Untamo', 1, N'Suunnittelija')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1011, N'Ulla', N'Unhola', 1, N'Suunnittelija')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1012, N'Heikki', N'Hutikainen', 1, N'Työsuojelupäällikkö')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Department], [Description]) VALUES (1013, N'Yrjö', N'Yrjö-Wirtanen', 2, N'Ohjelmoija')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Employment] ON 
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (2, 1005, CAST(N'2020-01-01' AS Date), NULL, 10000)
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (4, 1001, CAST(N'2020-01-01' AS Date), NULL, 7000)
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (5, 1003, CAST(N'2020-01-01' AS Date), NULL, 8000)
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (7, 1008, CAST(N'2020-01-01' AS Date), NULL, 9000)
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (8, 1012, CAST(N'2020-01-01' AS Date), CAST(N'2022-12-31' AS Date), 7000)
GO
INSERT [dbo].[Employment] ([EmploymentID], [EmployeeID], [StartDate], [EndDate], [Wage]) VALUES (9, 1012, CAST(N'2023-01-01' AS Date), NULL, 7500)
GO
SET IDENTITY_INSERT [dbo].[Employment] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Departement] FOREIGN KEY([Department])
REFERENCES [dbo].[Departement] ([DepartementID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Departement]
GO
ALTER TABLE [dbo].[Employment]  WITH CHECK ADD  CONSTRAINT [FK_Employment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employment] CHECK CONSTRAINT [FK_Employment_Employee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[30] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 8
               Left = 267
               Bottom = 170
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departement"
            Begin Extent = 
               Top = 4
               Left = 1
               Bottom = 117
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employment"
            Begin Extent = 
               Top = 5
               Left = 543
               Bottom = 165
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 915
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Palkat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Palkat'
GO
USE [master]
GO
ALTER DATABASE [HR] SET  READ_WRITE 
GO
