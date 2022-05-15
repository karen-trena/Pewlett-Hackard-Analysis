-- retirement titles
SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title,titles.from_date,titles.to_date
into retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

order by employees.emp_no;
-------------------------------
-- unique titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
where to_date='9999-01-01'
ORDER BY emp_no ASC, to_date DESC;
-------------------------------
-- retiring titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
-------------------------------
-- mentorship eligibility
SELECT distinct on (employees.emp_no) 
employees.emp_no, employees.first_name, employees.last_name,employees.birth_date,
dept_emp.from_date,dept_emp.to_date,
titles.title
into mentorship_eligibilty
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN titles
ON dept_emp.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and dept_emp.to_date='9999-01-01'
order by employees.emp_no;
-------------------------------
--extra
SELECT count(employees.emp_no), titles.title
--into extra
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
group by titles.title

-------------------------------
--extraextra
SELECT count(mentorship_eligibilty.emp_no), mentorship_eligibilty.title
FROM mentorship_eligibilty
group by mentorship_eligibilty.title

