
CREATE OR ALTER PROC usp_GetEmployeesSalaryAbove35000
AS
BEGIN
	SELECT
		e.FirstName,
		e.LastName
	FROM Employees AS e
	WHERE e.Salary > 35000
END

GO

EXEC usp_GetEmployeesSalaryAbove35000