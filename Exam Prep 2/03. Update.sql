UPDATE Invoices
SET DueDate = '2023-04-01'
WHERE IssueDate LIKE '2022-11%'

UPDATE Clients 
SET AddressId = 3
WHERE Name LIKE '%CO%'