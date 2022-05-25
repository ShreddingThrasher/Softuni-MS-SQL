CREATE TABLE [Users](
	[Id] INT IDENTITY PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[ProfilePicture] VARBINARY(MAX),
	CHECK (DATALENGTH([ProfilePicture]) <= 900000),
	[LastLoginTime] DATETIME2,
	[IsDeleted] BIT
);

INSERT INTO [Users]([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
	VALUES
('SomeUsername', '123456', NULL, NULL, 1),
('SecondUser', '4214124fasfa', NULL, '2022-03-12 05:45:21', 0),
('ThirdUser', 'asdf234gtsg', NULL, NULL, 1),
('DeletedUser', 'asdfasdfr1r', NULL, '2022-01-01 00:00:00', 0),
('AnotherDeletedUser', 'IaMDEletED', NULL, NULL, 0);


ALTER TABLE [Users]
ADD CONSTRAINT DF_LastLoginTime DEFAULT (GETDATE()) FOR [LastLoginTime];

ALTER TABLE [Users]
ADD CHECK (LEN([Password]) >= 5);