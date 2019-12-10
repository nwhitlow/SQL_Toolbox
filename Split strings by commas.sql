CREATE TABLE #names 
    (
        NAME VARCHAR(20)
    )

DECLARE @str VARCHAR(50)
SET @str = (SELECT <column> FROM <table> WHERE <condition>) --Insert cell or string value here 

INSERT INTO #names
SELECT names = y.i.value('(./text())[1]', 'nvarchar(1000)')             
FROM 
( 
SELECT 
    n = CONVERT(XML, '<i>' 
        + REPLACE(@str, ',' , '</i><i>') 
        + '</i>')
) AS a 
CROSS APPLY n.nodes('i') AS y(i)

SELECT * FROM #names 
DROP TABLE #names 