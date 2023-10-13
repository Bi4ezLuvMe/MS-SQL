SELECT TOP 5 B.Name,B.Rating,C.Name
FROM Boardgames AS B JOIN Categories AS C ON B.CategoryId = C.Id
WHERE (B.Rating>7 AND B.Name LIKE '%a%') OR (B.Rating>7.50 AND B.PlayersRangeId = 4)
ORDER BY B.Name,B.Rating DESC
