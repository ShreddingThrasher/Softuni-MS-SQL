CREATE DATABASE [Movies];

USE [Movies];

CREATE TABLE [Directors](
	[Id] INT PRIMARY KEY,
	[DirectorName] VARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Genres](
	[Id] INT PRIMARY KEY,
	[GenreName] VARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY,
	[CategoryName] VARCHAR(30) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Movies](
	[Id] INT PRIMARY KEY,
	[Title] VARCHAR(50) NOT NULL,
	[DirectorId] INT FOREIGN KEY REFERENCES [Directors]([Id]) NOT NULL,
	[CopyrightYear] DATE,
	[Length] NVARCHAR(8) NOT NULL,
	[GenreId] INT FOREIGN KEY REFERENCES [Genres]([Id]) NOT NULL,
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]) NOT NULL,
	[Rating] DECIMAL(2,1),
	[Notes] NVARCHAR(MAX)
);


INSERT INTO [Directors]([Id], [DirectorName], [Notes])
	VALUES
(1, 'George', NULL),
(2, 'Peter', NULL),
(3, 'Michael', NULL),
(4, 'Lisa', NULL),
(5, 'Zoe', NULL);

INSERT INTO [Genres]([Id], [GenreName], [Notes])
	VALUES
(1, 'Horror', NULL),
(2, 'Comedy', NULL),
(3, 'Adventure', NULL),
(4, 'Thriller', NULL),
(5, 'Action', NULL);

INSERT INTO [Categories]([Id], [CategoryName], [Notes])
	VALUES
(1, '1980s', NULL),
(2, '1990s', NULL),
(3, '2000s', NULL),
(4, '2010s', NULL),
(5, '2020s', NULL);

INSERT INTO [Movies]([Id], [Title], [DirectorId], [Length], [GenreId], [CategoryId], [Rating], [Notes])
	VALUES
(1, 'Silent Hill', 1, '02:03:15', 1, 3, NULL, NULL),
(2, 'American Pie', 4, '01:32:72', 2, 3, NULL, NULL),
(3, 'The Mask', 3, '01:47:21', 2, 2, NULL, NULL),
(4, 'The Batman', 5, '02:23:21', 5, 5, NULL, NULL),
(5, 'Shooter', 1, '02:05:12', 5, 1, NULL, NULL);