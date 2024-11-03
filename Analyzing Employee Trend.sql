Use employee;

--- To read Data ---
SELECT * FROM analyzing_employee_trend;

--- 1. Count the number of employees in each department---
SELECT department, COUNT(*) AS employee_count
FROM analyzing_employee_trend
GROUP BY department;

--- 2. Count the number of employees (with gender) in each department---
SELECT department,
    COUNT(CASE WHEN gender = 'male' THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'female' THEN 1 END) AS female_count
FROM analyzing_employee_trend
GROUP BY department;

--- 3.Calculate the average age for each department ---
SELECT department, AVG(age) AS average_age
FROM analyzing_employee_trend
GROUP BY department;

---- 4. Identify the most common job roles in each department ---
SELECT department, job_role, COUNT(*) AS role_count
FROM analyzing_employee_trend
GROUP BY department, job_role
ORDER BY role_count DESC;

--- 5. Calculate the average job satisfaction for each education level ---
SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM analyzing_employee_trend
GROUP BY education
order by average_satisfaction desc;

--- 6.Determine the average age for employees with different levels of job satisfaction ---
SELECT job_satisfaction, AVG(age) AS average_age
FROM analyzing_employee_trend
GROUP BY job_satisfaction;

--- 7. Calculate the attrition rate for each age band --
SELECT age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM analyzing_employee_trend
GROUP BY age_band
order by attrition_rate desc;


--- 8.Find the education level with the highest average job satisfaction among employees who travel frequently ---
SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM analyzing_employee_trend
WHERE business_travel = 'Travel_Frequently'
GROUP BY education
ORDER BY average_satisfaction DESC
LIMIT 3;

--- 9. Identify the age band with the highest average job satisfaction among married employees ----
SELECT age_band, AVG(job_satisfaction) AS average_satisfaction
FROM analyzing_employee_trend
WHERE marital_status = 'Married'
GROUP BY age_band
ORDER BY average_satisfaction DESC
LIMIT 1;