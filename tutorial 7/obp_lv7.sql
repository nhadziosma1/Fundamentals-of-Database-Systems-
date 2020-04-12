-- Zadatak 1
CREATE TABLE mt (Id VARCHAR2(25) CONSTRAINT mt_id_nn NOT NULL,
                 naziv VARCHAR2(10) CONSTRAINT mt_naziv_nn NOT NULL,
                 opis CHAR(15),
                 datum DATE CONSTRAINT mt_datum_nn NOT NULL,
                 korisnik VARCHAR2(30) CONSTRAINT mt_korisnik_nn NOT NULL,
                 napomena VARCHAR2(10));

SELECT * FROM mt;

-- Zadatak 2
INSERT INTO mt(id, naziv, opis, datum, korisnik, napomena)
    SELECT department_id, SubStr(department_name, 1, 10), 'Test', SYSDATE, 'Korisnik', '--'
    FROM departments;

-- Zadatak 3
ALTER TABLE mt
MODIFY (naziv VARCHAR2(30));

ALTER TABLE mt
ADD (location_id NUMBER,
     manager_id NUMBER);

UPDATE mt m
SET (naziv, location_id, manager_id) = (SELECT d.department_name, d.location_id, d.manager_id
                                        FROM departments d
                                        WHERE d.department_id = m.id);

-- Zadatak 4
CREATE TABLE zap (id NUMBER(4) CONSTRAINT c_zap_id_nn NOT NULL,
                  sifra_zaposlenog VARCHAR2(5) CONSTRAINT c_zap_sifrazap_nn NOT NULL,
                  naziv_zaposlenog CHAR(50),
                  godina_zaposlenja NUMBER(4) CONSTRAINT c_zap_god_nn NOT NULL,
                  mjesec_zaposlenja CHAR(2) CONSTRAINT c_zap_mjesec_nn NOT NULL,
                  sifra_odjela VARCHAR2(5),
                  naziv_odjela VARCHAR2(15) CONSTRAINT c_zap_nazivodjela_nn NOT NULL,
                  grad CHAR(10) CONSTRAINT c_zap_grad_nn NOT NULL,
                  sifra_posla VARCHAR(25),
                  naziv_posla CHAR(50) NOT NULL,
                  iznos_dodatak_na_platu NUMBER(5),
                  plata NUMBER(6) CONSTRAINT c_zap_plata_nn NOT NULL,
                  kontinent VARCHAR2(20),
                  datum_unosa DATE CONSTRAINT c_zap_datum_nn NOT NULL,
                  korisnik_unio CHAR(20) CONSTRAINT  c_zap_kor NOT NULL);

-- Zadatak 5
INSERT INTO zap
               SELECT e.employee_id, SubStr(e.last_name || e.first_name, 1, 5), e.first_name || ' ' || e.last_name,
                      To_Char(e.hire_date, 'YYYY'), To_Char(e.hire_date, 'MM'), e.department_id, Nvl(SubStr(d.department_name, 1, 15), ' '), SubStr(l.city, 1, 10),
                      e.job_id, j.job_title, Nvl(e.salary*e.commission_pct, 0), e.salary, SubStr(r.region_name, 1, 20), SYSDATE, USER
               FROM employees e, jobs j, departments d, locations l, countries c, regions r
               WHERE e.job_id = j.job_id AND e.department_id = d.department_id AND d.location_id = l.location_id AND
                     l.country_id = c.country_id AND c.region_id = r.region_id;

-- Zadatak 6
CREATE TABLE zaposleni2 AS SELECT * FROM zap;

-- Zadatak 7
ALTER TABLE zaposleni2
DROP (sifra_zaposlenog, sifra_odjela, sifra_posla);

ALTER TABLE zaposleni2
RENAME COLUMN naziv_zaposlenog TO zaposleni;
ALTER TABLE zaposleni2
RENAME COLUMN naziv_odjela TO odjel;
ALTER TABLE zaposleni2
RENAME COLUMN naziv_posla TO posao;

-- Zadatak 8
RENAME zaposleni2 TO zap_backup;

-- Zadatak 9
COMMENT ON TABLE mt IS 'Tabela odjela';
COMMENT ON TABLE zap IS 'Tabela zaposlenih';

-- Zadatak 10
COMMENT ON COLUMN mt.opis IS 'Opis odjela u organizaciji';
COMMENT ON COLUMN mt.location_id IS 'Sifra lokacije na kojoj se odjel nalazi';

COMMENT ON COLUMN zap.korisnik_unio IS 'Korisnik koji je unio dati red u tabelu';
COMMENT ON COLUMN zap.sifra_zaposlenog IS 'Prezime i ime skraceno na 5 znakova';

-- Zadatak 11
ALTER TABLE zap_backup
SET UNUSED (datum_unosa, korisnik_unio);

-- Zadatak 12
SELECT * FROM user_tab_comments;
SELECT * FROM user_col_comments;

-- Zadatak 13
ALTER TABLE zap_backup
DROP UNUSED COLUMNS;

