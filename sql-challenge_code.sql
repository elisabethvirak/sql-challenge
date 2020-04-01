create table dept_manager (
	dept_no varchar(30) not null,
	foreign key (dept_no) references departments(dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	from_date varchar(30),
	to_date varchar(30));
