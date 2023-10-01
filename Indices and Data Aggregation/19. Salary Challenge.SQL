SELECT TOP 10 FirstName,LastName,DepartmentID FROM Employees AS E  WHERE Salary > (SELECT AVG(Salary) FROM Employees AS EAVG WHERE E.DepartmentID = EAVG.DepartmentID )
ORDER BY DepartmentID