CREATE DATABASE [SoftUni];

USE [SoftUni];

CREATE TABLE [Towns](
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(30)
)

CREATE TABLE [Addresses](
	[Id] INT IDENTITY PRIMARY KEY,
	[AddressText] NVARCHAR(50),
	[TownId] INT FOREIGN KEY REFERENCES [Towns]([Id]) NOT NULL
)

CREATE TABLE [Departments](
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(30)
)

CREATE TABLE [Employees](
	[Id] INT IDENTITY PRIMARY KEY,
	[FirstName] NVARCHAR(30) NOT NULL,
	[MiddleName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[JobTitle] NVARCHAR(30) NOT NULL,
	[DepartmentId] INT FOREIGN KEY REFERENCES [Departments]([Id]) NOT NULL,
	[HireDate] CHAR(10) NOT NULL,
	[Salary] DECIMAL NOT NULL,
	[AddressId] INT FOREIGN KEY REFERENCES [Addresses]([Id])
)

INSERT INTO [Towns]([Name])
	VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

INSERT INTO [Departments]([Name])
	VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

INSERT INTO [Employees]([FirstName], [MiddleName], [LastName], [JobTitle], [DepartmentId], [HireDate], [Salary])
	VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET DEVELOPER', 4, '01/02/2013', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '02/03/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '28/08/2016', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '09/12/2007', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '28/08/2016', 599.88)
