SELECT TOP 50 E.EmployeeID,CONCAT_WS(' ',E.FirstName,E.LastName),CONCAT_WS(' ',EP.FirstName,EP.LastName) AS ManagerName,D.Name AS DepartmentName
FROM Employees AS E JOIN Employees AS EP ON E.ManagerID=EP.EmployeeID JOIN Departments AS D ON E.DepartmentID =D.DepartmentID
ORDER BY E.EmployeeID