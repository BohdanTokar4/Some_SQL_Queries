USE WorldEvents
GO


-- The aim of this exercise is to show the number of events whose descriptions contain the words this and/or that
WITH [ThisAndThat?] AS 
	(
	SELECT
		EventID,
		MAX(CASE 
				WHEN EventDetails LIKE '%this%' 
				THEN 1 
				ELSE 0 
			END) AS IfThis,
		MAX(CASE 
				WHEN EventDetails LIKE '%that%' 
				THEN 1 
				ELSE 0 
			END) AS IfThat
	FROM tblEvent
	GROUP BY EventID
	)

SELECT
	IfThis,
	IfThat,
	COUNT(EventID) AS [Number of events]
FROM [ThisAndThat?]
GROUP BY IfThis, IfThat;
GO


-- Extending query to show the 3 events whose details contain both this and that
WITH [ThisAndThat?] AS 
	(
	SELECT
		EventID,
		MAX(CASE 
				WHEN EventDetails LIKE '%this%' 
				THEN 1 
				ELSE 0 
			END) AS IfThis,
		MAX(CASE 
				WHEN EventDetails LIKE '%that%' 
				THEN 1 
				ELSE 0 
			END) AS IfThat
	FROM tblEvent
	GROUP BY EventID
	)

SELECT
	EventName,
	EventDetails
FROM tblEvent e
INNER JOIN [ThisAndThat?] tt 
	ON tt.EventID = e.EventID
WHERE IfThis = 1 AND IfThat = 1;
GO