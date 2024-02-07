USE WorldEvents
GO

-- Write a query which lists out countries which have more than 8 events, using a correlated subquery rather than HAVING.
SELECT DISTINCT
	CountryName
FROM
	tblCountry c
JOIN tblEvent e
	ON c.CountryID = e.CountryID
WHERE
	(
		SELECT COUNT (EventID)
		FROM tblEvent e
		WHERE e.CountryID = c.CountryID
	) > 8
ORDER BY CountryName ASC;