SELECT MC.CountryCode,M.MountainRange,P.PeakName,P.Elevation
FROM MountainsCountries AS MC JOIN Mountains AS M ON MC.MountainId=M.Id JOIN Peaks AS P ON M.Id = P.MountainId
WHERE MC.CountryCode = 'BG' AND P.Elevation>2835
ORDER BY P.Elevation DESC