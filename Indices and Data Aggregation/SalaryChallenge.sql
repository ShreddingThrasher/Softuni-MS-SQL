SELECT TOP(10)
	e.FirstName,
	e.LastName,
	e.DepartmentID
FROM Employees AS e
JOIN (SELECT 
			e.DepartmentID,
			AVG(e.Salary) AS AverageSalary
		FROM Employees AS e
		GROUP BY e.DepartmentID
		) AS ds ON e.DepartmentID = ds.DepartmentID
WHERE e.Salary > ds.AverageSalary
ORDER BY e.DepartmentID;