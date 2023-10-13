SELECT C.Name AS Client,MAX(P.Price) AS Price, C.NumberVAT AS 'VAT Number'
FROM Clients AS C JOIN ProductsClients AS PC ON C.Id = PC.ClientId JOIN Products AS P ON PC.ProductId = P.Id
WHERE C.Name NOT LIKE '%KG'
GROUP BY C.Name,C.NumberVAT
ORDER BY Price DESC