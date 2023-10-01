SELECT TOP 5 E.EmployeeID,E.FirstName,
CASE
WHEN P.StartDate >'2005-01-01' THEN NULL
ELSE P.Name 
END AS ProjectName
FROM Employees AS E JOIN EmployeesProjects AS EP ON E.EmployeeID=EP.EmployeeID JOIN Projects AS P ON EP.ProjectID = P.ProjectID
WHERE E.EmployeeID =24 

