USE WorldEvents
GO

-- The aim of this exercise is to list out all the continents which have: At least 3 countries; but also At most 10 events.
WITH ManyCountries AS
	(
	SELECT 
		ct.ContinentID,
		ContinentName
	FROM tblContinent ct
	JOIN tblCountry cr
		ON cr.ContinentID = ct.ContinentID
	GROUP BY 
		ct.ContinentID,
		ContinentName
	HAVING COUNT(cr.ContinentID) > 3
	),

FewEvents AS
	(
	SELECT 
		ct.ContinentID,
		ContinentName
	FROM tblContinent ct
	JOIN tblCountry cr
		ON cr.ContinentID = ct.ContinentID
	JOIN tblEvent e
		ON e.CountryID = cr.CountryID
	GROUP BY 
		ct.ContinentID,
		ContinentName
	HAVING COUNT (EventID) <= 10
	)

SELECT mc.ContinentName
FROM ManyCountries mc
JOIN FewEvents fe
	ON fe.ContinentID = mc.ContinentID;
