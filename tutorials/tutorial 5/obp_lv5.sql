-- Laboratorijska Vježba 5 - Podupiti

-- Zadatak 1 - Samo je Susan zaposlena u odjelu 40, probajte Donald
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", d.department_name "Odjel", d.department_id, j.job_title "Posao"
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND e.first_name NOT LIKE 'Susan' AND
      e.department_id = ( SELECT department_id
                           FROM employees
                           WHERE first_name LIKE 'Susan' );

-- Zadatak 2
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > ( SELECT Avg(salary)
                 FROM employees
                 WHERE department_id IN (30, 90) );

-- Zadatak 3
SELECT *
FROM employees
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE first_name LIKE '%C%' );

-- Zadatak 4
SELECT e.employee_id "Sifra zaposlenog", e.first_name || ' ' || e.last_name "Naziv zaposlenog", j.job_title "Naziv posla"
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND department_id IN ( SELECT d.department_id
                                                 FROM departments d, locations l
                                                 WHERE d.location_id = l.location_id AND l.city LIKE 'Toronto' );

-- Zadatak 5
SELECT *
FROM employees
WHERE manager_id IN ( SELECT employee_id
                      FROM employees
                      WHERE last_name LIKE 'King' );

-- Zadatak 6 - Ako je greška u postavci, treba modificirati zadatak 2
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > ( SELECT Avg(e1.salary)
                   FROM employees e1
                   WHERE e1.department_id = e.department_id );

-- Zadatak 6 - Ako nije onda...
SELECT *
FROM employees
WHERE salary > ( SELECT Avg(salary)
                 FROM employees
                 WHERE first_name LIKE '%C%' );

-- Zadatak 7
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", d.department_name "Naziv odjela", e.salary "Plata"
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.salary IN ( SELECT e1.salary
                                                          FROM employees e1
                                                          WHERE e1.department_id = e.department_id AND e1.commission_pct IS NOT NULL );

-- Zadatak 8 - U Rimu nema zaposlenika, boje je Seattle
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", d.department_name "Naziv odjela", e.salary "Plata", l.city "Grad"
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND  l.location_id = d.location_id
      AND (e.salary, Nvl(e.commission_pct, 0)) IN ( SELECT te.salary, Nvl(te.commission_pct,0)
                                                    FROM employees te, departments td, locations tl
                                                    WHERE te.department_id = td.department_id AND  tl.location_id = td.location_id AND tl.city LIKE 'Seattle'
                                                    GROUP BY te.salary, te.commission_pct );

-- Zadatak 9 - Scott ne postoji, može Susan
SELECT first_name || ' ' || last_name "Naziv zaposlenog", hire_date "Datum zaposlenja", salary "Plata"
FROM employees
WHERE (salary, Nvl(commission_pct, 0)) IN ( SELECT salary, Nvl(commission_pct, 0)
                                            FROM employees
                                            WHERE first_name LIKE 'Susan' );
-- Zadatak 10
SELECT *
FROM employees
WHERE salary > ( SELECT Max(salary)
                 FROM employees e, departments d
                 WHERE e.department_id = d.department_id AND Lower(department_name) LIKE '%sale%' )
ORDER BY salary DESC;

-- Zadatak 11
SELECT e.first_name || ' ' || e.last_name "Naziv zaposlenog", d.department_name "Naziv odjela", j.job_title "Naziv posla", l.city "Grad"
FROM employees e, departments d, jobs j, locations l, ( SELECT Avg(s.salary) prosjecna_plata
                                                        FROM employees e, employees s
                                                        WHERE e.manager_id = s.employee_id AND s.commission_pct IS NOT NULL ) sefovi
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND d.location_id = l.location_id AND e.salary > sefovi.prosjecna_plata;

-- Zadatak 12
SELECT e.employee_id "Sifra zaposlenog", Concat(Concat(e.first_name,' '),e.last_name) "Naziv zaposlenog",
       d.department_id "Sifra odjela", d.department_name "Naziv odjela",

       ( SELECT Ceil(Avg(f.salary))
         FROM employees f
         WHERE e.department_id=f.department_id ) "Prosjecna plata odjela",

       ( SELECT Min(f1.salary)
         FROM employees f1
         WHERE e.department_id=f1.department_id ) "Mininalna plata odjela",

       ( SELECT Max(f2.salary)
         FROM employees f2
         WHERE e.department_id=f2.department_id ) "Maksimalna plata odjela",

       ( SELECT Ceil(Avg(t.salary))
         FROM employees t ) "Prosjecna plata firme",

       ( SELECT Min(t1.salary)
         FROM employees t1 ) "Minimalna plata firme",

       ( SELECT Max(t2.salary)
         FROM employees t2 ) "Maksimalna plata firme"

FROM employees e, departments d
WHERE e.department_id = d.department_id   AND e.salary > ( SELECT Min(Avg(ts.salary))
                                                           FROM employees ts
                                                           WHERE e.manager_id = ts.employee_id AND e.department_id = ts.department_id
                                                           GROUP BY ts.department_id );
