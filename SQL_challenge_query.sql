-- 1) employee number, last name, first name, sex and salary
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;


-- 2) first name, last name, and hire date for employees who were hired in 1986
SELECT * FROM employees;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-1-1'
AND hire_date <= '1986-12-31';


-- 3) manager of each department with department number, department name, 
-- employee number, last name, and first name
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM employees;

SELECT dm.dept_no, dt.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN departments AS dt
ON dm.dept_no = dt.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;


-- 4) department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT *FROM dept_emp;

SELECT e.emp_no, e.last_name, e.first_name, dt.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS dt
ON de.dept_no = dt.dept_no;


-- 5) first name, last name, and sex of employee whose first name 
-- is Hercules and whose last name begins with the letter B
SELECT * FROM employees;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6) employees in the Sales department with employee number, 
-- last name, first name, and department name
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT e.emp_no, e.last_name, e.first_name, dt.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS dt
ON de.dept_no = dt.dept_no
WHERE dept_name = 'Sales';


-- 7) employees in the Sales and Development departments with 
-- employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT e.emp_no, e.last_name, e.first_name, dt.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS dt 
ON de.dept_no = dt.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8) frequency count of  employee last names in descending order
SELECT * FROM employees;

SELECT last_name, COUNT(last_name) AS "last_name_freq"
FROM employees
GROUP BY last_name
ORDER BY "last_name_freq" DESC;


