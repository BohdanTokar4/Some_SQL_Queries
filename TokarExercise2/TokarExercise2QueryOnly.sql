USE WorldEvents
GO

-- Create a query which lists out all of the events in the tblEvent table which happened after the last one for country 21 (International) took place. 
SELECT
	EventName,
	EventDate,
	CountryName
FROM
	tblEvent
JOIN tblCountry
	ON tblCountry.CountryID = tblEvent.CountryID
WHERE EventDate >
(
	SELECT MAX(EventDate)
	FROM tblEvent
	WHERE CountryID = 21
)
ORDER BY EventDate DESC;