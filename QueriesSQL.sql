SELECT * FROM departments;
SELECT * FROM deptemploye;
SELECT * FROM deptmanager;
SELECT * FROM employes;
SELECT * FROM salaries;
SELECT * FROM titles;

#1
SELECT employes.emp_no, employes.last_name, employes.first_name, employes.sex, salaries.salary
FROM employes JOIN salaries ON employes.emp_no = salaries.emp_no;

#2
SELECT first_name, last_name, hire_date 
FROM employes WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

#3
SELECT departments.dept_no, departments.dept_name, deptmanager.emp_no, employes.last_name, employes.first_name
FROM departments 
JOIN deptmanager ON departments.dept_no = deptmanager.dept_no
JOIN employes ON deptmanager.emp_no = employes.emp_no;

#4
SELECT deptemploye.emp_no, employes.last_name, employes.first_name, departments.dept_name
FROM deptemploye
JOIN employes ON deptemploye.emp_no = employes.emp_no
JOIN departments ON deptemploye.dept_no = departments.dept_no;

#5
SELECT first_name, last_name
FROM employes WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

#6
SELECT deptemploye.emp_no, employes.last_name, employes.first_name, departments.dept_name
FROM deptemploye
JOIN employes ON deptemploye.emp_no = employes.emp_no
JOIN departments ON deptemploye.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

#7
SELECT deptemploye.emp_no, employes.last_name, employes.first_name, departments.dept_name
FROM deptemploye
JOIN employes ON deptemploye.emp_no = employes.emp_no
JOIN departments ON deptemploye.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

#8
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employes
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;



