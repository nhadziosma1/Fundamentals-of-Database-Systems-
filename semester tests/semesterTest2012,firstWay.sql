--rok 2012
--3.
SELECT p.naziv_proizvodjaca, v.naziv, COUNT(f.uredjaj), SUM(v.cijena)  --cijna je promijenjena i ide u fiskalni uredjaj
FROM PROIZVODJAC p, VRSTA_FISKALNOG_UREDJAJA v, FISKALNI_UREDJAJ f
WHERE v.sifra = f.vrsta_uredjaja(+) AND v.proizvodjac(+) = p.sifra     --(+) ide nad onim koje mogu imati null vrijednosti, nad sifrom ne moze plus jer je to primarni kljuc i ne moze biti null
GROUP BY ROLL UP(v.naziv,p.naziv_proizvodjaca)
--ROLL UP kreira jos jedan red u kojem ce biti prikazane sume (moraju biti one vrijednosti koje nisu sa agregatnom funkcijom)

--4.
--index
CREATE INDEX serviser_prezime_ime_idx
ON Serviser (UPPER(prezime || ' ' || ime));

CREATE ROLE fizika;                            --uloga

GRANT ALL PRIVELEGES TO fizika;
ON **                                            --na sve u bazi (moze ON naziv_sheme * vrijedi samo za tabele te sheme)

CREATE USER 'Tazman'
IDENTIFIED BY 'Lozinka';

GRANT ALL PRIVELAGES TO Tazman;                   --ili moze samo fizika umjesto ALL PRIVELAGES, istoo

--5.
CREATE OR REPLACE PROCEDURE p (sifra INTEGER) --ako nemamo tip mozemo staviti TYPE %naziv
BEGIN
UPDATE Proizvodjaci SET Status = (SELECT *
                                  FROM (SELECT Status
                                        FROM Fiskalizacija
                                        WHERE fiskalni_uredjaj = sifra
                                        ORDER BY datum_fiskalizacije DESC)
                                  WHERE ROWNUM = 1);
END

--6.
CREATE OR REPLACE FUNTION f (prezime_ime VARCHAR)
RETURN VARCHAR
IS
CURSOR kursor IS (SELECT COUNT(*) --treba nam count da vidimo da li ih uopste ima
                  FROM INSPEKTOR
                  WHERE naziv = prezime_ime)

CURSOR kursor2 IS(SELECT MONTHS_BETWEEN NVL(datum_prestanka,SYSDATE)- datum_zaposlenja)/12 "broj godina",MOD(NVL(datum_prestanka,SYSDATE)-datum_zaposlenja,12) "mjeseci staza"
                  FROM INSPEKTOR
                  WHERE naziv = prezime_ime)

VAR1 INTEGER;
VAR2 INTEGER;

BEGIN
  OPEN kursor;
  FETCH kursor INTO VAR1;
  CLOSE kursor;

IF VAR1 = 0
  RETURN 'Nema zaposlenika';
  END IF;
ELSE IF VAR1 = 1
  OPEN kursor2;
  FETCH kursor2 INTO VAR1, VAR2;        --kursor2 vraca dvije kolone, pa one bivaju spasene u dva kursora
  CLOSE kursor2;

  RETURN godine || ' ' || To_Char(VAR1) || ' ,mjesec' || To_Char(VAR2);
  END IF;

RETURN 'Ima vise zaposlenika';
END