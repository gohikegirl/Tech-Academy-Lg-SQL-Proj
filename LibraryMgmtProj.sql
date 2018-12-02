USE master

CREATE DATABASE libraryMgmt

USE libraryMgmt

CREATE TABLE Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
	);

CREATE TABLE Publisher(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(150),
	Phone VARCHAR (20)
);

CREATE TABLE Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Title VARCHAR(150),
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Book_Authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(150) NOT NULL,
);

CREATE TABLE Book_Copies(
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(150),
	Phone VARCHAR (20)	
);

CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE,
	DateIn DATE	
);



INSERT INTO Library_Branch (BranchName, Address)
	VALUES
	('Central', '111 Central Street, SF, CA 94101'),
	('Sharpstown', '222 Sharp Street, SF, CA 94102'),
	('Westside', '333 West Street, SF, CA 94103'),
	('Eastside', '444 East Street, SF, CA 94104')
;

INSERT INTO Publisher (PublisherName, Address, Phone)
	VALUES
	('Alex House', '111 Made Up Circle, SF, CA 94109', '111-222-3333'),
	('SF Books', '222 Made Up Way, Sacarmento, CA 95112', '123-222-3333'),
	('Jarvis Publishing', '333 Made Up Street, NYC, NY 20222', '224-222-4444'),
	('Random House', '444 Made Up Road, St Paul, MN 55125', '444-221-2222'),
	('Alfred Knopf', '555 Imaginary Road, LA, CA 93333', '555-221-2232'),
	('Food Books', '666 Imaginary Way LA, CA 95555', '666-221-2264'),
	('Penguin', '777 Whoknows Street, Chicago, IL  66666', '777-711-9999'),
	('Sport Books', '888 WhereamI Road, SF, CA 94112', '999-888-8123')
;


