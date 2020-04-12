-- 1. Zadatak
SELECT Sum(commission_pct*salary), Count(commission_pct), Count(*)
FROM employees;

-- 2. Zadatak
SELECT j.job_title "Naziv posla", d.department_name "Naziv organizacione jedinice", Count(*)
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id
GROUP BY j.job_title, d.department_name;

-- 3. Zadatak
SELECT Round(Max(salary), 6) "Max", Round(Min(salary), 6)  "Min", Round(Sum(salary), 6)  "Sum", Round(Avg(salary), 6)  "Avg"
FROM employees;

-- 4. Zadatak
SELECT j.job_title "Posao", Round(Max(salary), 6)  "Max", Round(Min(salary), 6)  "Min", Round(Avg(salary), 6)  "Avg"
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.job_title;

-- 5. Zadatak
SELECT j.job_title "Posao", Count(*) "Broj zaposlenih"
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.job_title;

-- 6. Zadatak - Interpretacija 1
SELECT Count(*) "Broj menadzera"
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND j.job_title LIKE '%Manager%'
GROUP BY j.job_title;

-- 6. Zadatak - Interpretacija 2
SELECT Count(*) "Broj menadzera"
FROM ( SELECT DISTINCT m.employee_id
       FROM employees e, employees m
       WHERE e.manager_id = m.employee_id );
	   
-- 6. Zadatak - Interpretacija 3
SELECT Count(DISTINCT manager_id) "Broj menadzera"
FROM employees;

-- 7. Zadatak - Skontao ^^
SELECT DISTINCT m.first_name || ' ' || m.last_name "Naziv menadzera", m.salary "Plata"
FROM employees e, employees m, departments d
WHERE e.manager_id = m.employee_id AND d.department_id = m.department_id
      AND m.salary < ( SELECT Min(m1.salary)
                       FROM employees e1, employees m1
                       WHERE m1.employee_id = e1.manager_id AND m1.department_id <> m.department_id );

-- 8. Zadatak
SELECT d.department_name "Odjel", l.city "Grad", Count(e.employee_id) "Broj uposlenika", Round(Avg(e.salary), 2) "Prosjecna plata"
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
GROUP BY d.department_name, l.city;

-- 9. Zadatak - Vjerovatno može i jednostavnije, ali ovo je isto tako moguæe rješenje
SELECT Max(g) "2001g", Max(gg) "2002g", Max(ggg) "2003g", Max(gggg) "2004g", Max(ggggg) "2005g", Max(gggggg) "2006g", Max(ggggggg) "2007g", Max(gggggggg) "2008g",
       Sum(g) + Sum(gg) + Sum(ggg) + Sum(gggg) + Sum(ggggg) + Sum(gggggg) + Sum(ggggggg) + Sum(gggggggg) "Ukupno"
FROM  ( SELECT Decode( To_Char(hire_date,'YYYY'), '2001', Count(*), 0) AS g,
               Decode( To_Char(hire_date,'YYYY'), '2002', Count(*), 0) AS gg,
               Decode( To_Char(hire_date,'YYYY'), '2003', Count(*), 0) AS ggg,
               Decode( To_Char(hire_date,'YYYY'), '2004', Count(*), 0) AS gggg,
               Decode( To_Char(hire_date,'YYYY'), '2005', Count(*), 0) AS ggggg,
               Decode( To_Char(hire_date,'YYYY'), '2006', Count(*), 0) AS gggggg,
               Decode( To_Char(hire_date,'YYYY'), '2007', Count(*), 0) AS ggggggg,
               Decode( To_Char(hire_date,'YYYY'), '2008', Count(*), 0) AS gggggggg
        FROM employees
        GROUP BY To_Char(hire_date,'YYYY') );
		
-- 9. Zadatak - Jednostavnije
SELECT Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2001, Count(e.employee_id), 0)) "2001",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2002, Count(e.employee_id), 0)) "2002",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2003, Count(e.employee_id), 0)) "2003",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2004, Count(e.employee_id), 0)) "2004",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2005, Count(e.employee_id), 0)) "2005",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2006, Count(e.employee_id), 0)) "2006",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2007, Count(e.employee_id), 0)) "2007",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2008, Count(e.employee_id), 0)) "2008",
       Sum(Decode( To_Number(To_Char(e.hire_date, 'yyyy')), 2001, Count(e.employee_id),
                                                            2002, Count(e.employee_id),
                                                            2003, Count(e.employee_id),
                                                            2004, Count(e.employee_id),
                                                            2005, Count(e.employee_id),
                                                            2006, Count(e.employee_id),
                                                            2007, Count(e.employee_id),
                                                            2008, Count(e.employee_id), 0)) "Ukupno"
FROM employees e
GROUP BY e.hire_date;

-- 10. Zadatak
SELECT j.job_title, Decode( e.department_id, 10, Sum(e.salary), 0) O10,
                    Decode( e.department_id, 30, Sum(e.salary), 0) O30,
                    Decode( e.department_id, 50, Sum(e.salary), 0) O50,
                    Decode( e.department_id, 90, Sum(e.salary), 0) O90,
                    Decode( e.department_id, 10, Sum(e.salary),
                                             30, Sum(e.salary),
                                             50, Sum(e.salary),
                                             90, Sum(e.salary), 0) "Ukupno"
FROM jobs j, employees e, departments d
WHERE e.department_id = d.department_id AND e.job_id = j.job_id
GROUP BY j.job_title, d.department_id;
