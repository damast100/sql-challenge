-- making sure that all of the tables are populated correctly
select * from department_employee
select * from department_manager
select * from departments
select * from employees
select * from salaries
select * from title

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
	Inner Join salaries as s On
		e.emp_no = s.emp_no;
		

--2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date
Like '%1986'


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from employees as e
	Inner join department_manager as dm On
		e.emp_no = dm.emp_no
	Inner join departments as d On
		dm.dept_no = d.dept_no


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	Left Join department_employee as de On
		e.emp_no = de.emp_no
	Left Join departments as d On
		de.dept_no = d.dept_no


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where first_name = 'Hercules'
And last_name Like 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	Left Join department_employee as de On
		e.emp_no = de.emp_no
	Left Join departments as d On
		de.dept_no = d.dept_no
	Where dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	Left Join department_employee as de On
		e.emp_no = de.emp_no
	Left Join departments as d On
		de.dept_no = d.dept_no
	Where dept_name = 'Sales'
	Or dept_name = 'Development'


--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name) as "employee count"
from employees
group by last_name
order by "employee count" desc