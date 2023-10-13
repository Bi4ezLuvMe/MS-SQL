SELECT CONCAT_WS(' ', C.FirstName,C.LastName) AS FullName, C.Email, MAX(B.Rating) AS Rating
FROM Creators AS C JOIN CreatorsBoardgames AS CB ON C.Id= CB.CreatorID JOIN Boardgames AS B ON CB.BoardgameId = B.Id
WHERE C.Email LIKE '%.com'
GROUP BY C.FirstName,C.LastName,C.Email
ORDER BY FullName