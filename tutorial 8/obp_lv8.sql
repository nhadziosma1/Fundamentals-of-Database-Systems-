-- Zadatak 1
CREATE TABLE zap2 AS SELECT * FROM employees;

ALTER TABLE zap2
ADD (id NUMBER(4));

CREATE SEQUENCE ms
NOCACHE
NOCYCLE;

UPDATE zap2
SET id = ms.NEXTVAL;

COMMIT;

ALTER TABLE zap2
ADD CONSTRAINT c_zap2_id_pk PRIMARY KEY (id);

-- Zadatak 2
CREATE TABLE o2 AS SELECT * FROM departments;

ALTER TABLE o2
ADD (id NUMBER(4), datum DATE);

UPDATE o2
SET id = ms.NEXTVAL, datum = SYSDATE;

COMMIT;

ALTER TABLE o2
ADD CONSTRAINT c_o2_id_dat_pk PRIMARY KEY (id, datum);

-- Zadatak 4
SELECT * FROM user_constraints;

SELECT * FROM all_constraints
WHERE owner = 'HR'
ORDER BY table_name;

SELECT * FROM all_constraints
WHERE owner = 'test';

-- Zadatak 5
SELECT a.table_name, b.table_name
FROM all_cons_columns a, all_cons_columns b
WHERE a.owner = 'HR' AND b.owner = 'HR' AND a.column_name = b.column_name AND a.table_name <> b.table_name AND
      (a.table_name = 'EMPLOYEES' AND b.table_name <> 'EMPLOYEES' OR a.table_name = 'DEPARTMENTS' AND b.table_name <> 'DEPARTMENTS') AND
      a.constraint_name LIKE '%FK' AND b.constraint_name LIKE '%PK';

-- Zadatak 6
SELECT * FROM zap2;

ALTER TABLE zap2
ADD (plata_dodatak NUMBER(12, 2));

UPDATE zap2 z
SET z.plata_dodatak = (1 + z.commission_pct)*z.salary
WHERE 'US' = (SELECT l1.country_id
              FROM zap2 z1, departments o1, locations l1
              WHERE z1.department_id = o1.department_id AND o1.location_id = l1.location_id AND z1.employee_id = z.employee_id);

COMMIT;

-- Zadatak 7

ALTER TABLE zap2
ADD CONSTRAINT zap2_pdodatak_ck CHECK (plata_dodatak BETWEEN 100 AND 5000);

-- Zadatak 8
CREATE VIEW zap_pog (sifra_zaposlenog, naziv_zaposlenog, naziv_odjela)
AS
SELECT e.employee_id, e.first_name || ' ' || e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND
      e.salary > (SELECT Avg(e1.salary)
                  FROM employees e1
                  WHERE e1.department_id = e.department_id);

-- Zadatak 9
SELECT * FROM zap_pog;

-- Zadatak 10
CREATE VIEW z3_pog (posao, odjel, prosjecna_plata, dodatak_na_platu)
AS
SELECT j.job_title, d.department_name, Avg(e.salary), Sum(e.salary*e.commission_pct)
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND
      (Lower(j.job_title) LIKE '%a%' OR Lower(j.job_title) LIKE '%b%' OR Lower(j.job_title) LIKE '%c%') AND
      (Lower(d.department_name) LIKE '%a%' OR Lower(d.department_name) LIKE '%b%' OR Lower(d.department_name) LIKE '%c%')
GROUP BY j.job_title, d.department_name;
WITH READ ONLY;

-- Zadatak 11
-- Zadatak 12

-- Zadatak 13
CREATE OR REPLACE VIEW sef_pog (naziv, broj_zaposlenih, min_plata_odjela, max_plata_odjela)
AS
SELECT DISTINCT s.first_name || ' ' || s.last_name,
       (SELECT Count(e1.employee_id)
        FROM employees e1
        WHERE e1.manager_id = s.employee_id),
       (SELECT Min(e1.salary)
        FROM employees e1
        WHERE e1.department_id = s.department_id),
       (SELECT Max(e1.salary)
        FROM employees e1
        WHERE e1.department_id = s.department_id)
FROM employees s, employees z
WHERE s.employee_id = z.manager_id


SELECT * FROM sef_pog;

-- Zadatak 14
CREATE OR REPLACE VIEW sef_pog (naziv, broj_zaposlenih, min_plata_odjela, max_plata_odjela, sumarna_plata_zaposlenih)
AS
SELECT DISTINCT s.first_name || ' ' || s.last_name,
       (SELECT Count(e1.employee_id)
        FROM employees e1
        WHERE e1.manager_id = s.employee_id),
       (SELECT Min(e1.salary)
        FROM employees e1
        WHERE e1.department_id = s.department_id),
       (SELECT Max(e1.salary)
        FROM employees e1
        WHERE e1.department_id = s.department_id),
       (SELECT Sum((1 + Nvl(e1.commission_pct, 0))*e1.salary)
        FROM employees e1
        WHERE e1.manager_id = s.employee_id)
FROM employees s, employees z
WHERE s.employee_id = z.manager_id
WITH READ ONLY;
