SELECT Id, CONCAT_WS(' ', FirstName,LastName) AS CreatorName,Email
FROM Creators AS C LEFT JOIN CreatorsBoardgames AS CB ON C.Id = CB.CreatorID
WHERE CB.CreatorID IS NULL
ORDER BY CreatorName
