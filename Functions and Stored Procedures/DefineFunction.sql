
CREATE FUNCTION ufn_IsWordComprised(@letters NVARCHAR(30), @word NVARCHAR(30)) 
RETURNS BIT
AS 
BEGIN

	DECLARE @CountOfLetters INT = LEN(@word);
	DECLARE @Index INT = 1;

	WHILE @Index <= @CountOfLetters
		BEGIN 
		IF(CHARINDEX(SUBSTRING(@word, @Index, 1), @letters) = 0)
		    BEGIN
			RETURN 0
			END
			SET @Index += 1
		END 
		RETURN 1
END