CREATE TABLE Categories(
[Id] INT PRIMARY KEY IDENTITY,
[CategoryName] NVARCHAR(MAX) NOT NULL,
[DailyRate] MONEY NOT NULL,
[WeeklyRate] MONEY NOT NULL,
[MonthlyRate] MONEY NOT NULL,
[WeekendRate] MONEY NOT NULL
)
INSERT INTO [Categories](CategoryName,DailyRate,WeeklyRate,MonthlyRate,WeekendRate)VALUES
('KURE',1,1,1,1),
('KURE',1,1,1,1),
('KURE',1,1,1,1)

CREATE TABLE Cars(
[Id] INT PRIMARY KEY IDENTITY,
[PlateNumber] NVARCHAR(MAX) NOT NULL,
[Manifacturer] NVARCHAR(MAX)NOT NULL,
[Model] NVARCHAR(MAX)NOT NULL,
[CarYear] INT NOT NULL,
[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]),
[Doors] INT NOT NULL,
[Picture] IMAGE,
[Condition] NVARCHAR(MAX),
[Available] NVARCHAR(MAX)
)
INSERT INTO [Cars](PlateNumber,Manifacturer,Model,CarYear,CategoryId,Doors)VALUES
('AV 5555 VD', 'VW', 'GOLF 4', 2000,1,4),
('AV 5555 VD', 'VW', 'GOLF 4', 2000,1,4),
('AV 5555 VD', 'VW', 'GOLF 4', 2000,1,4)

CREATE TABLE Employees(
[Id] INT PRIMARY KEY IDENTITY,
[FirstName] NVARCHAR(MAX) NOT NULL,
[LastName] NVARCHAR(MAX) NOT NULL,
[Title] NVARCHAR(MAX) NOT NULL,
[Notes] NVARCHAR(MAX)
)
INSERT INTO Employees(FirstName,LastName,Title)VALUES
('LYUBOSLAV','VEZENKOV','JUNIOR DEV'),
('LYUBOSLAV','VEZENKOV','JUNIOR DEV'),
('LYUBOSLAV','VEZENKOV','JUNIOR DEV')

CREATE TABLE Customers(
[Id] INT PRIMARY KEY IDENTITY,
[DriverLicenceNumber] NVARCHAR(MAX) NOT NULL,
[FullName] NVARCHAR(MAX) NOT NULL,
[Address] NVARCHAR(MAX) NOT NULL,
[City]NVARCHAR(MAX) NOT NULL,
[ZIPCode]INT NOT NULL,
[Notes]NVARCHAR(MAX)
)
INSERT INTO Customers(DriverLicenceNumber,FullName,Address,City,ZIPCode)VALUES
('AV 5555 GB', 'PESHO PESHOV', 'KV ZAPAD','KN',2600),
('AV 5555 GB', 'PESHO PESHOV', 'KV ZAPAD','KN',2600),
('AV 5555 GB', 'PESHO PESHOV', 'KV ZAPAD','KN',2600)

CREATE TABLE RentalOrders(
[Id] INT PRIMARY KEY IDENTITY,
[EmployeeId] INT FOREIGN KEY REFERENCES Employees([Id]),
[CustomerId] INT FOREIGN KEY REFERENCES Customers([Id]),
[CarId] INT FOREIGN KEY REFERENCES Cars([Id]),
[TankLevel] INT,
[KilometrageStart]INT,
[KilometrageEnd]INT,
[TotalKilometrage]INT,
[StartDate]DATE NOT NULL,
[EndDate]DATE NOT NULL,
[TotalDays]INT NOT NULL,
[RateApplied]MONEY ,
[TaxRate] MONEY,
[OrderStatus] NVARCHAR(MAX),
[Notes]NVARCHAR(MAX)
)
INSERT INTO RentalOrders(EmployeeId,CustomerId,CarId,StartDate,EndDate,TotalDays)VALUES
(1,1,1,'2000-05-25','2000-05-25',300),
(1,1,1,'2000-05-25','2000-05-25',300),
(1,1,1,'2000-05-25','2000-05-25',300)