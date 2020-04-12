/*1*/
UPDATE  Stavka_promjene
SET cijena = (SELECT  Avg(s.cijena)
                FROM izlaz i,stavka s
                WHERE s.izlaz = i.izlaz
               ), datum_promjene=(SELECT Max(p.datum_promjene)
                                  FROM poreska_stopa_promjene p, materijal m , poreska_stopa_p2,
                                  WHERE materijal = m.materijal AND m.poreska_stopa = p2.poreska_stopa AND p.poreska_stopa=p2.poreska_stopa);

/*2*/
SELECT m.naziv, l.naziv, Sum(Nvl(s.cijena,0)*Nvl(s.kolicina,0))
FROM materijal m, firma f, stavka s, lice l, poreska_stopa_promjene psp, poreska_stopa ps
WHERE s.materijal=m.materijal AND f.firma=l.lice AND m.materijalUnio=l.lice AND psp.poreskaStopa=ps.poreskaStopa AND ps.poreskaStopa=m.poreskaStopa AND Months_Between(SYSDATE,psp.datumPromjene)/12<3
GROUP BY ROLLUP (m.naziv,l.naziv);

/*3*/
CREATE OR REPLACE FUNCTION  fija (naziv_kupa IN VARCHAR(50))
RETURN VARCHAR IS

CREATE CURSOR kursor1 IS
SELECT Count(l.naziv)
FROM lice l
where l.naziv = naziv_kupca;

CREATE CURSOR kursor2 IS
SELECT DISTINCT Count(l.naziv)
FROM materijal m, izlaz i, lice l, stavka s
where l.naziv = naziv_kupca AND l.lice = i.kupac AND i.izlaz = s.izlaz AND s.materijal = m.materijal and  Months_Between(SYSDATE, m.datumNabavke)/12 < 3;

varijabla1 INTEGER;
varijabla2 INTEGER;

BEGIN

OPEN kursor1;
FETCH kursor1 INTO varijbala1;
CLOSE kursor1

IF varijbala1 = 1 THEN

OPEN kursor2;
FETCH kursor2 INTO varijbla2;
CLOSE kursor2;

RETURN naziv_kupca || To_Char(varijbla2);

ELSIF varijabla >=2 THEN

RETURN (SELECT m.naziv
        FROM lice l, materijal m,stavka s, izlaz i
        WHERE naziv_kupca = l.naziv AND  s.materijal = m.materijal AND i.kupac = l.lice AND s.materijal = m.materijal AND Length(m.naziv) = (
                                                                                                                                              SELECT Max(Length(m2.naziv))
                                                                                                                                              FROM  materijal m2
                                                                                                                                              WHERE /*sve kao u tabeli gore*/);

END;
\



