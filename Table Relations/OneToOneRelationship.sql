
CREATE TABLE Passports(
	PassportID INT PRIMARY KEY,
	PassportNumber CHAR(8) NOT NULL
)

CREATE TABLE Persons(
	PersonID INT PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	Salary DECIMAL NOT NULL,
	PassportID INT FOREIGN KEY REFERENCES Passports(PassportID) NOT NULL
)

INSERT INTO Passports(PassportID, PassportNumber)
VALUES 
		(101, 'N34FG21B'),
		(102, 'K65LO4R7'),
		(103, 'ZE657QP2');S

INSERT INTO Persons(PersonID, FirstName, Salary, PassportID)
VALUES
		(1, 'Roberto', 43300.00, 102),
		(2, 'Tom', 56100.00, 103),
		(3, 'Yana', 60200.00, 101);