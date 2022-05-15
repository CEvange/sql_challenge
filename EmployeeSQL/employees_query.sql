--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp_no, last_name, first_name, sex, 
	(select salary
	from salaries 
	 where salaries.emp_no=employees.emp_no)
from employees;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, dept_manager.emp_no, 
	(select dept_name
	from departments
	where departments.dept_no = dept_manager.dept_no),
	employees.last_name, employees.first_name
from dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;
	 

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	JOIN dept_emp as de
	ON (e.emp_no=de.emp_no)	
		 JOIN departments as d
		 ON (de.dept_no=d.dept_no);

		 
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	JOIN dept_emp as de
	ON (e.emp_no=de.emp_no)	
		 JOIN departments as d
		 ON (de.dept_no=d.dept_no)
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	JOIN dept_emp as de
	ON (e.emp_no=de.emp_no)	
		 JOIN departments as d
		 ON (de.dept_no=d.dept_no)
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as Frequency
from employees
group by last_name
order by frequency desc;
