-- Queries for sql-challenge

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no AS "Employee No.",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    employees.sex AS "Sex",
    salaries.salary AS "Salary"
FROM employees
JOIN salaries
    ON employees.emp_no = salaries.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name AS "First Name",
    last_name AS "Last Name",
    hire_date AS "Hire Date"
FROM employees
WHERE CAST(hire_date AS VARCHAR)
LIKE '1986-%'
;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no AS "Department No.",
    departments.dept_name AS "Department Name",
    dept_manager.emp_no AS "Employee No.",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM dept_manager
JOIN departments
    ON dept_manager.dept_no = departments.dept_no
JOIN employees
    ON dept_manager.emp_no = employees.emp_no
;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no AS "Department No.",
    dept_emp.emp_no AS "Employee No.",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    departments.dept_name AS "Department Name"
FROM dept_emp
JOIN employees
    ON dept_emp.emp_no = employees.emp_no
JOIN departments
    ON dept_emp.dept_no = departments.dept_no
;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT  employees.first_name AS "First Name",
    employees.last_name AS "Last Name",
    employees.sex AS "Sex"
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%'
;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_no AS "Employee No.",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM employees
WHERE emp_no IN
    (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_no = 'd007'
    )    
    )
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no AS "Employee No.",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007'
	OR dept_emp.dept_no = 'd005'
;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT employees.last_name AS "Last Name", COUNT(employees.last_name) AS "Frequency"
FROM employees
GROUP BY employees.last_name
ORDER BY "Frequency" DESC
;