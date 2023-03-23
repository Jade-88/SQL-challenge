--List the employee number, last name, first name, sex, and salary of each employee.
select em.emp_no, em.last_name, 
	em.first_name, em.sex,
	s.salary
	from employees as em
	left join salaries as s
	on (em.emp_no=s.emp_no)
	order by em.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
select em.first_name, em.last_name, em.hire_date
from employees as em
where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select  e.last_name,
        e.first_name,
		dm.dept_no,
		d.dept_name,
		dm.emp_no
from dept_manager as dm
    inner join departments as d
        on (dm.dept_no = d.dept_no)
    inner join employees as e
        on (dm.emp_no = e.emp_no);
		
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dt.dept_no,
		dt.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
from dept_emp as dt
	inner join departments as d
		on (dt.dept_no = d.dept_no)
	inner join employees as e
		on (dt.emp_no = e.emp_no);
		
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select em.first_name, em.last_name, em.sex
from employees as em
where first_name = 'Hercules' and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
	inner join dept_emp de on
	de.emp_no =  e.emp_no
	inner join departments d on
	d.dept_no = d.dept_no
where d.dept_name = 'Sales' 

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
	inner join dept_emp de on
	de.emp_no = e.emp_no
	inner join departments d on
	d.dept_no =d.dept_no
where d.dept_name in ('Sales','Development')
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select e.last_name,
count (last_name) as total
from employees e
group by last_name
order by total desc;


