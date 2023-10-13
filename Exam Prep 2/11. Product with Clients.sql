CREATE FUNCTION udf_ProductWithClients(@name NVARCHAR(30))
RETURNS INT AS
BEGIN
DECLARE @count INT = 
(
SELECT COUNT(PC.ClientId) 
FROM ProductsClients AS PC JOIN Products AS P ON PC.ProductId = P.Id
WHERE P.Name = @name
)
RETURN @count
END