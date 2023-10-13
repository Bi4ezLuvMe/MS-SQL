SELECT B.Id,B.Name,B.YearPublished,C.Name
FROM Boardgames AS B JOIN Categories AS C ON B.CategoryId = C.Id
WHERE C.Id IN (6,8)
ORDER BY YearPublished DESC
