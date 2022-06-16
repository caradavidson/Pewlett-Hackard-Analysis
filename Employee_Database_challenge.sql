--SQL CHALLENGE

--Deliverable 1 The number of retiring employees by title
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO retirement_title
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_title as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;

--retiring_titles data 
SELECT 
	COUNT(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY 2
ORDER BY 1 DESC

--Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;

SELECT * 
FROM mentorship_eligibility;

SELECT COUNT (emp_no) 
FROM mentorship_eligibility;

Select COUNT(DISTINCT emp_no)
FROM mentorship_eligibilty;