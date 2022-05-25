CREATE TABLE [People](
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2000000),
	[Height] DECIMAL(3, 2),
	[Weight] DECIMAL(5, 2),
	[Gender] CHAR(1) NOT NULL,
	CHECK ([Gender] = 'm' OR [Gender] = 'f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
)

INSERT INTO [People]([Name], [Height], [Weight], [Gender], [Birthdate])
	VALUES
('Pesho', 1.80, 84.2, 'm', '1980-12-04'),
('Niki', 1.70, 54.2, 'm', '1987-10-04'),
('Mima', 1.60, 74.1, 'f', '1980-09-03'),
('Iliana', NULL, NULL, 'f', '1993-03-19'),
('Gosho', 1.93, 104.2, 'm', '1970-02-28')