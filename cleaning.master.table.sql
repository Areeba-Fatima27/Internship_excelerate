--/creating master table/--
CREATE TABLE master_table (
    user_id varchar(200),
    learner_id varchar(200),
    enrollment_id varchar(200),
    learneropp_id varchar(200),
    email varchar(200),
    gender varchar(200),
    birthdate DATE,
    degree varchar(200),
    major varchar(200),
    institution varchar(200),
    city varchar(200),
    zip varchar(200),
    state varchar(200),
    country varchar(200),
    opportunity_id varchar(200),
    opportunity_name varchar(200),
    category varchar(200),
    opportunity_code varchar(200),
    cohort_id varchar(200),
    cohort_code varchar(200),
    assigned_cohort varchar(200),
    size INT,
    apply_date TIMESTAMP,
    status INTEGER,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    usercreatedate TIMESTAMP,
    userlastmodifieddate TIMESTAMP)

SELECT * FROM MASTER_TABLE
---changing data type as it shows error when import/--
ALTER TABLE master_table ALTER COLUMN size TYPE TEXT;
ALTER TABLE master_table ALTER COLUMN start_date TYPE TEXT;
ALTER TABLE master_table ALTER COLUMN end_date TYPE TEXT;
ALTER TABLE master_table ALTER COLUMN apply_date TYPE TEXT;
ALTER TABLE master_table ALTER COLUMN status TYPE TEXT;
---importing data------
COPY master_table
FROM 'C:\One Drive\OneDrive - Higher Education Commission\Apps\internship_dataset\MASTER TABLE.csv' 
WITH CSV HEADER DELIMITER ',' NULL 'NULL';
-----updating empty column with null----- 
UPDATE master_table
SET cohort_id = NULL
WHERE cohort_id = '';

UPDATE master_table
SET degree = NULL
WHERE degree = '';

UPDATE master_table
SET cohort_code = NULL
WHERE cohort_code = '';

UPDATE master_table
SET assigned_cohort = NULL
WHERE assigned_cohort = '';

UPDATE master_table
SET size = NULL
WHERE size = '';

UPDATE master_table
SET status = NULL
WHERE status= '';

UPDATE master_table
SET apply_date = NULL
WHERE apply_date = '';

UPDATE master_table
SET end_date = NULL
WHERE end_date = '';

UPDATE master_table
SET start_date = NULL
WHERE start_date = '';

UPDATE master_table
SET opportunity_id = NULL
WHERE opportunity_id= '';

UPDATE master_table
SET opportunity_name = NULL
WHERE opportunity_name= '';

UPDATE master_table
SET opportunity_code = NULL
WHERE opportunity_code= '';

UPDATE master_table
SET category = NULL
WHERE category= '';
----again changing data type back to original---
ALTER TABLE master_table 
ALTER COLUMN start_date TYPE TIMESTAMP USING start_date::TIMESTAMP;

ALTER TABLE master_table 
ALTER COLUMN end_date TYPE TIMESTAMP USING end_date::TIMESTAMP;

ALTER TABLE master_table 
ALTER COLUMN apply_date TYPE TIMESTAMP USING apply_date::TIMESTAMP;

ALTER TABLE master_table 
ALTER COLUMN size TYPE INT USING size::integer ;
----updating null column------
SELECT distinct gender FROM MASTER_TABLE
UPDATE master_table
SET gender = 'Unknown'
WHERE gender IS NULL;

SELECT distinct degree FROM MASTER_TABLE
UPDATE master_table
SET degree = 'Not Specified'
WHERE degree IS NULL;

SELECT distinct major FROM MASTER_TABLE
UPDATE master_table
SET major = 'Not Specified'
WHERE major IS NULL;

SELECT distinct opportunity_name FROM MASTER_TABLE
UPDATE master_table
SET opportunity_name = 'Not Specified'
WHERE opportunity_name IS NULL;
----using trim to remove spaces---
UPDATE master_table
SET degree = TRIM(degree);

SELECT distinct size FROM MASTER_TABLE
UPDATE master_table
SET size = 0
WHERE size IS NULL OR size < 0;

SELECT distinct count(*) as countw,state FROM master_table group by state order by state desc 
UPDATE master_table
SET state = 'Not Available'
WHERE state IS NULL;

SELECT distinct count(*) as countw,city FROM master_table group by city order by countw desc 
UPDATE master_table
SET city = 'Not Available'
WHERE city IS NULL;

SELECT distinct count(*) as countw,country FROM master_table group by country order by countw desc 
UPDATE master_table
SET country = 'Not Available'
WHERE country IS NULL;
---changing institution in proper case letter____
SELECT institution, COUNT(user_id) AS total_users
FROM master_table
GROUP BY institution
ORDER BY total_users DESC;

UPDATE master_table
SET institution = INITCAP(institution)
WHERE institution IS NOT NULL;
----changing null, none, n/a,na into not specified/---
UPDATE master_table
SET institution = 'Not Specified'
WHERE institution IS NULL 
   OR TRIM(INITCAP(institution)) IN ('None', 'N/A', 'Na', 'Null', '');
-----using trim------
SELECT email FROM master_table 
UPDATE master_table
SET email = LOWER(TRIM(email));
----checking duplicates--------
SELECT user_id, COUNT(*) AS occurrences
FROM master_table
GROUP BY user_id
HAVING COUNT(*) > 1;
----showing total 55391 user_id duplicate--- need to delete rows
SELECT * FROM master_table
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM master_table
    GROUP BY user_id
);
----if need to delete rows--- not done yet
DELETE FROM master_table
SELECT * FROM master_table
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM master_table
    GROUP BY user_id
);