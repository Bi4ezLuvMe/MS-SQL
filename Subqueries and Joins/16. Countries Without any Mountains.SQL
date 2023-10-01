SELECT COUNT(C.CountryCode)
FROM Countries AS C LEFT JOIN MountainsCountries AS MC ON C.CountryCode = MC.CountryCode
WHERE MC.MountainId IS NULL

