CREATE TABLE [People](
[Id] INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(200) NOT NULL,
[Picture] IMAGE, 
[Height] DECIMAL(3,2),
[Weight] DECIMAL(5,2),
[Gender] CHAR(1) NOT NULL,
CHECK ([Gender] = 'm' OR [Gender] = 'f'),
[Birthdate] DATETIME NOT NULL,
[Biography] NVARCHAR(MAX)
)
INSERT INTO [People]([Name],[Gender],[Birthdate]) VALUES
('PESHO','M','2000-05-25'),
('MESHO','M','2000-05-25'),
('PESHO','M','2000-05-25'),
('PESHO','M','2000-05-25'),
('PESHO','M','2000-05-25')