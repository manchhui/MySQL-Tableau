USE employees_mod;

SELECT MIN(salary) FROM t_salaries;

SELECT MAX(salary) FROM t_salaries;

-- Stored procedures Task4 EXERCISE
DROP PROCEDURE IF EXISTS avg_m_f_dept;

DELIMITER $$
CREATE PROCEDURE avg_m_f_dept(IN p_lower_sal FLOAT, IN p_upper_sal FLOAT)
BEGIN
SELECT 
	e.gender,
    d.dept_name,
	ROUND(AVG(s.salary)) AS salary
FROM 
	t_salaries s
		JOIN
	t_employees e ON s.emp_no = e.emp_no
		JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
		JOIN
    t_departments d ON d.dept_no = de.dept_no
WHERE s.salary BETWEEN p_lower_sal AND p_upper_sal 
GROUP BY d.dept_no, e.gender;
END$$
DELIMITER ;

call avg_m_f_dept(50000,90000);
