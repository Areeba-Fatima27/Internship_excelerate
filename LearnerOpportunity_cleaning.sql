CREATE TABLE Learner_opportunity(
    enrollment_id VARCHAR(150),
	learner_id	VARCHAR(150),
	assigned_cohort	VARCHAR(50),
	apply_date	TIMESTAMP with TIME ZONE,
	status	VARCHAR(20))		

ALTER TABLE "learner_opportunity" RENAME TO learner_opportunity

COPY public."learner_opportunity" (enrollment_id, learner_id, assigned_cohort, apply_date, status)
FROM 'C:\One Drive\OneDrive - Higher Education Commission\Apps\LearnerOpportunity_Raw-ar.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL 'NULL');

select*
from learner_opportunity

ALTER TABLE "learner_opportunity"
ALTER COLUMN apply_date TYPE TIMESTAMP

select distinct count(*)
from learner_opportunity

select distinct count(enrollment_id) as no_ofenrollment_id
from learner_opportunity

select distinct count(learner_id) as no_oflearner_id
from learner_opportunity

select distinct count(assigned_cohort) as no_ofassigned_cohort
from learner_opportunity	

select distinct assigned_cohort, count(assigned_cohort) as total_assigned_cohort
from learner_opportunity	
group by assigned_cohort
Order by total_assigned_cohort desc

select distinct count(apply_date) as no_ofapply_date
from learner_opportunity	

select distinct apply_date, count(apply_date) as total_apply_date
from learner_opportunity	
group by apply_date
Order by total_apply_date desc

select distinct count(status) as no_ofstatus
from learner_opportunity	


SELECT 
 MIN(apply_date) AS start_date,
 MAX(apply_date) AS end_date
FROM learner_opportunity
