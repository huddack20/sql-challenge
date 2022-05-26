CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE, 
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

-- Salary
SELECT
	employees.emp_no AS Employee_Number,
	employees.last_name, employees.first_name,
	employees.sex, salaries.salary
FROM
	employees
JOIN
	salaries
ON
	employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no
LIMIT(5)

-- Hire_Date
SELECT 
	employees.first_name, employees.last_name,
	employees.hire_date
FROM
	employees
WHERE
	employees.hire_date > '1986-1-1'::date
	AND employees.hire_date < '1987-1-1'::date
LIMIT(5)

-- Manager_Name
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM
	dept_manager
JOIN
	employees
ON
	dept_manager.emp_no = employees.emp_no
JOIN
	departments
ON
	dept_manager.dept_no = departments.dept_no
LIMIT(5)


-- Employee_Department_Name
SELECT 
	employees.emp_no, employees.last_name,
	employees.first_name, departments.dept_name
FROM
	employees
JOIN
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
LIMIT(5)

-- Employee_Last_Name_LIKE
SELECT
	employees.first_name, employees.last_name, employees.sex
FROM
	employees
WHERE
	first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT(5)


-- Employee_Sales_Department
SELECT 
	employees.emp_no, employees.last_name,
	employees.first_name, departments.dept_name
FROM
	employees
JOIN
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales'
LIMIT(5)


-- Employee_Sales_Department_or_Development
SELECT 
	employees.emp_no, employees.last_name,
	employees.first_name, departments.dept_name
FROM 
	employees
JOIN 
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
JOIN 
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
LIMIT (5);

-- Frequency of last name
SELECT 
	emp.last_name, COUNT (*) AS Frequency 
FROM 
	employees AS emp
GROUP BY 
	emp.last_name
ORDER BY 
	Frequency DESC
LIMIT(5)


select usesysid as user_id,
       usename as username,
       usesuper as is_superuser,
       passwd as password_md5,
       valuntil as password_expiration
from pg_shadow
order by usename;
