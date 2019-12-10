SELECT REPLACE(TRANSLATE(
	(SELECT <column> FROM <table> WHERE <condition>), -- Insert data/columns to be cleaned here. 
	'abcdefghijklmnopqrstuvwxyz+()- ,#+', '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'), '@', '')
