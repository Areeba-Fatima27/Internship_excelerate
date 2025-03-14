CREATE TABLE Cognitodata (
    user_id VARCHAR(150),
    email VARCHAR(150),
    gender VARCHAR(150),
    UserCreateDate TIMESTAMP,  
    UserLastModifiedDate TIMESTAMP,  
    birthdate DATE,
    city VARCHAR(150),
    zip VARCHAR(50),
    state VARCHAR(50)
);

COPY public.cognitodata (user_id, email, gender, UserCreateDate, UserLastModifiedDate, birthdate,city,zip,state)
FROM 'C:\One Drive\OneDrive - Higher Education Commission\Apps\Cognito_Raw2 -ar.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL 'NULL');

select *
from cognitodata

select distinct count(user_id) as no_ofuser_id
from cognitodata

SELECT user_id, COUNT (*) as Count
FROM cognitodata
group by user_id
Having COUNT (user_id) > 1


select email
from cognitodata

select distinct gender, count(gender)
from cognitodata
group by gender

select distinct city, count(city) as total_cities
from cognitodata
group by city
Order by total_cities desc

select distinct zip, count(zip) as total_zip
from cognitodata
group by zip
Order by total_zip desc

select distinct state, count(state) as total_state
from cognitodata
group by state
Order by total_state desc

SELECT 
 MIN(UserCreatedate) AS start_date,
 MAX(UserCreatedate) AS end_date
FROM cognitodata




    UserLastModifiedDate TIMESTAMP,