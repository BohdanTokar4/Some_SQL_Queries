USE [DoctorWho]
GO

--  List the names of the companions who haven't featured in any episodes
SELECT 
	c.CompanionName,
	EpisodeId
FROM tblCompanion c
FULL OUTER JOIN tblEpisodeCompanion ec
	ON c.CompanionId = ec.CompanionId
WHERE ec.EpisodeId IS NULL;
