CREATE PROC usp_SearchByCategory(@category NVARCHAR(30))
AS 
BEGIN
SELECT BG.Name,BG.YearPublished,BG.Rating,C.Name AS CategoryName,P.Name AS PublisherName,CONCAT(PR.PlayersMin,' ', 'people') AS MinPlayers,CONCAT(PR.PlayersMax,' ', 'people')  AS MaxPlayers
FROM Boardgames AS BG JOIN Categories AS C ON BG.CategoryId =C.Id JOIN Publishers AS P ON BG.PublisherId = P.Id JOIN PlayersRanges AS PR ON BG.PlayersRangeId = PR.Id
WHERE C.Name = @category
ORDER BY P.Name,BG.YearPublished DESC
END