
CREATE OR ALTER PROC usp_GetEmployeesFromTown(@townName VARCHAR(30))
AS
BEGIN

	SELECT
		e.FirstName,
		e.LastName
	FROM Employees AS e
	JOIN Addresses AS a ON e.AddressID = a.AddressID
	JOIN Towns AS t On a.TownID = t.TownID
	WHERE t.[Name] LIKE @townName;

END

GO

EXEC usp_GetEmployeesFromTown 'Sofia';