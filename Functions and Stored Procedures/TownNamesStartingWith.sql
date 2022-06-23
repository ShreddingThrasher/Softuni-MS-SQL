
CREATE OR ALTER PROC usp_GetTownsStartingWith(@start VARCHAR(30))
AS
BEGIN
	
	SELECT
		t.[Name]
	FROM Towns AS t
	WHERE t.[Name] LIKE @start + '%'

END

GO

EXEC usp_GetTownsStartingWith 'b';