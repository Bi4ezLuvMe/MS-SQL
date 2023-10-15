--------------1----------------
CREATE TABLE Countries(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL
)
CREATE TABLE Destinations(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)
CREATE TABLE Rooms(
Id INT PRIMARY KEY IDENTITY,
Type NVARCHAR(40) NOT NULL,
Price DECIMAL(18,2) NOT NULL,
BedCount INT NOT NULL
)
CREATE TABLE Hotels(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
DestinationId INT FOREIGN KEY REFERENCES Destinations(Id)
)
CREATE TABLE Tourists(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(80) NOT NULL,
PhoneNumber NVARCHAR(20) NOT NULL,
Email NVARCHAR(80),
CountryId INT FOREIGN KEY REFERENCES Countries(Id)
)
CREATE TABLE Bookings(
Id INT PRIMARY KEY IDENTITY,
ArrivalDate DATETIME2 NOT NULL,
DepartureDate DATETIME2 NOT NULL,
AdultsCount INT NOT NULL,
ChildrenCount INT NOT NULL,
TouristId INT FOREIGN KEY REFERENCES Tourists(Id),
HotelId INT FOREIGN KEY REFERENCES Hotels(Id),
RoomId INT FOREIGN KEY REFERENCES Rooms(Id)
)
CREATE TABLE HotelsRooms(
HotelId INT FOREIGN KEY REFERENCES Hotels(Id),
RoomId INT FOREIGN KEY REFERENCES Rooms(Id),
PRIMARY KEY(HotelId,RoomId)
)
-------------------2------------------
INSERT INTO Tourists(Name,PhoneNumber,Email,CountryId) VALUES
('John Rivers','653-551-1555','john.rivers@example.com',6)
,('Adeline Aglaé','122-654-8726','adeline.aglae@example.com',2)
,('Sergio Ramirez','233-465-2876','s.ramirez@example.com',3)
,('Johan Müller','322-876-9826','j.muller@example.com',7)
,('Eden Smith','551-874-2234','eden.smith@example.com',6)

INSERT INTO Bookings(ArrivalDate,DepartureDate,AdultsCount,ChildrenCount,TouristId,HotelId,RoomId) VALUES
('2024-03-01','2024-03-11',1,0,21,3,5)
,('2023-12-28','2024-01-06',2,1,22,13,3)
,('2023-11-15','2023-11-20',1,2,23,19,7)
,('2023-12-05','2023-12-09',4,0,24,6,4)
,('2024-05-01','2024-05-07',6,0,25,14,6)
----------------------3---------------------
UPDATE Bookings
SET DepartureDate = DATEADD(DAY,1,DepartureDate)
WHERE ArrivalDate LIKE '2023-12-%'

UPDATE Tourists
SET Email = NULL
WHERE Name LIKE '%MA%'
-------------------4-----------------------
DELETE FROM Bookings WHERE TouristId IN (6,16,25)
DELETE FROM Tourists WHERE Name LIKE '%Smith'
------------------------5----------------------
SELECT FORMAT(ArrivalDate,'yyyy-MM-dd') AS ArrivalDate,AdultsCount,ChildrenCount
FROM Bookings AS B JOIN Rooms AS R ON B.RoomId = R.Id
ORDER BY Price DESC,ArrivalDate
----------------------------6-------------------------
SELECT H.Id,H.Name
FROM Hotels AS H JOIN HotelsRooms AS HR ON H.Id = HR.HotelId JOIN Bookings AS B ON B.HotelId = H.Id
WHERE HR.RoomId = 8
GROUP BY H.Id,H.Name
ORDER BY COUNT(B.Id) DESC
--------------------7------------------
SELECT T.Id,T.Name,T.PhoneNumber
FROM Tourists AS T LEFT JOIN Bookings AS B ON T.Id = B.TouristId
WHERE B.TouristId IS NULL
ORDER BY T.Name
--------------------8-------------------
SELECT TOP 10 H.Name AS HotelName, D.Name AS DestinationName, C.Name AS CountryName
FROM Bookings AS B JOIN Hotels AS H ON B.HotelId = H.Id JOIN Destinations AS D ON H.DestinationId = D.Id JOIN Countries AS C ON C.Id = D.CountryId
WHERE B.ArrivalDate < '2023-12-31' AND H.Id % 2<>0
ORDER BY CountryName,ArrivalDate
----------------------9----------------
SELECT H.Name AS HotelName,R.Price AS RoomPrice
FROM Tourists AS T JOIN Bookings AS B ON B.TouristId = T.Id JOIN Hotels AS H ON B.HotelId = H.Id JOIN Rooms AS R ON R.Id = B.RoomId
WHERE T.Name NOT LIKE '%EZ'
ORDER BY RoomPrice DESC
-------------------10----------------------
SELECT H.Name AS HotelName, SUM((DATEDIFF(DAY,B.ArrivalDate,B.DepartureDate)*R.Price)) AS TotalRevenue
FROM Bookings AS B JOIN Hotels AS H ON B.HotelId = H.Id JOIN Rooms AS R ON B.RoomId =R.Id
GROUP BY H.Name
ORDER BY TotalRevenue DESC
-----------------------------11--------------------
GO
CREATE FUNCTION udf_RoomsWithTourists(@name NVARCHAR(30)) 
RETURNS INT AS
BEGIN
DECLARE @count INT =
(
SELECT SUM(B.AdultsCount+B.ChildrenCount) 
FROM Tourists AS T JOIN Bookings AS B ON B.TouristId = T.Id JOIN Rooms AS R ON R.Id =B.RoomId
WHERE R.Type = @name
GROUP BY R.Id
)
RETURN @count
END
GO
SELECT dbo.udf_RoomsWithTourists('Double Room')
---------------------------------12------------------------------
CREATE PROCEDURE usp_SearchByCountry(@country NVARCHAR(30))
AS
BEGIN
SELECT T.Name,T.PhoneNumber,T.Email, COUNT(B.Id) AS CountOfBookings
FROM Tourists AS T JOIN Countries AS C ON T.CountryId =C.Id JOIN Bookings AS B ON B.TouristId =T.Id
WHERE C.Name = @country
GROUP BY T.Name,T.PhoneNumber,T.Email
ORDER BY Name,CountOfBookings DESC
END

EXEC usp_SearchByCountry 'Greece'


