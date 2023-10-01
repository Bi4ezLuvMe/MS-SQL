SELECT CountryCode,COUNT(MC.CountryCode)AS MountainRanges
FROM MountainsCountries AS MC JOIN Mountains AS M ON MC.MountainId = M.Id
WHERE MC.CountryCode IN ('US', 'BG','RU')
GROUP BY MC.CountryCode