
CREATE OR ALTER PROC usp_EmployeesBySalaryLevel(@SalaryLevel VARCHAR(7))
AS
BEGIN
	
	SELECT
		e.FirstName,
		e.LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) LIKE @SalaryLevel
END

GO

EXEC usp_EmployeesBySalaryLevel 'High';