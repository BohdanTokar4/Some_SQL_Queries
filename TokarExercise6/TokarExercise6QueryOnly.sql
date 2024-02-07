USE WorldEvents
GO

-- The aim of this exercise is to count the number of events by a column called Era
WITH EraCTE AS
(
	SELECT
		CASE
			WHEN year(e.EventDate) < 1900 THEN
				'19th century and earlier'
			WHEN year(e.EventDate) < 2000 THEN
				'20th century'
			ELSE '21st century'
		END AS Era,
		e.EventID
	FROM tblEvent e
)

SELECT
	Era,
	COUNT (EventID) AS [Number of events]
FROM EraCTE
GROUP BY Era;
GO