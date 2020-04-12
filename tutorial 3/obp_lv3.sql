
-- Zadatak 1
SELECT SYSDATE "date", USER "user"
FROM dual;

-- Zadatak 2
SELECT employee_id, first_name, last_name, salary, round(salary*1.25, 0) "Plata uvecana za 25%"
FROM employees;

-- Zadatak 3
SELECT employee_id, first_name, last_name, salary, round(salary*1.25, 0) "Plata uvecana za 25%", Mod(Round(salary*1.25, 0), 100) "Ostatak plate"
FROM employees;

-- Zadatak 4
SELECT first_name, last_name, hire_date, To_char(Next_Day(Add_Months(hire_date, 6), 'Monday'), 'DD - Month, YYYY')
FROM employees;

-- Zadatak 5
SELECT e.first_name || e.last_name Zaposleni, d.department_name Odjel, r.region_name Kontinent, Round(Months_Between(SYSDATE, hire_date)) "Broj mjeseci zaposljenja"
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.country_id = c.country_id AND c.region_id = r.region_id;

-- Zadatak 6
SELECT e.first_name || ' ' || e.last_name || ' prima platu ' || e.salary || ' mjesecno ali on bi zelio platu ' ||
       To_Char(e.salary*(1+Nvl(e.commission_pct,0))*4.5) || '.' AS "Plata o kojoj mozes sanjati"
FROM employees e
WHERE e.department_id IN (10, 30, 50);

-- Zadatak 7
SELECT LPad((e.first_name || ' ' || e.last_name || ' ' || e.salary), 50, '$') AS "Ime + Plata"
FROM employees e;

-- Zadatak 8
SELECT Lower(SubStr(e.first_name, 1, 1)) || Upper(SubStr(e.first_name, 2, Length(e.first_name)-1) || ' ' || e.last_name) Zaposleni, Length(e.first_name || ' ' || e.last_name) "Duzina naziva"
FROM employees e
WHERE SubStr(e.first_name, 1, 1) IN ('A', 'J', 'M', 'S');

-- Zadatak 9
SELECT e.first_name || ' ' || e.last_name Zaposleni, e.hire_date "Datum zaposljenja", To_Char(e.hire_date, 'Day') "Dan zaposlenja"
FROM employees e
ORDER BY Decode(To_Char(e.hire_date, 'Dy'),
                'Mon', 1,
                'Tue', 2,
                'Wed', 3,
                'Thu', 4,
                'Fri', 5,
                'Sat', 6,
                'Sun', 7);

-- Zadatak 10
SELECT e.first_name || ' ' || e.last_name Zaposleni, l.city, Decode(commission_pct, NULL, 'Zaposlenik ne prima dodatak na platu', e.salary*e.commission_pct) "Dodatak na platu"
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id;

-- Zadatak 11
SELECT e.first_name || ' ' || e.last_name Zaposleni, e.salary Plata, LPad('*', Round(e.salary/1000), '*') Indikator
FROM employees e;

-- Zadatak 12
SELECT e.first_name || ' ' || e.last_name Zaposleni, j.job_title Posao, Decode(j.job_title,
                                                                              'President', 'A',
                                                                              'Manager', 'B',
                                                                              'Analyst', 'C',
                                                                              'Sales manager', 'D',
                                                                              'Programmer', 'E',
                                                                              'X') Stepen
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

