USE db_BooksTest6

CREATE TABLE tbl_Publisher (
		Name VARCHAR(50) PRIMARY KEY NOT NULL,
		PublisherAddress VARCHAR(100) NOT NULL,
		Phone VARCHAR(20) NOT NULL
	);

	CREATE TABLE tbl_Book (
		BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		Title VARCHAR(100) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES tbl_Publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_Authors (
		BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_LibraryBranch (
		Branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		LibraryAddress VARCHAR(100) NOT NULL
	);

	CREATE TABLE tbl_Borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Name VARCHAR(50) NOT NULL,
		BorrowerAddress VARCHAR(100) NOT NULL,
		Phone VARCHAR(20) NOT NULL
	);

	CREATE TABLE tbl_BookLoans (
		BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES tbl_Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		Branch_ID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES tbl_LibraryBranch(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DueDate DATE NOT NULL
	);

	CREATE TABLE tbl_BookCopies (
		BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES tbl_Book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		Branch_ID INT NOT NULL CONSTRAINT fk_Branch_ID2 FOREIGN KEY REFERENCES tbl_LibraryBranch(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		No_Of_Copies VARCHAR(20) NOT NULL
	);

	INSERT INTO tbl_Publisher 
		(Name, PublisherAddress, Phone)
		VALUES
		('Random House', '1745 Broadway, New York, NY 10019 USA', '1-800-733-3000'),
		('Simon and Schuster', '1230 6th Ave, New York, NY 10020 USA', '1-800-223-2336'),
		('Scholastic Corporation', '557 Broadway New York, NY 10012 USA', '1-800-724-6527'),
		('Picador USA', '175 5th Ave, New York, NY 10010 USA', '1-800-221-7945'),
		('Broadway Books', '1745 Broadway New York, NY 10019 USA', '1-212-782-9000'),
		('Farrar, Straus and Giroux', '175 Varick Street, 9th Floor. New York, NY 10014 USA', '1-212-741-6900'),
		('Houghton Mifflin Harcourt', '9205 SouthPark Center Loop Orlando, FL 32819 USA', '1-800-225-5425'),
		('W.W. Norton & Company', '500 5th Ave # 6, New York, NY 10110 USA', '1-212-354-5500'),
		('Image Comics', '2701 NW Vaughn Street, Suite 780 Portland, Oregon 97210 USA', 'Not Found'),
		('Tor Books', '175 Fifth Avenue, New York, NY 10010 USA', 'Not Found')
	;

	INSERT INTO tbl_Book 
		(Title, PublisherName)
		VALUES
		('The Lost Tribe', 'Picador USA'),
		('The Hunger Games', 'Scholastic Corporation'),
		('Juniper', 'Random House'),
		('Flowers in the Attic', 'Simon and Schuster'),
		('Mary Bloody Mary', 'Houghton Mifflin Harcourt'),
		('Enders Game', 'Tor Books'),
		('The Warriors', 'Random House'),
		('Troublemaker', 'Random House'),
		('Powering the Future', 'Random House'),
		('The Walking Dead', 'Image Comics'),
		('Hyperbole and a Half', 'Simon and Schuster'),
		('Ready Player One', 'Broadway Books'),
		('Astrophysics for People in a Hurry', 'W.W. Norton & Company'),
		('Norse Mythology', 'W.W. Norton & Company'),
		('A Wrinkle in Time', 'Farrar, Straus and Giroux'),
		('It', 'Simon and Schuster'),
		('1984', 'Houghton Mifflin Harcourt'),
		('Misery', 'Random House'),
		('A Brief History of Time', 'Random House'),
		('A Game of Thrones', 'Random House')
	;

	SELECT * FROM tbl_Book;

		INSERT INTO tbl_Authors
		(BookID, AuthorName)
		VALUES
	(1, 'Mark Lee'),
	(2, 'Suzanne Collins'),
	(3, 'Monica Furlong'),
	(4, 'V.C. Andrews'),
	(5, 'Carolyn Meyer'),
	(6, 'Orson Scott Card'),
	(7, 'Sol Yurick'),
	(8, 'Leah Remini'),
	(9, 'Daniel B. Botkin'),
	(10, 'Robert Kirkman'),
	(11, 'Allie Brosh'),
	(12, 'Ernest Cline'),
	(13, 'Neil deGrasse Tyson'),
	(14, 'Neil Gaiman'),
	(15, 'Madeleine L''Engle'),
	(16, 'Stephen King'),
	(17, 'George Orwell'),
	(18, 'Stephen King'),
	(19, 'Stephen Hawking'),
	(20, 'George R.R. Martin')
	;

	SELECT * FROM tbl_Authors

	INSERT INTO tbl_LibraryBranch
		(BranchName, LibraryAddress)
		VALUES
		('Sharpstown','1231 E Harrison St Seattle, WA 98112 USA'),
		('Central','7105 37th Ave S Seattle, WA 98118 USA'),
		('Pacific','4526 Adams St SW Seattle, WA 98136 USA'),
		('Roxbury','3559 Yesler St SW Seattle, WA 98106 USA')
;

SELECT * FROM tbl_LibraryBranch;

INSERT INTO tbl_Borrower
	(Name, BorrowerAddress, Phone)
	VALUES
	('Charlie Zap','1049 Wesley St W Seattle, WA 98138 USA','1-206-523-5254'),
	('Amy Mann','2359 1st Ave N Seattle, WA 98103 USA','1-206-339-3968'),
	('Zelda Williams','4041 N 62nd St Seattle, WA 98103 USA','1-206-725-5349'),
	('Carrie Red','6304 10th Ave E Seattle, WA 98102 USA','1-425-691-3907'),
	('Rick Armstrong','5606 16th Ave SW Seattle, WA 98106 USA','1-425-967-2028'),
	('Ted Rosenstein','1124 Alki Ave SW Seattle, WA 98116 USA','1-206-636-6306'),
	('Mustafa Mohammed','8284 Delridge Way SW Seattle, WA 98106','1-206-729-7384'),
	('Johnathan Smith','2246 23rd Ave S Seattle, WA 98122 USA','1-206-564-4435'),
	('Seraphina Lucia', '9654 16th Ave SW Seattle, WA 98106 USA', '1-206-987-7924'),
	('Fred Hoist','3569 42nd Ave S Seattle, WA 98118','1-206-465-5294')
;

Select * FROM tbl_Borrower;

INSERT INTO tbl_BookLoans
	(BookID, Branch_ID, CardNo, DateOut, DueDate)
	VALUES
	(1,3,6,'2016-01-21','2016-03-21'),
	(1,4,7,'2016-01-16','2016-03-16'),
	(3,4,4,'2016-01-30','2016-03-30'),
	(20,2,2,'2016-01-05','2016-03-05'),
	(12,3,5,'2016-02-01','2016-04-01'),
	(16,2,2,'2016-02-03','2016-04-03'),
	(18,2,2,'2016-02-12','2016-04-12'),
	(11,2,2,'2016-02-06','2016-04-06'),
	(5,2,2,'2016-02-18','2016-04-18'),
	(10,2,2,'2016-02-14','2016-04-14'),
	(1,1,8,'2016-02-23','2016-04-23'),
	(12,3,1,'2016-02-28','2016-04-28'),
	(14,3,1,'2016-03-02','2016-05-02'),
	(17,3,1,'2016-03-01','2016-05-01'),
	(19,3,1,'2016-03-06','2016-05-06'),
	(13,3,1,'2016-03-10','2016-05-10'),
	(9,3,1,'2016-03-11','2016-05-11'),
	(6,3,1,'2016-03-09','2016-05-09'),
	(2,4,3,'2016-03-16','2016-05-16'),
	(12,4,3,'2016-03-25','2016-05-25'),
	(20,4,3,'2016-03-22','2016-05-22'),
	(5,4,3,'2016-03-29','2016-05-29'),
	(11,4,3,'2016-04-04','2016-06-04'),
	(14,4,3,'2016-04-09','2016-06-09'),
	(16,4,3,'2016-04-08','2016-06-08'),
	(18,4,3,'2016-04-11','2016-06-11'),
	(10,4,3,'2016-04-19','2016-06-19'),
	(3,4,3,'2016-04-17','2016-06-17'),
	(4,4,4,'2016-04-18','2016-06-18'),
	(5,4,4,'2016-04-20','2016-06-20'),
	(6,4,4,'2016-04-21','2016-06-21'),
	(11,4,4,'2016-04-26','2016-06-26'),
	(15,4,4,'2016-04-27','2016-06-27'),
	(20,4,4,'2016-04-30','2016-06-30'),
	(13,1,8,'2016-05-03','2016-07-03'),
	(19,1,8,'2016-05-06','2016-07-06'),
	(7,1,8,'2016-05-09','2016-07-09'),
	(10,1,8,'2016-05-12','2016-07-12'),
	(15,1,8,'2016-05-15','2016-07-15'),
	(12,1,8,'2016-06-05','2016-08-05'),
	(6,1,8,'2016-06-14','2016-08-14'),
	(2,1,8,'2016-06-17','2016-08-17'),
	(20,1,8,'2016-06-20','2016-08-20'),
	(14,3,6,'2016-07-03','2016-09-03'),
	(16,3,6,'2016-07-07','2016-09-07'),
	(13,3,6,'2016-07-11','2016-09-11'),
	(17,3,6,'2016-07-18','2016-09-18'),
	(4,3,6,'2016-07-19','2016-09-19'),
	(2,3,6,'2016-08-15','2016-10-15'),
	(20,3,6,'2016-08-25','2016-10-25'),
	(14,4,4,'2018-02-20','2018-04-20')
;	

SELECT * FROM tbl_BookLoans;

INSERT INTO tbl_BookCopies
	(BookID, Branch_ID, No_Of_Copies)
	VALUES
	(1,1,10),
	(2,1,20),
	(3,1,11),
	(4,1,14),
	(5,1,9),
	(6,1,18),
	(7,1,8),
	(8,1,15),
	(9,1,7),
	(10,1,22),
	(11,1,10),
	(12,1,19),
	(13,1,10),
	(14,1,9),
	(15,1,16),
	(16,1,20),
	(17,1,12),
	(18,1,11),
	(19,1,13),
	(20,1,25),
	(1,2,8),
	(2,2,16),
	(3,2,7),
	(4,2,9),
	(5,2,6),
	(6,2,11),
	(7,2,6),
	(8,2,10),
	(9,2,8),
	(10,2,19),
	(11,2,12),
	(12,2,15),
	(13,2,13),
	(14,2,7),
	(15,2,15),
	(16,2,16),
	(17,2,10),
	(18,2,8),
	(19,2,13),
	(20,2,20),
	(1,3,9),
	(2,3,17),
	(3,3,6),
	(4,3,6),
	(5,3,7),
	(6,3,15),
	(7,3,11),
	(8,3,13),
	(9,3,7),
	(10,3,18),
	(11,3,18),
	(12,3,16),
	(13,3,9),
	(14,3,7),
	(15,3,14),
	(16,3,19),
	(17,3,10),
	(18,3,7),
	(19,3,12),
	(20,3,24),
	(1,4,9),
	(2,4,19),
	(3,4,6),
	(4,4,6),
	(5,4,6),
	(6,4,14),
	(7,4,12),
	(8,4,16),
	(9,4,10),
	(10,4,19),
	(11,4,13),
	(12,4,20),
	(13,4,15),
	(14,4,7),
	(15,4,17),
	(16,4,20),
	(17,4,12),
	(18,4,10),
	(19,4,13),
	(20,4,29)
;

SELECT * FROM tbl_BookCopies;

CREATE PROCEDURE dbo.uspGetNumberCopiesSharpstown
AS
BEGIN
SELECT No_Of_Copies AS "Number of copies of The Lost Tribe at Sharpstown Library" FROM tbl_BookCopies WHERE Branch_ID = 1 AND BookID = 1
END
GO

EXEC dbo.uspGetNumberCopiesSharpstown

CREATE PROCEDURE dbo.uspGetNumberCopies
AS
BEGIN
SELECT No_Of_Copies AS "Number of Copies of The Lost Tribe in Each Library (Sharpstown, Central, Pacific, Roxbury)" FROM tbl_BookCopies WHERE Branch_ID BETWEEN 1 AND 4 AND BookID = 1
END
GO

EXEC dbo.uspGetNumberCopies

CREATE PROC dbo.uspGetNullBorrowers AS
SELECT a1.Name AS 'People Who Have Not Checked Out Any Books'
FROM tbl_Borrower a1
LEFT OUTER JOIN tbl_BookLoans a2 ON a1.CardNo = a2.CardNo
WHERE a2.CardNo IS NULL
GO

EXEC dbo.uspGetNullBorrowers

CREATE PROC dbo.uspGetBorrower5PlusBooks AS
SELECT a1.Name AS 'Borrower Name', a1.BorrowerAddress, COUNT(a2.BookID) AS 'Borrowers with 5+ Books Checked Out'
FROM tbl_Borrower a1
INNER JOIN tbl_BookLoans a2 ON a1.CardNo = a2.CardNo
GROUP BY a1.Name, a1.BorrowerAddress
HAVING COUNT(a2.BookID) > 5
GO

EXEC dbo.uspGetBorrower5PlusBooks

CREATE PROC dbo.uspGetNumberCopiesLoanedBranch AS
SELECT a1.BranchName AS 'Branch Name', COUNT(a2.BookID) AS 'Number of Copies Loaned From Branch' /*What I did but with correct syntax*/
FROM tbl_LibraryBranch a1
INNER JOIN tbl_BookLoans a2 ON a1.Branch_ID = a2.Branch_ID
GROUP BY a1.BranchName
GO

EXEC dbo.uspGetNumberCopiesLoanedBranch

CREATE PROC dbo.uspGetSharpstownBorrowersDue AS
SELECT a1.Title AS 'Books Due Today at Sharpstown', a2.Name AS 'Borrower', a2.BorrowerAddress AS 'Borrower Address'
FROM tbl_Borrower a2
INNER JOIN tbl_BookLoans a3 ON a3.CardNo = a2.CardNo
INNER JOIN tbl_Book a1 ON a1.BookID = a3.BookID
WHERE a3.DueDate = CAST(CURRENT_TIMESTAMP AS DATE);
GO

EXEC dbo.uspGetSharpstownBorrowersDue

CREATE PROC dbo.uspGetStephenKingCentralCopyNumber AS
SELECT a1.AuthorName, a2.Title, a3.BranchName, a4.No_Of_Copies
FROM tbl_Authors a1
INNER JOIN tbl_Book a2 ON a1.BookID = a2.BookID
INNER JOIN tbl_BookCopies a4 ON a4.BookID = a2.BookID
INNER JOIN tbl_LibraryBranch a3 ON a3.Branch_ID = a4.Branch_ID
WHERE a3.BranchName = 'Central' AND a1.AuthorName = 'Stephen King'
GO

EXEC dbo.uspGetStephenKingCentralCopyNumber