INSERT INTO Books (Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Alex House'),
	('Hipsterdom', 'SF Books'),
	('Good but Expensive Food', 'SF Books'),
	('Even More Expensive Coffee', 'SF Books'),
	('What About Me?', 'Jarvis Publishing'),
	('All About Me', 'Jarvis Publishing'),
	('Petting and Me', 'Jarvis Publishing'),
	('When the World Is Not About Me', 'Jarvis Publishing'),
	('It', 'Random House'),
	('The Green Mile', 'Random House'),
	('Carrie', 'Random House'),
	('Kitchen Confidential', 'Alfred Knopf'),
	('A Cook''s Tour', 'Alfred Knopf'),
	('An Ominivore''s Dilemma', 'Alfred Knopf'),
	('The Eater''s Manifesto', 'Alfred Knopf'),
	('Master the Art of French Cooking', 'Food Books'),
	('My Time in France', 'Food Books'),
	('PokPok Cookbook', 'Food Books'),
	('Cravings', 'Food Books'),
	('Betsy and the World', 'Penguin'),
	('Code', 'Penguin'),
	('The Well Built Triathlete', 'Sport Books'),
	('Racing Well', 'Alex House'),
	('Eating Mexican', 'Food Books'),
	('Fat, Salt, Acid, Heat', 'Food Books')
;

INSERT INTO Book_Authors (BookID, AuthorName)
	VALUES
	(100, 'Who Knows'),
	(101, 'Samantha Bee'),
	(102, 'henry Johnson'),
	(103, 'Barry Sta'),
	(104, 'Jarvis Lee'),
	(105, 'Jarvis Lee'),
	(106, 'Jarvis Lee'),
	(107, 'Jarvis Lee'),
	(108, 'Stephen King'),
	(109, 'Stephen King'),
	(110, 'Stephen King'),
	(111, 'Anthony Bourdain'),
	(112, 'Anthony Bourdain'),
	(113, 'Michaell Pollan'),
	(114, 'Michael Pollan'),
	(115, 'Julia Child'),
	(116, 'Julia Child'),
	(117, 'Andy Richter'),
	(118, 'Christy Teigen'),
	(119, 'Maude Lovelace'),
	(120, 'Charles Petzold'),
	(121, 'Matt Johnson'),
	(122, 'John Dahlz'),
	(123, 'Rick Bayless'),
	(124, 'Samin Nosrat')
;

INSERT INTO Book_Copies (BookID, BranchID, Number_Of_Copies)
	VALUES
	(100,2,2),
	(101,2,2),
	(102,3,2),
	(103,2,2),
	(104,1,2),
	(105,4,2),
	(106,2,2),
	(107,3,2),
	(108,2,2),
	(109,1,2),
	(110,1,2),
	(111,4,2),
	(112,4,2),
	(113,1,2),
	(114,4,2),
	(115,1,2),
	(116,3,2),
	(117,1,2),
	(118,3,2),
	(119,1,2),
	(120,3,2),
	(121,1,2),
	(122,3,2),
	(123,3,2),
	(124,1,2)
;

INSERT INTO Borrower (Name, Address, Phone)
	VALUES
	('Alex Aguilera', '1080 Sutter Street, SF, CA 94109', '111-234-5678'),
	('Michelle Lee', '1160 Mission Street, SF, CA 94102', '222-234-5678'),
	('Jennifer Lee', '1 Post Street, SF, CA 94612', '333-234-5678'),
	('Judith Boschini', '1950 Franklin Street, Oakland, CA 96412', '444-234-5678'),
	('Kathryn Sullivan', '1800 Harrison Street, Oakland, CA 94612', '555-234-5678'),
	('Peter Clauter', '50 Geary Street, SF, CA 91110', '666-234-5678'),
	('Jelle Vadenhoeke', '3342 16th Street, SF, CA 96661', '777-234-5678'),
	('Kurt Bockes', '1081 Sutter Street, SF, CA 94109', '888-234-5678')
	
;

INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (100, 2, 1001, CAST(N'2018-05-18' AS Date), CAST(N'2018-06-01' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (101, 2, 1002, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-26' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (102, 3, 1003, CAST(N'2018-06-14' AS Date), CAST(N'2018-06-28' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (103, 2, 1003, CAST(N'2017-11-08' AS Date), CAST(N'2017-11-22' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (104, 1, 1005, CAST(N'2017-01-24' AS Date), CAST(N'2017-02-07' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (105, 4, 1005, CAST(N'2017-03-23' AS Date), CAST(N'2017-04-06' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (106, 2, 1006, CAST(N'2018-09-17' AS Date), CAST(N'2018-10-01' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (107, 3, 1003, CAST(N'2017-02-06' AS Date), CAST(N'2017-02-20' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (108, 2, 1001, CAST(N'2018-03-24' AS Date), CAST(N'2018-04-07' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (109, 1, 1006, CAST(N'2018-05-13' AS Date), CAST(N'2018-05-27' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (110, 1, 1006, CAST(N'2018-11-19' AS Date), CAST(N'2018-12-03' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (111, 4, 1001, CAST(N'2017-02-17' AS Date), CAST(N'2017-03-03' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (112, 4, 1000, CAST(N'2018-08-26' AS Date), CAST(N'2018-09-09' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (113, 1, 1001, CAST(N'2018-07-27' AS Date), CAST(N'2018-08-10' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (114, 4, 1000, CAST(N'2017-01-21' AS Date), CAST(N'2017-02-04' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (115, 2, 1003, CAST(N'2017-06-02' AS Date), CAST(N'2017-06-16' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (116, 4, 1001, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-30' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (117, 1, 1007, CAST(N'2018-03-09' AS Date), CAST(N'2018-03-23' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (118, 3, 1003, CAST(N'2018-11-23' AS Date), CAST(N'2018-12-07' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (119, 1, 1001, CAST(N'2017-12-27' AS Date), CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (120, 3, 1003, CAST(N'2017-07-24' AS Date), CAST(N'2017-08-07' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (121, 1, 1000, CAST(N'2017-04-10' AS Date), CAST(N'2017-04-24' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (122, 3, 1004, CAST(N'2018-05-26' AS Date), CAST(N'2018-06-09' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (123, 3, 1003, CAST(N'2017-06-19' AS Date), CAST(N'2017-07-03' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (124, 1, 1002, CAST(N'2018-08-23' AS Date), CAST(N'2018-09-06' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (100, 2, 1004, CAST(N'2017-07-19' AS Date), CAST(N'2017-08-02' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (101, 2, 1000, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-27' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (102, 3, 1004, CAST(N'2017-11-26' AS Date), CAST(N'2017-12-10' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (103, 2, 1006, CAST(N'2017-07-13' AS Date), CAST(N'2017-07-27' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (104, 1, 1007, CAST(N'2017-04-30' AS Date), CAST(N'2017-05-14' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (105, 4, 1004, CAST(N'2017-09-20' AS Date), CAST(N'2017-10-04' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (106, 2, 1000, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-16' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (107, 3, 1000, CAST(N'2018-09-18' AS Date), CAST(N'2018-10-02' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (108, 2, 1007, CAST(N'2017-05-21' AS Date), CAST(N'2017-06-04' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (109, 1, 1003, CAST(N'2018-02-24' AS Date), CAST(N'2018-03-10' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (110, 1, 1006, CAST(N'2017-11-28' AS Date), CAST(N'2017-12-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (111, 4, 1002, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-22' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (112, 4, 1003, CAST(N'2018-02-23' AS Date), CAST(N'2018-03-09' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (113, 1, 1004, CAST(N'2017-07-13' AS Date), CAST(N'2017-07-27' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (114, 4, 1005, CAST(N'2018-04-28' AS Date), CAST(N'2018-05-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (115, 2, 1001, CAST(N'2018-05-04' AS Date), CAST(N'2018-05-18' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (116, 4, 1004, CAST(N'2018-02-26' AS Date), CAST(N'2018-03-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (117, 1, 1002, CAST(N'2017-06-09' AS Date), CAST(N'2017-06-23' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (118, 3, 1007, CAST(N'2017-02-12' AS Date), CAST(N'2017-02-26' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (119, 1, 1004, CAST(N'2017-03-29' AS Date), CAST(N'2017-04-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (120, 3, 1001, CAST(N'2018-05-29' AS Date), CAST(N'2018-06-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (121, 1, 1005, CAST(N'2018-04-07' AS Date), CAST(N'2018-04-21' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (122, 3, 1006, CAST(N'2018-07-18' AS Date), CAST(N'2018-08-01' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (123, 3, 1000, CAST(N'2018-05-29' AS Date), CAST(N'2018-06-12' AS Date))
GO
INSERT [dbo].[Book_Loans] ([BookID], [BranchID], [CardNo], [DateOut], [DateIn]) VALUES (124, 1, 1007, CAST(N'2018-05-29' AS Date), CAST(N'2018-06-12' AS Date))
GO


CREATE PROCEDURE LostTribeCopies_ST
AS
BEGIN
	SELECT a1.Title, a2.Number_Of_Copies AS 'Copies', a3.BranchName AS 'Branch Name'
	FROM Books a1
	INNER JOIN Book_Copies a2 ON a2.BookID = a1.BookID
	INNER JOIN Library_Branch a3 ON a3.BranchID = a2.BranchID
	WHERE BranchName = 'Sharpstown';
END
GO

CREATE PROCEDURE LostTribeCopies_All
AS
BEGIN
SELECT a1.Title, a2.Number_Of_Copies AS 'Copies', a3.BranchName AS 'Branch Name'
	FROM Books a1
	INNER JOIN Book_Copies a2 ON a2.BookID = a1.BookID
	INNER JOIN Library_Branch a3 ON a3.BranchID = a2.BranchID
	WHERE TItle = 'The Lost Tribe';
END
GO

CREATE PROCEDURE Non-Borrowers
AS
BEGIN
	DECLARE @Today DATE
	SET @Today = CAST (GETDATE() as DATE)
		SELECT a1.Name
		FROM Borrower a1
		INNER JOIN Book_Loans a2 ON a2.CardNo = a1.CardNo
		WHERE DateOut > @Today
		GROUP BY Name 
END
GO

CREATE PROCEDURE BookLoans_ST
AS
BEGIN
	DECLARE @Today DATE
	SET @Today = CAST (GETDATE() as DATE)
		SELECT  a1.Title, a3.Name, a3.Address
		FROM Books a1
		INNER JOIN Book_Loans a2 ON a2.BookID = a1.BookID
		INNER JOIN Borrower a3 ON a3.CardNo = a2.CardNo
		WHERE DateOut = @Today AND BranchID = 2
	
END
GO

CREATE PROCEDURE Branch_Loan_Hist
AS
BEGIN 
	SELECT a1.BranchName, COUNT (a2.BranchID)
		FROM Library_Branch a1
		INNER JOIN Book_Loans a2 ON a2.BranchID = a1.BranchID
		GROUP BY BranchName
END 
GO

CREATE PROCEDURE High_Loaners
AS
BEGIN
	SELECT COUNT(a1.CardNo) AS 'Num of Loans', a1.Name 
	FROM Borrower a1
	INNER JOIN Book_Loans a2 ON a2.CardNo = a1.CardNo
	GROUP BY a1.Name
	HAVING COUNT(*)>5
END
GO

CREATE PROCEDURE StephKing_Central_Cpy
AS
BEGIN
	SELECT a1.Title, a3.AuthorName, a2.Number_Of_Copies, a4.BranchName
		FROM Books a1
		INNER JOIN Book_Copies a2 ON a2.BookID = a1.BookID
		INNER JOIN Book_Authors a3 ON a3.BookID = a1.BookID
		INNER JOIN Library_Branch a4 ON a4.BranchID = a2.BranchID
		WHERE a3.AuthorName = 'Stephen King'AND a4.BranchName = 'Central';
END
GO
