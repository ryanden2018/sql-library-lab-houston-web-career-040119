/* 
-- using subquery:
UPDATE Characters
SET species = "Martian" 
WHERE Characters.id = (SELECT chb.id FROM Characters chb ORDER BY chb.id DESC LIMIT 1);
*/

/*
-- sqlite3 allows ORDER BY and LIMIT in UPDATE, allowing to avoid a subquery.
-- HOWEVER it seems my installation has this option disabled at compile time,
-- so the following results in a syntax error:
UPDATE Characters
SET species = 'Martian'
ORDER BY id DESC
LIMIT 1;
*/

-- In view of the above I am forced to use a subquery:
UPDATE Characters
SET species = "Martian" 
WHERE Characters.id = (SELECT chb.id FROM Characters chb ORDER BY chb.id DESC LIMIT 1);
