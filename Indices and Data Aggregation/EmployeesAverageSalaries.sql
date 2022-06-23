SELECT * 
INTO NewTable
FROM Employees AS E
WHERE E.Salary > 30000

DELETE FROM NewTable 
WHERE  ManagerID = 42

UPDATE NewTable
SET Salary += 5000
WHERE DepartmentID = 1 

SELECT E.DepartmentID,
AVG(E.Salary)
FROM NewTable AS E 
GROUP BY DepartmentID