SELECT FirstName,LastName,HireDate,D.Name AS DeptName
FROM Employees AS E JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
WHERE E.HireDate > '1999-01-01' AND D.Name IN('Sales','Finance')
ORDER BY E.HireDate