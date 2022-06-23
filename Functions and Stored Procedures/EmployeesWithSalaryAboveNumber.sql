
CREATE OR ALTER PROC usp_GetEmployeesSalaryAboveNumber(@number DECIMAL(18, 4))
AS
BEGIN
	
	SELECT 
		e.FirstName,
		e.LastName
	FROM Employees AS e
	WHERE e.Salary >= @number
END

GO

EXEC usp_GetEmployeesSalaryAboveNumber 43.9023