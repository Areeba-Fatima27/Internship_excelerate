----Finds the total number of unique users.-----
SELECT COUNT(DISTINCT user_id) AS unique_users
FROM master_table;
---total users----
SELECT COUNT(user_id) AS users
FROM master_table;
-----Analyzes the distribution of users across different education levels.------
SELECT distinct COUNT(user_id) AS user_count,degree
FROM master_table
GROUP BY degree
ORDER BY user_count DESC;
------Finds the top 10 most common majors among users------
SELECT DISTINCT COUNT(user_id) AS total_users, major
FROM master_table
GROUP BY major
ORDER BY total_users DESC
LIMIT 10;
-------Identifies which countries have the most users.------
SELECT Distinct COUNT(user_id) AS user_count, country
FROM master_table
GROUP BY country
ORDER BY user_count DESC;
----------Detects users who applied for more than one opportunity.---------
SELECT user_id, COUNT(opportunity_id) AS applications
FROM master_table
GROUP BY user_id
HAVING COUNT(opportunity_id) > 1
ORDER BY applications DESC;
----Identifies the top 10 most applied opportunities.-------
SELECT Distinct COUNT(user_id) AS applicants, opportunity_name 
FROM master_table
GROUP BY opportunity_name
ORDER BY applicants DESC
LIMIT 10;
----Finds the user who applied most recently.--------
SELECT user_id, email, apply_date
FROM master_table
ORDER BY apply_date DESC;
-------Tracks apply_date trends over time.--------
SELECT EXTRACT(YEAR FROM apply_date) AS year, COUNT(user_id) AS applications
FROM master_table
GROUP BY year
ORDER BY year DESC;
-------Finds users who applied but were not placed in a cohort-------
SELECT COUNT(user_id) AS unassigned_users
FROM master_table
WHERE assigned_cohort IS NULL;
--Identifies the top 10 largest cohorts.-------
SELECT assigned_cohort, COUNT(user_id) AS cohort_size
FROM master_table
GROUP BY assigned_cohort
ORDER BY cohort_size DESC
LIMIT 10;
---Identifies the 10 most recently modified user records.------
SELECT user_id, email, userlastmodifieddate
FROM master_table
ORDER BY userlastmodifieddate DESC
LIMIT 10;
----Analyzes the distribution of users by gender.---------
SELECT COUNT(user_id) AS user_count,gender
FROM master_table
WHERE gender IS NOT NULL
GROUP BY gender
ORDER BY user_count DESC;
--inds users who have enrolled in multiple opportunities---
SELECT user_id, COUNT(DISTINCT enrollment_id) AS enrollment_count
FROM master_table
GROUP BY user_id
HAVING COUNT(DISTINCT enrollment_id) > 1
ORDER BY enrollment_count DESC;
----Identifies the top 10 institutions with the most users.----
SELECT institution, COUNT(user_id) AS total_users
FROM master_table
WHERE institution IS NOT NULL
GROUP BY institution
ORDER BY total_users DESC
limit 10;
---Finds users who have been in the system the longest.-----
----Users with the Longest Time Between Account Creation and Last Update--
SELECT user_id, 
       usercreatedate, 
       userlastmodifieddate, 
       (userlastmodifieddate::DATE - usercreatedate::DATE) AS days_active
FROM master_table
ORDER BY days_active DESC
----Identifies users who applied but never started their opportunity.-----
SELECT COUNT(user_id) AS unstarted_users
FROM master_table
WHERE apply_date IS NOT NULL 
AND start_date IS NULL;
--Find Most Common User Statuses----
SELECT status, COUNT(user_id) AS user_count
FROM master_table
WHERE status IS NOT NULL
GROUP BY status
ORDER BY user_count DESC;
---Find Users Who Applied in the Last 30 Days---
SELECT user_id, email, apply_date
FROM master_table
WHERE apply_date >= NOW() - INTERVAL '30 days'
ORDER BY apply_date DESC;
----Lists users who applied within the last month.----
SELECT user_id, email, apply_date
FROM master_table
WHERE apply_date >= NOW() - INTERVAL '30 days'
ORDER BY apply_date DESC;
---Counts the number of users who completed an opportunity.---
SELECT COUNT(user_id) AS completed_users
FROM master_table
WHERE end_date IS NOT NULL;
