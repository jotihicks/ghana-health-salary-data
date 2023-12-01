SELECT * FROM assign.health_facilities;

#ALTER DEOP COLUMN
ALTER TABLE assign.health_facilities DROP COLUMN Longitude;
ALTER TABLE assign.health_facilities DROP COLUMN Latitude;

SET sql_safe_updates = 0;

#UPDATE FacilitiesName
UPDATE assign.health_facilities 
SET FacilityName = 'RCH CLINIC'
WHERE FacilityName = 'GYRESO RCH';

UPDATE assign.health_facilities 
SET FacilityName = 'Zion Clinic'
WHERE FacilityName = 'A.M.E Zion Clinic';

#Inner Join
SELECT * FROM assign.health_facilities 
INNER JOIN assign.health_tiers ON assign.health_facilities.Region = assign.health_tiers.Region;

#find the district, facility name, and tier that has type = clinic 
SELECT DISTINCT District, FacilityName, Type, Tier
FROM assign.health_facilities, assign.health_tiers
WHERE type = 'clinic';

#Select a distinct town where the district is equal to “offinso north”
SELECT DISTINCT town
FROM assign.health_facilities, assign.health_tiers
WHERE district = 'offinso north';

#Add town, district, type, and tier to the new column
SELECT DISTINCT town, district, type, tier
FROM assign.health_facilities, assign.health_tiers
WHERE district = 'offinso north';

#Create a stored procedure that will search for all educational level(Bachelor's) in the salary_data csv
CREATE PROCEDURE SearchBachelorSalareies()
BEGIN
     -- Select salaries for bachelor's educational level
     SELECT *
     FROM assign.salary_data
     WHERE educational_level = 
"bachelor's"
END //

DELIMITER ;

ALTER TABLE assign.salary_data 
CHANGE COLUMN ï»¿Age Age text;

#1.	Find the average salary for Data analyst 
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Job Title' = 'Data Analyst';

#2. Find the average salary for Junior Data Analyst
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Job Title' = 'Junior Data Analyst';

#3. Find the average salary for Software developer
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Job Title' = 'Software developer';


#4. Find the average salary for Accountant 
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Job Title' = 'Accountant';


#1.	Find the average salary for Master's
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Education Level' = "Master's";

#2.	Find the average salary for Bachelor's
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Education Level' = "Bachelor's";

#3.	Find the average salary for PhD
SELECT AVG(salary) AS average_salary
FROM assign.salary_data
WHERE 'Education Level' = 'PhD';

#1.	Find the sum of salary where gender is male for Marketing
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Marketing') AND 
Gender = 'Male'
GROUP BY 'Job Title';

#2. Find the sum of salary where gender is male for Director
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Director') AND 
Gender = 'Male'
GROUP BY 'Job Title';

#3. Find the sum of salary where gender is male for Data Analyst
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Data Analyst') AND 
Gender = 'Male'
GROUP BY 'Job Title';

#4. Find the sum of salary where gender is male for Product Designer
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Product Designer') AND 
Gender = 'Male'
GROUP BY 'Job Title';

#1.	Find the sum of salary where gender is female for Marketing
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Marketing') AND 
Gender = 'Female'
GROUP BY 'Job Title';

#2. Find the sum of salary where gender is female for Director
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Director') AND 
Gender = 'Female'
GROUP BY 'Job Title';

#3. Find the sum of salary where gender is female for Data Analyst
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Data Analyst') AND 
Gender = 'Female'
GROUP BY 'Job Title';

#4. Find the sum of salary where gender is female for Product Designer
SELECT 'Job Title', SUM(Salary) AS
total_salary
FROM  assign.salary_data
WHERE 'Job Title' IN ('Product Designer') AND 
Gender = 'Female'
GROUP BY 'Job Title';

#Join customer_table and orders_table with primary key customerID
SELECT *
FROM customer_table
JOIN orders_table ON customer_table.CustomerID = 
orders_table.CustomerID;

#Join product and order_product using cookieID
SELECT *
FROM product
JOIN order_product ON product.CookieID = 
order_product.CookieID;