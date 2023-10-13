SELECT C.Id,C.Name AS Client, CONCAT(A.StreetName, ' ',A.StreetNumber, ', ', A.City, ', ', A.PostCode, ', ', CO.Name  ) AS [Address]
FROM ProductsClients AS PC RIGHT JOIN Clients AS C ON PC.ClientId = C.Id JOIN Addresses AS A ON C.AddressId = A.Id JOIN Countries AS CO ON A.CountryId = CO.Id
WHERE PC.ClientId IS NULL
ORDER BY C.Name 