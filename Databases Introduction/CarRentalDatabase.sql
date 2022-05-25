CREATE DATABASE [CarRental];

USE [CarRental];

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY,
	[CategoryName] VARCHAR(30) NOT NULL,
	[DailyRate] DECIMAL,
	[WeeklyRate] DECIMAL,
	[MonthlyRate] DECIMAL,
	[WeekendRate] DECIMAL
);

CREATE TABLE [Cars](
	[Id] INT PRIMARY KEY,
	[PlateNumber] CHAR(7) NOT NULL,
	[Manufacturer] VARCHAR(30) NOT NULL,
	[Model] VARCHAR(30) NOT NULL,
	[CarYear] INT NOT NULL,
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]) NOT NULL,
	[Doors] TINYINT NOT NULL,
	[Picture] IMAGE,
	[Condition] VARCHAR(30),
	[Available] BIT NOT NULL
)

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[Title] NVARCHAR(30),
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Customers](
	[Id] INT PRIMARY KEY,
	[DriverLicenseNumber] CHAR(8) NOT NULL,
	[FullName] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(100) NOT NULL,
	[City] NVARCHAR(30) NOT NULL,
	[ZIPCode] NVARCHAR(4) NOT NULL,
	[NOTES] NVARCHAR(MAX)
)

CREATE TABLE [RentalOrders](
	[Id] INT PRIMARY KEY,
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]) NOT NULL,
	[CustomerId] INT FOREIGN KEY REFERENCES [Customers]([Id]) NOT NULL,
	[CarId] INT FOREIGN KEY REFERENCES [Cars]([Id]) NOT NULL,
	[TankLevel] DECIMAL NOT NULL,
	[KilometrageStart] DECIMAL NOT NULL,
	[KilometrageEnd] DECIMAL NOT NULL,
	[TotalKilometrage] DECIMAL NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalDays] INT,
	[RateApplied] DECIMAL NOT NULL,
	[TaxRate] DECIMAL NOT NULL,
	[OrderStatus] VARCHAR(30),
	[Notes] NVARCHAR(MAX)
)

INSERT INTO [Categories]([Id], [CategoryName], [DailyRate], [WeeklyRate], [MonthlyRate], [WeekendRate])
	VALUES
(1, 'SomeCategory', 12.5, 13.5, 10, 56.2),
(2, 'AnotherCategory', 12, 13.7, 12, 43.2),
(3, 'YetAnotherCategory', 10.5, 17.2, 8, 12.2)

INSERT INTO [Cars]([Id], [PlateNumber], [Manufacturer], [Model], [CarYear], [CategoryId], [Doors], [Picture], [Condition], [Available])
	VALUES
(1, 'B1034TH', 'Ford', 'Mustang', '1968', 1, 2, NULL, 'Like new', 1),
(2, 'B1034TH', 'Ford', 'Mustang', '1968', 1, 2, NULL, 'Like new', 1),
(3, 'B1034TH', 'Ford', 'Mustang', '1968', 1, 2, NULL, 'Like new', 1)

INSERT INTO [Employees]([Id], [FirstName], [LastName], [Title], [Notes])
	VALUES
(1, 'John', 'Doe', 'Worker', NULL),
(2, 'John', 'Doe', 'Worker', NULL),
(3, 'John', 'Doe', 'Worker', NULL)

INSERT INTO [Customers]([Id], [DriverLicenseNumber], [FullName], [Address], [City], [ZIPCode], [NOTES])
	VALUES
(1, '12345678', 'Some Full Name', 'Some Address', 'Some City', '1234', NULL),
(2, '12345678', 'Some Full Name', 'Some Address', 'Some City', '1234', NULL),
(3, '12345678', 'Some Full Name', 'Some Address', 'Some City', '1234', NULL)

INSERT INTO [RentalOrders]([Id], [EmployeeId], [CustomerId], [CarId], [TankLevel],
						   [KilometrageStart], [KilometrageEnd], [TotalKilometrage],
						   [StartDate], [EndDate], [TotalDays], [RateApplied],
						   [TaxRate], [OrderStatus], [Notes])
	VALUES
(1, 1, 2, 3, 15.3, 20, 100, 80, '2022-12-03', '2022-12-04', 2, 8.2, 4.6, 'Finished', NULL),
(2, 1, 2, 3, 15.3, 20, 100, 80, '2022-12-03', '2022-12-04', 2, 8.2, 4.6, 'Finished', NULL),
(3, 1, 2, 3, 15.3, 20, 100, 80, '2022-12-03', '2022-12-04', 2, 8.2, 4.6, 'Finished', NULL)