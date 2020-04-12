SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;
SELECT * FROM locations;

-- Zadatak 1
SELECT e.first_name || ' ' || e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- Zadatak 2
SELECT DISTINCT j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND d.department_id = 30;

-- Zadatak 3
SELECT e.first_name || ' ' || e.last_name, d.department_name, l.street_address || ', ' || l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND e.commission_pct IS NULL;

-- Zadatak 4
SELECT e.first_name || ' ' || e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.first_name LIKE '%A%';

-- Zadatak 5
SELECT e.first_name || ' ' || e.last_name, j.job_title, d.department_id, d.department_name
FROM employees e, departments d, jobs j, locations l
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND d.location_id = l.location_id AND l.city LIKE 'Seattle';

-- Zadatak 6
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", e.employee_id "Sifra zaposlenog", m.first_name || ' ' || m.last_name "Naziv sefa", m.employee_id "Sifra sefa", l.city "Grad sefa"
FROM employees e, employees m, departments d, locations l
WHERE e.manager_id = m.employee_id AND m.department_id = d.department_id AND d.location_id = l.location_id;

-- Zadatak 7
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", e.employee_id "Sifra zaposlenog", m.first_name || ' ' || m.last_name "Naziv sefa", m.employee_id "Sifra sefa", l.city "Grad sefa"
FROM employees e, employees m, departments d, locations l
WHERE e.manager_id = m.employee_id(+) AND m.department_id = d.department_id(+) AND d.location_id = l.location_id(+);

-- Zadatak 8
SELECT a.first_name || ' ' || a.last_name "Zaposleni", a.department_id "Sifra odjela", b.first_name || ' ' || b.last_name "Kolege"
FROM employees a, employees b
WHERE a.department_id = b.department_id AND a.first_name || ' ' || a.last_name <> b.first_name || ' ' || b.last_name
ORDER BY 1, 2;

-- Zadatak 9
SELECT e.first_name || ' ' || e.last_name "Zaposleni", j.job_title "Posao", d.department_name "Odjel", e.salary "Plata", j.min_salary, j.max_salary
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND e.salary*(1 + Nvl(e.commission_pct, 0)) NOT BETWEEN j.min_salary AND j.max_salary;

-- Zadatak 10
SELECT a.first_name || ' ' || a.last_name "Zaposleni", b.first_name || ' ' || b.last_name, a.hire_date "Datum zaposlenja"
FROM employees a, employees b
WHERE b.last_name = 'King' AND b.first_name = 'Steven' AND a.hire_date < b.hire_date;

-- Zadatak 11
SELECT z.first_name || ' ' || z.last_name "Zaposleni", z.hire_date "Datum zaposlenja", s.first_name || ' ' || s.last_name "Sef", s.hire_date "Datum zaposlenja sefa"
FROM employees z, employees s
WHERE z.manager_id = s.employee_id AND z.hire_date < s.hire_date;

