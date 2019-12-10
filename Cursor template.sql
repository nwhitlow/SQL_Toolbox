-- Declare variables to hold cursor data for each record
DECLARE @Variable1 MONEY
DECLARE @Variable2 BIT 
DECLARE @Variable3 varchar(28)

-- declare table to hold temporary data
DECLARE @myTable as TABLE
(
	Variable1 MONEY,
	Variable2 BIT, 
	Variable3 varchar(28)
)
-- declare cursor
DECLARE myCursor CURSOR FOR 
    SELECT Variable1, Variable2, Variable3 FROM <Table> 
                   WHERE <condition(s)> 

OPEN myCursor

-- fetch records from the cursor
FETCH NEXT FROM myCursor INTO @Variable1, @Variable2, @Variable3

-- insert records from cursor into @myTable
WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO @myTable(Variable1, Variable2, Variable3) VALUES 
                     (@Variable1, @Variable2, @Variable3)
    FETCH NEXT FROM myCursor INTO @Variable1, @Variable2, @Variable3
END

CLOSE myCursor
DEALLOCATE myCursor 

-- Filter the output from the temp table if needed or  select * 
SELECT * FROM @myTable 