CREATE DATABASE hr_analytics_project;
USE hr_analytics_project;
SELECT * FROM hr_data 
LIMIT 5;
SELECT COUNT(*) AS total_records 
FROM hr_data;
SELECT 
    SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS missing_ids,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS missing_attrition,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS missing_dept,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS missing_income
FROM hr_data;

SELECT 
    COUNT(DISTINCT EmployeeCount) AS unique_emp_count,
    COUNT(DISTINCT Over18) AS unique_over18,
    COUNT(DISTINCT StandardHours) AS unique_std_hours
FROM hr_data;

SELECT 
    Attrition, 
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_data), 2) AS percentage
FROM hr_data
GROUP BY Attrition;

SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate DESC;

SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate,
    RANK() OVER (ORDER BY SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) DESC) AS risk_rank
FROM hr_data
GROUP BY JobRole;

DESCRIBE hr_data;
ALTER TABLE hr_data 
RENAME COLUMN `ï»¿Age` TO Age;

WITH Age_Buckets AS (
    SELECT 
        Attrition,
        CASE 
            WHEN Age BETWEEN 18 AND 25 THEN '18-25 (Entry Level)'
            WHEN Age BETWEEN 26 AND 35 THEN '26-35 (Mid Level)'
            WHEN Age BETWEEN 36 AND 50 THEN '36-50 (Senior)'
            ELSE '51+ (Executive/Late Career)'
        END AS age_group
    FROM hr_data
)
SELECT 
    age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM Age_Buckets
GROUP BY age_group
ORDER BY age_group;

SELECT 
    JobRole,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome END), 2) AS avg_income_left,
    ROUND(AVG(CASE WHEN Attrition = 'No' THEN MonthlyIncome END), 2) AS avg_income_stayed,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY JobRole
ORDER BY JobRole;

SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY OverTime;

SELECT 
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

WITH Commute_Buckets AS (
    SELECT 
        Attrition,
        CASE 
            WHEN DistanceFromHome <= 5 THEN 'Short (1-5 miles)'
            WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Medium (6-15 miles)'
            ELSE 'Long (16+ miles)'
        END AS commute_distance
    FROM hr_data
)
SELECT 
    commute_distance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM Commute_Buckets
GROUP BY commute_distance
ORDER BY attrition_rate DESC;

SELECT 
    YearsSinceLastPromotion,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY YearsSinceLastPromotion
HAVING COUNT(*) > 10  -- This filters out groups that are too small to matter
ORDER BY YearsSinceLastPromotion;

SELECT 
    YearsWithCurrManager,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS churned_employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY YearsWithCurrManager
HAVING COUNT(*) > 10
ORDER BY YearsWithCurrManager;

SELECT * FROM hr_data;