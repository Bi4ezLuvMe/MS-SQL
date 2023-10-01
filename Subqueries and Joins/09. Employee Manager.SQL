SELECT E.EmployeeID,E.FirstName,E.ManagerID,EP.FirstName AS ManagerName
FROM Employees AS E JOIN Employees AS EP ON E.ManagerID=EP.EmployeeID
WHERE E.ManagerID IN(3,7)
ORDER BY E.EmployeeID