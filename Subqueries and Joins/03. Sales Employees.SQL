SELECT EmployeeID,FirstName,LastName,D.Name AS DepartmentName
FROM Employees AS E JOIN Departments AS D ON E.DepartmentID=D.DepartmentID
WHERE D.Name = 'Sales'
ORDER BY EmployeeID