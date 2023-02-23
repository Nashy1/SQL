SELECT * FROM teachers;
 SELECT last_name, first_name, salary FROM teachers;
 
 --try it yourself 1
 SELECT school, first_name, last_name
FROM teachers
ORDER BY school DESC, last_name ASC;

--try it yourself 2
SELECT DISTINCT first_name, last_name, school, salary
FROM teachers
WHERE first_name LIKE 'S%' 
      AND salary > 40000;
	  
	  
--try it yourself 3
SELECT last_name, first_name, school, hire_date, salary
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;