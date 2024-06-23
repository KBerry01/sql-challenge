-- List the employee number, last name, first name, sex, and salary of each employee

Select e.emp_no, e.first_name, e.last_name, e.sex, s.salary
from employees as e
join salaries as s
on (e.emp_no = s.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986

Select e.first_name, e.last_name, e.hire_date
from employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

Select e.emp_no, e.first_name, e.last_name, de.dept_name , d.dept_no
from employees as e
join dept_manager as d
on (e.emp_no = d.emp_no)
	join departments as de
	on (d.dept_no = de.dept_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select e.emp_no, e.first_name, e.last_name, de.dept_name , d.dept_no
from employees as e
join dept_emp as d
on (e.emp_no = d.emp_no)
	join departments as de
	on (de.dept_no = d.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

Select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules'
	and e.last_name like 'B%'
;

-- List each employee in the Sales department, including their employee number, last name, and first name.

Select e.first_name, e.last_name, e.emp_no, de.dept_name
from employees as e
join dept_emp as d
	on (d.emp_no = e.emp_no)
	join departments as de
	on (de.dept_no = d.dept_no)
		where de.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select e.first_name, e.last_name, e.emp_no, de.dept_name
from employees as e
join dept_emp as d
	on (d.emp_no = e.emp_no)
	join departments as de
	on (de.dept_no = d.dept_no)
		WHERE de.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Select e.last_name, count(e.emp_no) as num_last_name
from employees as e
group by e.last_name
order by num_last_name desc;
	