CREATE TABLE [Users](
[Id] BIGINT PRIMARY KEY IDENTITY,
[Username]  VARCHAR(30) NOT NULL UNIQUE,
[password] VARCHAR(26) NOT NULL,
[ProfilePicture] IMAGE,
[LastLoginTime] DATETIME,
[IsDeleted] VARCHAR(5),
CHECK([IsDeleted] = 'true' OR [IsDeleted] = 'false')
)
INSERT INTO [Users]([Username],[password]) VALUES
('PESHO','GOSHO'),
('1','GOSHO'),
('2','GOSHO'),
('3','GOSHO'),
('4','GOSHO')