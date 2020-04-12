/*upit1, kategorija 1*/
SELECT pl.ime_pravnog
FROM pravno_lice pl
WHERE  pl.adresa_pravnog IN (SELECT  fl.adresa
                             FROM fizicko_lice fl);

/*upit2, kategorija 1*/
SELECT uz.datum_zaposlenja_uposlenog
FROM ugovor_zaposlenika uz
WHERE  uz.datum_zaposlenja_uposlenog > (SELECT Min(r.datum_kupoprodaje)
                                        FROM racun r, povezna_proizvod_racun ppr, proizvod p
                                        WHERE r.racun_id = ppr.racun_id AND ppr.proizvod_id = p.proizvod_id AND p.garancija_id IS NOT NULL);

/*upit1, kategorija2*/
SELECT p.naziv_proizvoda
FROM proizvod p, povezna_proizvod_kategorija ppk, kategorija k
WHERE p.proizvod_id = ppk.proizvod_id AND ppk.kategorija_id = k.kategorija_id
      AND k.kategorija_id = (SELECT k2.kategorija_id
                             FROM proizvod p2, povezna_proizvod_skladiste pps2, povezna_proizvod_kategorija ppk2, kategorija k2
                             WHERE  p2.proizvod_id = pps2.proizvod_id AND p2.proizvod_id = ppk2.proizvod_id AND ppk2.kategorija_id = k2.kategorija_id
                                    AND pps2.kolicina =(SELECT max(pps3.kolicina)
                                                       FROM povezna_proizvod_skladiste pps3)
                             );

/*upit2, kategorija2*/
/*SELECT sef.uposlenik_id
FROM uposlenik sef, uposlenik upos, grad g
WHERE upos.sef_id = sef.uposlenik_id AND g.grad_id = sef.grad_id
        AND g.grad_id = (SELECT grad_id
                         FROM
                         WHERE       */

/*upit3, kategroija2*/
/*SELECT s.naziv_skladista
FROM  skladiste s
WHERE  s.*/

/*upit 1, kategorija 3*/
SELECT p.naziv_proizvoda
FROM proizvod p
WHERE p.proizvodjac_id  IN (SELECT pro2.proizvodjac_id
                            FROM proizvodjac pro2, proizvod p2
                            WHERE pro2.proizvodjac_id = p2.proizvodjac_id AND p2.cijena >ALL (SELECT Avg(p3.cijena)
                                                                                              FROM  proizvod p3)
                                                                                              );


/*upit 2, kategorija3*/
SELECT p.naziv_proizvoda, k.naziv_kategorije, nadk.naziv_kategorije
FROM proizvod p, povezna_proizvod_kategorija ppk, kategorija k, kategorija nadk, povezna_proizvod_skladiste pps
WHERE p.proizvod_id = ppk.proizvod_id AND ppk.kategorija_id = k.kategorija_id AND k.nadkategorija_id IS NOT NULL AND k.nadkategorija_id = nadk.kategorija_id
      AND pps.proizvod_id = p.proizvod_id AND ( pps.kolicina =0 OR pps.kolicina = (SELECT Avg(pps2.kolicina)
                                                                                   FROM povezna_proizvod_skladiste pps2)
                                                                                   );

/*upit 3, kagorija 3*/
SELECT fl.ime, o.ime_odjela, Avg(u.plata)
FROM uposlenik u, fizicko_lice fl, odjel o
WHERE u.fizicko_lice_id = fl.fizicko_lice_id AND u.odjel_id = o.odjel_id
GROUP BY fl.ime, o.ime_odjela;


/*upit 4, kategorija 3*/
SELECT ks.kurirska_sluzba_id
FROM kurirska_sluzba ks,isporuka i, racun r, povezna_proizvod_racun ppr
WHERE ks.kurirska_sluzba_id = i.kurirska_sluzba_id AND i.isporuka_id = r.isporuka_id AND r.racun_id = ppr.racun_id
      AND ppr.iznos_popusta IS NOT null AND ppr.kolicina = (SELECT Max(ppr2.kolicina)
                                                            FROM kurirska_sluzba ks2,isporuka i2, racun r2,povezna_proizvod_racun ppr2
                                                            WHERE ks2.kurirska_sluzba_id = i2.kurirska_sluzba_id AND i2.isporuka_id = r2.isporuka_id AND r2.racun_id = ppr2.racun_id
                                                                  AND ppr2.iznos_popusta IS NOT null);

/*upit 5, kategorija 3*/
SELECT fl.ime || ' ' || fl.prezime AS "puno ime"
FROM kupac k, racun r, fizicko_lice fl
WHERE  fl.fizicko_lice_id = k.fizicko_lice_id AND r.kupac_id = k.kupac_id
       AND iznos_racuna > (SELECT Avg(r2.iznos_racuna)
                           FROM kupac k2, racun r2
                           WHERE k2.kupac_id = r2.kupac_id AND k2.kupac_id <>k.kupac_id);


