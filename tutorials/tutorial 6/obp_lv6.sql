-- Zadatak 1
CREATE TABLE z16098 AS SELECT * FROM employees;

-- Zadatak 2
SELECT * FROM z15977
WHERE employee_id >= 500;

-- Zadatak 3
INSERT INTO z15977
            VALUES (500, 'Dejan', 'Azinovic', 'dazinovic1', '061-936-132', SYSDATE, 'MK_MAN', 40000, 0.99, 100, 90);
INSERT INTO z15977
            VALUES (501, 'James', 'Hetfield', 'jhetfield', '123-456-789', SYSDATE, 'MK_REP', 13500, 0.04, 100, 10);
INSERT INTO z15977
            VALUES (502, 'Kirk', 'Hammett', 'khammett', '321-654-987', SYSDATE, 'MK_REP', 9800, 0.05, 100, 20);
INSERT INTO z15977
            VALUES (503, 'Lars', 'Ulrich', 'lulrich', '987-654-321', SYSDATE, 'MK_REP', 10700, NULL, 100, 30);
INSERT INTO z15977
            VALUES (504, 'Robert', 'Trujillo', 'rtrujillo', '789-456-123', SYSDATE, 'MK_REP', 10300, 0.09, 100, 40);

-- Zadatak 4
UPDATE z15977
SET commission_pct = 0.4
WHERE salary < 3000;

-- Zadatak 5
UPDATE z15977 e
SET (salary, commission_pct) = (SELECT Decode(Nvl(e1.commission_pct, 0),
                                              0, 0.9*e1.salary,
                                              (1 + e1.commission_pct)*e1.salary) plata,
                                       Decode(Nvl(e1.commission_pct, 0),
                                              0, e1.commission_pct + 0.15,
                                              e1.commission_pct) dodatak
                                FROM z15977 e1
                                WHERE e.employee_id = e1.employee_id)
WHERE 'Oxford' = (SELECT l1.city
                    FROM z15977 e1, departments d1, locations l1
                    WHERE e1.department_id = d1.department_id AND d1.location_id = l1.location_id AND e.employee_id = e1.employee_id);


-- Zadatak 6
UPDATE z15977 e
SET e.department_id = (SELECT d1.department_id
                       FROM departments d1
                       WHERE d1.department_name = 'Marketing')
WHERE 'US' = (SELECT l1.country_id
              FROM z15977 e1, departments d1, locations l1
              WHERE e1.department_id = d1.department_Id AND d1.location_id = l1.location_id AND e.employee_id = e1.employee_id) AND
      e.salary < (SELECT Avg(e1.salary)
                  FROM z15977 e1
                  WHERE e1.department_id = e.department_id AND e1.employee_id <> e.employee_id) AND
      e.salary NOT IN (SELECT Max(e1.salary)
                       FROM z15977 e1
                       GROUP BY e1.department_id) AND
      e.salary NOT IN (SELECT Min(e1.salary)
                       FROM z15977 e1
                       GROUP BY e1.department_id);


-- connection string 80.65.65.66@etflab:1521
ALTER USER username IDENTIFIED BY password;
SELECT * FROM all_objects;
SELECT * FROM all_tables WHERE owner = 'HR';


-- Zadatak 7
UPDATE z15977 e
SET e.manager_id = (SELECT s1.manager_id
                    FROM z15977 s1, z15977 z1
                    WHERE (SELECT Count(z1.employee_id)
                           FROM employees s1, employees z1
                           WHERE s1.employee_id = z1.manager_id) =
                          (SELECT Min(Count(z1.employee_id))
                           FROM employees s1, employees z1
                           WHERE s1.employee_id = z1.manager_id
                           GROUP BY s1.employee_id))
WHERE e.employee_id IN (SELECT s1.manager_id
                        FROM z15977 s1, z15977 z1
                        WHERE (SELECT Count(z1.employee_id)
                               FROM employees s1, employees z1
                               WHERE s1.employee_id = z1.manager_id AND e.employee_id = s1.employee_id) >
                              (SELECT Avg(Count(z1.employee_id))
                               FROM employees s1, employees z1
                               WHERE s1.employee_id = z1.manager_id AND e.employee_id <> s1.employee_id
                               GROUP BY s1.employee_id));

-- pomocni upit
SELECT *
FROM employees s
WHERE (SELECT Count(z1.employee_id)
       FROM employees s1, employees z1
       WHERE s1.employee_id = z1.manager_id AND s.employee_id = s1.employee_id) >
      (SELECT Avg(Count(z1.employee_id))
       FROM employees s1, employees z1
       WHERE s1.employee_id = z1.manager_id AND s.employee_id <> s1.employee_id
       GROUP BY s1.employee_id);

-- Zadatak 8
CREATE TABLE o15977 AS SELECT * FROM departments;

-- Zadatak 9
UPDATE o15977 o
SET o.department_name = (SELECT Decode(l1.country_id,
                                       'US', 'US - ' || o.department_name,
                                       'OS - ' || o.department_name)
                         FROM o15977 o1, locations l1
                         WHERE o1.location_id = l1.location_id AND o.department_id = o1.department_id);

-- Zadatak 10
DELETE FROM z15977 z
WHERE z.department_id IN (SELECT o1.department_id
                          FROM o15977 o1
                          WHERE Lower(o1.department_name) LIKE '%a%');

-- Zadatak 11
DELETE FROM o15977 o
WHERE 0 = (SELECT Count(z1.employee_id)
           FROM z15977 z1, o15977 o1
           WHERE z1.department_id = o1.department_id AND o.department_id = o1.department_id);

-- Zadatak 12
DELETE FROM z15977 z
WHERE 'Asia' <> (SELECT r1.region_name
                 FROM z15977 z1, o15977 o1, locations l1, countries c1, regions r1
                 WHERE z1.department_id = o1.department_id AND o1.location_id = l1.location_id AND
                       l1.country_id = c1.country_id AND c1.region_id = r1.region_id AND z1.employee_id = z.employee_id) AND
      z.manager_id IN (SELECT z1.manager_id
                       FROM z15977 z1
                       WHERE z1.manager_id IN (SELECT s2.employee_id
                                               FROM z15977 z2, z15977 s2
                                               WHERE z2.manager_id = s2.employee_id AND
                                                     s2.salary > ALL (SELECT s3.salary
                                                                      FROM z15977 z3, z15977 s3
                                                                      WHERE z3.manager_id = s3.employee_id AND
                                                                            s3.employee_id IN (SELECT z4.manager_id
                                                                                               FROM z15977 z4
                                                                                               GROUP BY z4.manager_id
                                                                                               HAVING Count(*) = (SELECT Min(Count(*))
                                                                                                                  FROM z15977 z5
                                                                                                                  GROUP BY z5.manager_id)
                                                                                              )
                                                                     )
                                              )
                       GROUP BY z1.manager_id
                       HAVING 3 <= Count(*));






SELECT * FROM employees
ORDER BY manager_id;

SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING Count(*) >= 3
ORDER BY manager_id;



SELECT z4.manager_id
FROM z15977 z4
GROUP BY z4.manager_id
HAVING Count(*) = (SELECT Min(Count(*))
                   FROM z15977 z5
                   GROUP BY z5.manager_id)

