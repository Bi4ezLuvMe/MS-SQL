SELECT LastName, CEILING(AVG(B.Rating)) AS AverageRating,P.Name
FROM Creators AS C JOIN CreatorsBoardgames AS CB ON C.Id= CB.CreatorID JOIN Boardgames AS B ON CB.BoardgameId = B.Id JOIN Publishers AS P ON B.PublisherId = P.Id
WHERE CB.CreatorID IS NOT NULL AND P.Id = 5 
GROUP BY C.LastName,P.Name
ORDER BY AVG(B.Rating) DESC