USE [master]
GO
/****** Object:  Database [db_BooksTest5]    Script Date: 4/17/2018 6:55:17 PM ******/
CREATE DATABASE [db_BooksTest5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_BooksTest5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_BooksTest5.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_BooksTest5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_BooksTest5_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_BooksTest5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_BooksTest5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_BooksTest5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_BooksTest5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_BooksTest5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_BooksTest5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_BooksTest5] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_BooksTest5] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_BooksTest5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_BooksTest5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_BooksTest5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_BooksTest5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_BooksTest5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_BooksTest5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_BooksTest5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_BooksTest5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_BooksTest5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_BooksTest5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_BooksTest5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_BooksTest5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_BooksTest5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_BooksTest5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_BooksTest5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_BooksTest5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_BooksTest5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_BooksTest5] SET  MULTI_USER 
GO
ALTER DATABASE [db_BooksTest5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_BooksTest5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_BooksTest5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_BooksTest5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_BooksTest5] SET DELAYED_DURABILITY = DISABLED 
GO
USE [db_BooksTest5]
GO
/****** Object:  Table [dbo].[tbl_Authors]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Authors](
	[BookID] [int] NOT NULL,
	[AuthorName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Book]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[PublisherName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BookCopies]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BookCopies](
	[BookID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
	[No_Of_Copies] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BookLoans]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BookLoans](
	[BookID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
	[CardNo] [int] NOT NULL,
	[DateOut] [date] NOT NULL,
	[DueDate] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Borrower]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Borrower](
	[CardNo] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[BorrowerAddress] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LibraryBranch]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LibraryBranch](
	[Branch_ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](50) NOT NULL,
	[LibraryAddress] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Publisher]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Publisher](
	[Name] [varchar](50) NOT NULL,
	[PublisherAddress] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Authors]  WITH CHECK ADD  CONSTRAINT [fk_BookID] FOREIGN KEY([BookID])
REFERENCES [dbo].[tbl_Book] ([BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Authors] CHECK CONSTRAINT [fk_BookID]
GO
ALTER TABLE [dbo].[tbl_Book]  WITH CHECK ADD  CONSTRAINT [fk_Name] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[tbl_Publisher] ([Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Book] CHECK CONSTRAINT [fk_Name]
GO
ALTER TABLE [dbo].[tbl_BookCopies]  WITH CHECK ADD  CONSTRAINT [fk_BookID3] FOREIGN KEY([BookID])
REFERENCES [dbo].[tbl_Book] ([BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookCopies] CHECK CONSTRAINT [fk_BookID3]
GO
ALTER TABLE [dbo].[tbl_BookCopies]  WITH CHECK ADD  CONSTRAINT [fk_Branch_ID2] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[tbl_LibraryBranch] ([Branch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookCopies] CHECK CONSTRAINT [fk_Branch_ID2]
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_BookID2] FOREIGN KEY([BookID])
REFERENCES [dbo].[tbl_Book] ([BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_BookID2]
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_Branch_ID] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[tbl_LibraryBranch] ([Branch_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_Branch_ID]
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[tbl_Borrower] ([CardNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_CardNo]
GO
/****** Object:  StoredProcedure [dbo].[GetBorrower5PlusBooks]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetBorrower5PlusBooks] AS
SELECT a1.Name AS 'Borrower Name', a1.BorrowerAddress, COUNT(a2.BookID) AS 'Borrowers with 5+ Books Checked Out'
FROM tbl_Borrower a1
INNER JOIN tbl_BookLoans a2 ON a1.CardNo = a2.CardNo
GROUP BY a1.Name, a1.BorrowerAddress
HAVING COUNT(a2.BookID) > 5

GO
/****** Object:  StoredProcedure [dbo].[GetNullBorrowers]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetNullBorrowers] AS
SELECT a1.Name AS 'People Who Have Not Checked Out Any Books'
FROM tbl_Borrower a1
LEFT OUTER JOIN tbl_BookLoans a2 ON a1.CardNo = a2.CardNo
WHERE a2.CardNo IS NULL

GO
/****** Object:  StoredProcedure [dbo].[GetNumberCopies]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNumberCopies]
AS
BEGIN
SELECT No_Of_Copies AS "Number of Copies of The Lost Tribe in Each Library (Sharpstown, Central, Pacific, Roxbury)" FROM tbl_BookCopies WHERE Branch_ID BETWEEN 1 AND 4 AND BookID = 1
END

EXEC dbo.GetNumberCopies
GO
/****** Object:  StoredProcedure [dbo].[GetNumberCopiesLoanedBranch]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetNumberCopiesLoanedBranch] AS
SELECT a1.BranchName AS 'Branch Name', COUNT(a2.BookID) AS 'Number of Copies Loaned From Branch' /*What I did but with correct syntax*/
FROM tbl_LibraryBranch a1
INNER JOIN tbl_BookLoans a2 ON a1.Branch_ID = a2.Branch_ID
GROUP BY a1.BranchName

GO
/****** Object:  StoredProcedure [dbo].[GetNumberCopiesSharpstown]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNumberCopiesSharpstown]
AS
BEGIN
SELECT No_Of_Copies AS "Number of copies of The Lost Tribe at Sharpstown Library" FROM tbl_BookCopies WHERE Branch_ID = 1 AND BookID = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetSharpstownBorrowersDue]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSharpstownBorrowersDue] AS
SELECT a1.Title AS 'Books Due Today at Sharpstown', a2.Name AS 'Borrower', a2.BorrowerAddress AS 'Borrower Address'
FROM tbl_Borrower a2
INNER JOIN tbl_BookLoans a3 ON a3.CardNo = a2.CardNo
INNER JOIN tbl_Book a1 ON a1.BookID = a3.BookID
WHERE a3.DueDate = CAST(CURRENT_TIMESTAMP AS DATE);

GO
/****** Object:  StoredProcedure [dbo].[GetStephenKingCentralCopyNumber]    Script Date: 4/17/2018 6:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStephenKingCentralCopyNumber] AS
SELECT a1.AuthorName, a2.Title, a3.BranchName, a4.No_Of_Copies
FROM tbl_Authors a1
INNER JOIN tbl_Book a2 ON a1.BookID = a2.BookID
INNER JOIN tbl_BookCopies a4 ON a4.BookID = a2.BookID
INNER JOIN tbl_LibraryBranch a3 ON a3.Branch_ID = a4.Branch_ID
WHERE a3.BranchName = 'Central' AND a1.AuthorName = 'Stephen King'

GO
USE [master]
GO
ALTER DATABASE [db_BooksTest5] SET  READ_WRITE 
GO
