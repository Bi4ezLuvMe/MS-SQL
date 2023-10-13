SELECT P.Id,P.Name,Price,C.Name AS CategoryName
FROM Products AS P JOIN Categories AS C ON P.CategoryId = C.Id
WHERE C.Name IN ('ADR','Others')
ORDER BY P.Price DESC