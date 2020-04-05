/*1. List the following details of each employee: employee number, last name, 
first name, gender, and salary. */
create view employees_salaries as
select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
from employees
join salaries on employees.emp_no=salaries.emp_no;

select * from employees_salaries;


--2. List employees who were hired in 1986.
create view emp_hire_year as
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.hire_date
from employees
where hire_date like '1986%';

select * from emp_hire_year


/*3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates*/
create view dept_mgr_info as
select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	dept_manager.to_date
from dept_manager
join employees on dept_manager.emp_no=employees.emp_no
join departments on dept_manager.dept_no=departments.dept_no;

select * from dept_mgr_info;


/*4. List the department of each employee with the following information: 
employee number, last name, first name, and department name. */
create view employees_dept as
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no;

select * from employees_dept;


--5. List all employees whose first name is "Hercules" and last names begin with "B."
create view hercules_b as
select * from employees
where first_name = 'Hercules' and
	last_name like 'B%';
	
select * from hercules_b;


/*6. List all employees in the Sales department, 
including their employee number, last name, first name, 
and department name. */
create view sales_dept as
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no
where dept_name='Sales';

select * from sales_dept;


/*7. List all employees in the Sales and Development 
departments, including their employee number, last 
name, first name, and department name. */
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no
where dept_name='Sales' or dept_name='Development';

/*7. List all employees in the Sales and Development 
departments, including their employee number, last 
name, first name, and department name. */
create view sales_development as
select departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
join employees on dept_emp.emp_no=employees.emp_no
where dept_name='Sales' or dept_name='Development'
group by departments.dept_name, 
	employees.emp_no, 
	employees.last_name,
	employees.first_name;

select * from sales_development;


/* 8. In descending order, list the frequency count 
of employee last names, i.e., how many employees 
share each last name. */
create view counted_lastnames as
select employees.last_name, 
count(last_name) as lastnames_count
from employees
group by employees.last_name
order by lastnames_count desc;

select * from counted_lastnames;