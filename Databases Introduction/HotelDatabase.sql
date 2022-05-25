CREATE DATABASE [Hotel];

USE [Hotel];

CREATE TABLE [Employees](
	[Id] INT IDENTITY PRIMARY KEY,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[Title] VARCHAR(20),
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Customers](
	[AccountNumber] INT IDENTITY PRIMARY KEY,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[PhoneNumber] CHAR(13) NOT NULL,
	[EmergencyName] NVARCHAR(30) NOT NULL,
	[EmergencyNumber] CHAR(10) NOT NULL,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [RoomStatus](
	[RoomStatus] VARCHAR(20) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [RoomTypes](
	[RoomType] VARCHAR(20) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [BedTypes](
	[BedType] VARCHAR(20) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Rooms](
	[RoomNumber] INT IDENTITY PRIMARY KEY,
	[RoomType] VARCHAR(20) FOREIGN KEY REFERENCES [RoomTypes]([RoomType]) NOT NULL,
	[BedType] VARCHAR(20) FOREIGN KEY REFERENCES [BedTypes]([BedType]) NOT NULL,
	[Rate] DECIMAL,
	[RoomStatus] VARCHAR(20) FOREIGN KEY REFERENCES [RoomStatus]([RoomStatus]) NOT NULL,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Payments](
	[Id] INT IDENTITY PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
	[PaymentDate] DATE NOT NULL,
	[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
	[FirstDateOccupied] DATE NOT NULL,
	[LastDateOccupied] DATE NOT NULL,
	[TotalDays] INT NOT NULL,
	[AmountCharged] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[TaxAmount] DECIMAL NOT NULL,
	[PaymentTotal] DECIMAL NOT NULL,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Occupancies](
	[Id] INT IDENTITY PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]),
	[DateOccupied] DATE NOT NULL,
	[AccountNumber] INT FOREIGN KEY REFERENCES [Customers]([AccountNumber]) NOT NULL,
	[RoomNumber] INT NOT NULL,
	[RateApplied] DECIMAL NOT NULL,
	[PhoneCharge] DECIMAL NOT NULL,
	[Notes] NVARCHAR(MAX)
)

INSERT INTO [Employees]([FirstName], [LastName], [Title], [Notes])
	VALUES
('John', 'Doe', 'Worker', NULL),
('John', 'Doe', 'Worker', NULL),
('John', 'Doe', 'Worker', NULL)

INSERT INTO [Customers]([FirstName], [LastName], [PhoneNumber], [EmergencyName], [EmergencyNumber], [Notes])
	VALUES
('Michael', 'Keaton', '+359877123456', 'MK', '1234567890', NULL),
('Michael', 'Keaton', '+359877123456', 'MK', '1234567890', NULL),
('Michael', 'Keaton', '+359877123456', 'MK', '1234567890', NULL)

INSERT INTO [RoomStatus]([RoomStatus], [Notes])
	VALUES
('Clean', NULL),
('Perfect', NULL),
('Cold', NULL)

INSERT INTO [RoomTypes]([RoomType], [Notes])
	VALUES
('Apartment', NULL),
('Cellar', NULL),
('Basement', NULL)

INSERT INTO [BedTypes]([BedType], [Notes])
	VALUES
('Single', NULL),
('Double', NULL),
('Large', NULL)

INSERT INTO [Rooms]([RoomType], [BedType], [Rate], [RoomStatus], [Notes])
	VALUES
('Apartment', 'Large', 10.2, 'Perfect', NULL),
('Apartment', 'Large', 10.2, 'Perfect', NULL),
('Apartment', 'Large', 10.2, 'Perfect', NULL)

INSERT INTO [Payments]([EmployeeId], [PaymentDate], [AccountNumber], [FirstDateOccupied],
					   [LastDateOccupied], [TotalDays], [AmountCharged], [TaxRate],
					   [TaxAmount], [PaymentTotal], [Notes])
	VALUES
(1, '2022-12-12', 1, '2021-12-12', '2022-12-11', 364, 150.39, 9.7, 123, 321, NULL),
(1, '2022-12-12', 1, '2021-12-12', '2022-12-11', 364, 150.39, 9.7, 123, 321, NULL),
(1, '2022-12-12', 1, '2021-12-12', '2022-12-11', 364, 150.39, 9.7, 123, 321, NULL)

INSERT INTO [Occupancies]([EmployeeId], [DateOccupied], [AccountNumber], [RoomNumber],
						  [RateApplied], [PhoneCharge], [Notes])
	VALUES
(1, '2022-12-11', 1, 1, 12.2, 321.123, NULL),
(1, '2022-12-11', 1, 1, 12.2, 321.123, NULL),
(1, '2022-12-11', 1, 1, 12.2, 321.123, NULL);