--use sample
--create unique index i_emp_name
--on employee (emp_fname, emp_lname)

--10.5
use sample
create unique index i_emp_lname
on employee(emp_lname)

go

--10.6
use sample
create unique index i_emp_name
on employee (emp_fname, emp_lname)

go

--10.7
use sample
create unique index i_emp_no
on works_on (emp_no)

create unique index i_emp_no
on employee (emp_no)

go

--10.8
use sample
create unique index i_emp_name
on employee (emp_fname, emp_lname)

create unique index i_dept_no
on department (dept_no)

go