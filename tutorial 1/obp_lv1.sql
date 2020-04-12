
SELECT * FROM employees;

-- 1. Napisati upit koji ce prikazati naziv zaposlenog i platu za sve zaposlene koji imaju platu vecu od 2456.
SELECT first_name, salary
FROM employees
WHERE salary > 2456;

-- 2. Napisti upit koji ce prikazati naziv zaposlenog i šifru odjela za šifru zaposlenog 102.
SELECT first_name || ' ' || last_name, department_id
FROM employees
WHERE employee_id = 102;

-- 3. Napisati upit koji ce prikazati sve zaposlene cija plata nije u rangu od 1000 do 2345.
SELECT *
FROM employees
WHERE salary NOT BETWEEN 1000 AND 2345;

-- 4. Napisati upit koji ce prikazati naziv zaposlenog (predstavljeno kao jedna kolona) «Zaposleni»,
--    posao i datum zaposlenja za sve zaposlene koji su poceli da rade u  periodu od 11.01.1996 do 22.02.1997.
SELECT first_name || ' ' || last_name "Zaposleni", job_id, hire_date
FROM employees
WHERE hire_date BETWEEN To_Date('11.01.1996', 'dd.mm.yyyy') AND To_Date('22.02.2007', 'dd.mm.yyyy');

-- 5. Napisati upit koji ce prikazati naziv zaposlenog i šifru odjela za sve zaposlene iz odjela 10 i 30 sortirano po prezimenu zaposlenog.
SELECT first_name || ' ' || last_name, department_id
FROM employees
WHERE department_id = 10 OR department_id = 30
ORDER BY last_name;

-- 6. Napisati upit koji ce prikazati platu, ime, prezime i dodatak na platu za sve zaposlene koji imaju platu vecu od 1500
--    i rade u odjelima 10 ili 30. Za labele kolona uzeti respektovno: mjesecna plata, ime zaposlenog, prezime zaposlenog i dodatak na platu.
SELECT salary "Mjesecna plata", first_name "Ime zaposlenog", last_name "Prezime zaposlenog", Nvl(commission_pct, 0) "Dodatak na platu"
FROM employees
WHERE salary > 1500 AND (department_id = 10 OR department_id = 30);

-- 7. Napisati upit sve zaposlene koji su poceli da rade prije 1996 godine.
SELECT *
FROM employees
WHERE hire_date < To_Date('01.01.2006', 'dd.mm.yyyy');

-- 8. Napisati upit koji ce prikazati naziv, platu i posao zaposlenog za sve zaposlene koji nemaju nadredenog.
SELECT first_name || ' ' || last_name, salary, job_id
FROM employees
WHERE manager_id IS NULL;

-- 9. Napisati upit koji ce prikazati naziv zaposlenog, platu i dodatak na platu za sve one zaposlene koji su stekli dodatak na platu.
--    Sortirati podatke u opadajucem poretku po plati i dodatku na platu.
SELECT first_name || ' ' || last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

-- 10. Napisati upit koji ce prikazati naziv zaposlenog za sve one zaposlene koji imaju dva slova «l» u nazivu (naziv se sastoji od imena i prezimena zaposlenog).
SELECT first_name || ' ' || last_name
FROM employees
WHERE first_name || ' ' || last_name LIKE '%l%l%';

-- 11. Napisati upit koji ce prikazati naziv, platu i dodatak na platu za sve zaposlene ciji je iznos dodatka na platu veci od plate zaposlenog umanjene za 80%.
SELECT first_name || ' ' || last_name, salary, Nvl(commission_pct, 0)
FROM employees
WHERE Nvl(commission_pct, 0)*salary > 0.2*salary;