/*upit 1, kategorija 4 PROVJERI KAKO NE RADI*/
/*SELECT fl.ime || ' ' || fl.prezime AS "kupac", (SELECT Sum(p2.cijena * ppr2.iznos_popusta)
                                                FROM  proizvod p2, povezna_proizvod_racun ppr2, kupac k2, racun r2
                                                WHERE ppr2.iznos_popusta IS NOT NULL AND k2.kupac_id = r2.kupac_id AND r2.racun_id = ppr2.racun_id
                                                      AND ppr2.proizvod_id = p2.proizvod_id AND k2.kupac_id = k.kupac_id ) AS "Usteda"
FROM kupac k, racun r, fizicko_lice fl
WHERE fl.fizicko_lice_id = k.fizicko_lice_id AND k.kupac_id = r.kupac_id;*/


/*upit 2, kategorija 4*/
/*SELECT pr.naziv_proizvoda, pr.cijena
FROM proizvod pr, povezna_proizvod_racun ppr, popust po, garancija g
WHERE pr.popust_id = po.popust_id AND pr.proizvod_id = ppr.proizvod_id AND g.garancija_id = pr.garancija_id AND  ppr.iznos_popusta = po.iznos_popusta
      AND Nvl(g.mjeseci_garancije, 0) = Nvl(ppr.iznos_garancije, 0);*/

/*upit 3, kategorija 4, provjeri zasto*/
/*SELECT fl.ime AS naziv
FROM uposlenik u, ugovor_zaposlenika uz, fizicko_lice fl, odjel o
WHERE u.uposlenik_id = uz.uposlenik_id AND fl.fizicko_lice_id = u.fizicko_lice_id
      AND o.odjel_id = u.odjel_id AND Add_Months(uz.datum_zaposlenja_uposlenog, 6) <ANY (SELECT uz2.datum_zaposlenja_uposlenog
                                                                                         FROM uposlenik u2, uposlenik u3, ugovor_zaposlenika uz2, odjel o2
                                                                                         WHERE  u2.uposlenik_id<>u3.sef_id AND u2.uposlenik_id = uz2.uposlenik_id
                                                                                                AND u2.uposlenik_id<>u.uposlenik_id AND o2.odjel_id = o.odjel_id
                                                                                                AND u3.odjel_id = o2.odjel_id AND u3.odjel_id = o.odjel_id);*/


/*upit 4, kategorija 4*/
SELECT Count(i.datum_isporuke), pl.ime_pravnog
FROM kurirska_sluzba ks, isporuka i, pravno_lice pl
WHERE ks.kurirska_sluzba_id = i.kurirska_sluzba_id AND pl.pravno_lice_id = ks.pravno_lice_id AND months_between(SYSDATE, i.datum_isporuke) BETWEEN 0 AND 12 AND ROWNUM<=10
      AND i.datum_isporuke IS NOT NULL
GROUP BY pl.ime_pravnog
ORDER BY pl.ime_pravnog ASC;


/*upit 1, kategorija 5*/
SELECT fl.ime, (SELECT Sum(iznos_racuna)
                 FROM kupac k2, racun r2
                 WHERE k2.kupac_id = k.kupac_id AND k2.kupac_id = r2.kupac_id) AS "lifetime value"
FROM kupac k, racun r, povezna_proizvod_racun ppr, fizicko_lice fl
WHERE k.kupac_id = r.kupac_id AND r.racun_id = ppr.racun_id AND fl.fizicko_lice_id = k.fizicko_lice_id AND (ppr.iznos_popusta IS NULL OR ppr.iznos_popusta = 0);

/*upit 2, kategorija 5*/
/*SELECT p.naziv_proizvoda
FROM proizvod p, povezna_proizvod_kategorija ppk, kategorija k
WHERE p.proizvod_id = ppk.proizvod_id AND ppk.kategorija_id = k.kategorija_id AND p.cijena >    (SELECT avg( Max(p2.cijena))
                                                                                                 FROM proizvod p2, povezna_proizvod_kategorija ppk2, kategorija k2
                                                                                                 WHERE  p2.proizvod_id = ppk2.proizvod_id AND ppk2.kategorija_id = k2.kategorija_id
                                                                                                        AND k.kategorija_id = k2.kategorija_id
                                                                                                 GROUP BY p2.proizvod_id);*/
/*upit 3, kategorija 5*/
/*SELECT pl.ime_pravnog
FROM kurirska_sluzba ks, pravno_lice pl, grad g
WHERE ks.pravno_lice_id = pl.pravno_lice_id AND g.grad_id = pl.grad_id AND 1 >=ANY (SELECT Count(datum_isporuke)
                                                                                    FROM kurirska_sluzba ks2, pravno_lice pl2, grad g2, isporuka i2, racun r2, povezna_proizvod_racun ppr2
                                                                                    WHERE ks2.kurirska_sluzba_id = i2.kurirska_sluzba_id AND i2.isporuka_id = r2.isporuka_id AND
                                                                                          pl2.pravno_lice_id = ks2.pravno_lice_id AND pl2.grad_id = g2.grad_id
                                                                                          AND i2.datum_isporuke IS NOT NULL AND ppr2.racun_id = r2.racun_id
                                                                                          AND g2.grad_id<>g.grad_id AND 3>=(SELECT Count(ppr3.proizvod_id)
                                                                                                                            FROM povezna_proizvod_racun ppr3, racun r3
                                                                                                                            WHERE ppr3.racun_id = r3.racun_id
                                                                                                                                  AND r3.racun_id = r2.racun_id)
                                                                                          AND Months_Between(SYSDATE, i2.datum_isporuke) <= 12
                                                                                                                                  );*/


