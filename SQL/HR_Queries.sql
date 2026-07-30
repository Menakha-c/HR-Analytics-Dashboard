USE hr_analytics;

CREATE TABLE employees (
    Age INT,
    Attrition VARCHAR(10),
    Department VARCHAR(50),
    Gender VARCHAR(10),
    JobRole VARCHAR(100),
    MonthlyIncome INT,
    OverTime VARCHAR(10),
    Education INT,
    JobSatisfaction INT,
    TotalWorkingYears INT,
    YearsAtCompany INT,
    AgeGroup VARCHAR(20),
    ExperienceGroup VARCHAR(20),
    IncomeCategory VARCHAR(20),
    AttritionFlag INT
);

USE hr_analytics;
SHOW TABLES;

USE hr_analytics;
SELECT COUNT(*) AS Total_Employees
FROM HR_Cleaned;

SELECT Attrition, COUNT(*) AS Employee_Count
FROM HR_Cleaned
GROUP BY Attrition;

#1.Department-wise Attrition
SELECT 
    Department,
    COUNT(*) AS Employees_Left
FROM HR_Cleaned
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;

#2. Average Salary by Department
SELECT 
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary
FROM HR_Cleaned
GROUP BY Department
ORDER BY Avg_Salary DESC;

#3. Overtime vs Attrition ⭐ Very Important
SELECT 
    OverTime,
    Attrition,
    COUNT(*) AS Employee_Count
FROM HR_Cleaned
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

#4. Attrition by Age Group
SELECT 
    AgeGroup,
    COUNT(*) AS Employees_Left
FROM HR_Cleaned
WHERE Attrition = 'Yes'
GROUP BY AgeGroup
ORDER BY Employees_Left DESC;

#5. Top 5 Highest Paid Employees
SELECT 
    JobRole,
    Department,
    MonthlyIncome
FROM HR_Cleaned
ORDER BY MonthlyIncome DESC
LIMIT 5;
