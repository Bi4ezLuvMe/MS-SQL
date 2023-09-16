CREATE TABLE Directors(
[Id] INT PRIMARY KEY IDENTITY,
[DirectorName] NVARCHAR(255) NOT NULL,
[Notes] NVARCHAR(255)
)
INSERT INTO Directors(DirectorName)VALUES
('GOSHO'),
('GOSHO'),
('GOSHO'),
('GOSHO'),
('GOSHO')

CREATE TABLE Genres(
[Id] INT PRIMARY KEY IDENTITY,
[GenreName] NVARCHAR(255) NOT NULL,
[Notes] NVARCHAR(255)
)
INSERT INTO Genres(GenreName)VALUES
('Horror'),
('Horror'),
('Horror'),
('Horror'),
('Horror')

CREATE TABLE Categories(
[Id] INT PRIMARY KEY IDENTITY,
[CategoryName] NVARCHAR(255) NOT NULL,
[Notes] NVARCHAR(255)
)
INSERT INTO Categories(CategoryName)VALUES
('KUR'),
('KUR'),
('KUR'),
('KUR'),
('KUR')

CREATE TABLE Movies(
[Id] INT PRIMARY KEY IDENTITY,
[Title] NVARCHAR(255) NOT NULL,
[DirectorId] INT FOREIGN KEY REFERENCES [Directors]([Id]),
[CopyrightYear] INT,
[Length] REAL,
[GenreId] INT FOREIGN KEY REFERENCES [Genres]([Id]),
[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]),
[Rating] INT,
[Notes]NVARCHAR(255),
)
INSERT INTO Movies(Title,DirectorId,GenreId,CategoryId)VALUES
('KURE',1,1,1),
('KURE',1,1,1),
('KURE',1,1,1),
('KURE',1,1,1),
('KURE',1,1,1)