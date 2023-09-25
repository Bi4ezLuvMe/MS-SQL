SELECT [Name] AS [Game],
'Part of the day' = 
CASE 
WHEN DATEPART(HOUR,[Start]) BETWEEN 0 AND 11 THEN 'Morning'   
WHEN DATEPART(HOUR,Start) BETWEEN 12 AND 17 THEN 'Afternoon'   
WHEN DATEPART(HOUR,START) BETWEEN 18 AND 24 THEN 'Evening'   
END,
Duration =
	CASE 
		WHEN Duration <= 3 THEN 'Extra Short'
		WHEN Duration > 3 AND Duration <= 6 THEN 'Short'
		WHEN Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
	END
FROM GAMES
ORDER BY Name, Duration, [Part of the day]