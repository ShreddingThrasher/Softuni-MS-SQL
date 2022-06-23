
CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan(@criteria DECIMAL(18, 4))
AS
BEGIN
	
	SELECT
		ah.FirstName,
		ah.LastName
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	GROUP BY ah.FirstName, ah.LastName
	HAVING SUM(a.Balance) > @criteria
	ORDER BY ah.FirstName ASC,
			 ah.LastName ASC;

END


GO

EXEC usp_GetHoldersWithBalanceHigherThan 7000;