SELECT TOP 5 C.CountryName,MAX(P.Elevation) AS HighestPeakElevation,MAX(R.Length) AS LongestRiverLength
FROM Countries AS C
JOIN MountainsCountries AS MC ON C.CountryCode=MC.CountryCode
JOIN Peaks AS P ON MC.MountainId=P.MountainId
JOIN CountriesRivers AS CR ON C.CountryCode=CR.CountryCode
JOIN Rivers AS R ON CR.RiverId = R.Id
GROUP BY C.CountryName
ORDER BY HighestPeakElevation DESC,LongestRiverLength DESC,CountryName
