 CREATE TABLE cohort_data (
  cohort_id VARCHAR(50),
  cohort_code VARCHAR(50),
  size INT, 
  start_date TIMESTAMP, 
  end_date TIMESTAMP );

COPY public."cohort_data" (cohort_id, cohort_code,size, start_date, end_date )
FROM 'C:\One Drive\OneDrive - Higher Education Commission\Apps\internship_dataset\Cohort_data_SQL.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL 'NULL');

select*
from cohort_data
