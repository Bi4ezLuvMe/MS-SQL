CREATE PROCEDURE usp_SearchByCountry(@country NVARCHAR(30))
AS
BEGIN
SELECT V.Name AS Vendor,V.NumberVAT AS VAT, CONCAT_WS(' ',A.StreetName,A.StreetNumber) AS [Street Info], CONCAT_WS(' ',A.City ,A.PostCode) AS [City Info]
FROM Vendors AS V JOIN Addresses AS A ON V.AddressId = A.Id JOIN Countries AS C ON A.CountryId = C.Id
WHERE C.Name = @country
ORDER BY V.Name,A.City
END


