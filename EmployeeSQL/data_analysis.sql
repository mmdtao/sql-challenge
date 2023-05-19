SELECT employees.emp_no
,last_name
,first_name
,sex
,salary
FROM employees
	LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--2

SELECT first_name
,last_name
,hire_date
FROM employees
WHERE DATE_PART('Year',hire_date) = '1986';

--3

SELECT dept_managers.dept_no
,dept_name
,dept_managers.emp_no
,last_name
,first_name
FROM employees
	JOIN dept_managers ON employees.emp_no = dept_managers.emp_no
	JOIN departments ON dept_managers.dept_no = departments.dept_no;

--4

SELECT dept_emp.dept_no
,employees.emp_no
,last_name
,first_name
,dept_name
FROM employees
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no;

--5

SELECT first_name
,last_name
,sex
FROM employees
WHERE first_name = 'Hercules' AND SUBSTRING(last_name,1,1) = 'B';

--6

SELECT emp_no
,last_name
,first_name
FROM employees
WHERE emp_no in (
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'
		)
	);

--7

SELECT employees.emp_no
,last_name
,first_name
,dept_name
FROM employees
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8

SELECT last_name
,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name desc;