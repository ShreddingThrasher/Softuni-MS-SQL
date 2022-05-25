ALTER TABLE [Users]
DROP CONSTRAINT PK__Users__CombineIdUsername;

ALTER TABLE [Users]
ADD CONSTRAINT PK__Users__Id
PRIMARY KEY ([Id]);

ALTER TABLE [Users]
ADD CONSTRAINT CK__Username__Length
CHECK (LEN([Username]) >= 3);
