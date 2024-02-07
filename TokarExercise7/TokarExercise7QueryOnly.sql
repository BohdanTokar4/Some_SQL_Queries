USE [DoctorWho]
GO


-- Show the number of episodes by year and series number for the first 5 series
WITH ShowYears AS
(
SELECT
	YEAR(EpisodeDate) AS EpisodeYear,
	SeriesNumber,
	EpisodeId
FROM tblEpisode
)

SELECT *
FROM ShowYears
PIVOT
	(
	COUNT(EpisodeId)
	FOR SeriesNumber IN ([1], [2], [3], [4], [5])
	) As YearsPivot