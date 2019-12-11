DECLARE @i INT = 1															-- Iteration variable; will increment this below 
DECLARE @max INT = 
	(SELECT MAX(<column>) FROM <table> WHERE <condition>)	-- Declare a variable up until which to iterate, i.e., a count of rows

WHILE @i <= @max	
BEGIN 
	<code>				-- insert code to be iterated here 
	SET @i = @i + 1		-- increment iteration variable 
END 