SELECT * FROM kontinent;
SELECT * FROM drzava;
SELECT * FROM grad;
SELECT * FROM skladiste;
SELECT * FROM uposlenik;
SELECT * FROM fizicko_lice;
SELECT * FROM kupac;
SELECT * FROM odjel;
SELECT * FROM ugovor_zaposlenika;
SELECT * FROM racun;
SELECT * FROM pravno_lice;
SELECT * FROM kurirska_sluzba;
SELECT * FROM proizvodjac;
SELECT * FROM ugovor_pravnih;
SELECT * FROM povezna_proizvod_racun;
SELECT * FROM proizvod;
SELECT * FROM povezna_proizvod_skladiste;
SELECT * FROM popust;
SELECT * FROM garancija;
SELECT * FROM povezna_proizvod_kategorija;
SELECT * FROM kategorija;

/*Kategorija1*/
/*upit 1*/
SELECT d.ime_drzave, p.naziv_proizvoda, Sum(sp.kolicina)
FROM drzava d, grad g, skladiste s, povezna_proizvod_skladiste sp, proizvod p
WHERE  g.drzava_id=d.drzava_id AND s.grad_id=g.grad_id AND sp.skladiste_id=s.skladiste_id AND sp.proizvod_id=p.proizvod_id
GROUP BY  d.ime_drzave, p.naziv_proizvoda;

/*upit 2*/
Select pl.ime_pravnog AS "ime"
FROM pravno_lice pl, ugovor_pravnih up
WHERE pl.pravno_lice_id=up.pravno_lice_id AND up.datum_potpisivanja > To_Date('01.01.2016', 'dd.mm.yyyy');

/*upit 3*/
/*SELECT d.ime_drzave, s.odgovorna_osoba
FROM kontinent k, drzava d, grad g, skladiste s, uposlenik u
WHERE d.kontinent_id=k.kontinent_id AND g.drzava_id=d.drzava_id AND s.grad_id=g.grad_id AND u.uposlenik_id=s.odgovorna_osoba
GROUP BY d.ime_drzave, s.odgovorna_osoba
Having  u.plata = Max(u.plata);*/

/*Kategorija 2*/
/*upit 1*/
SELECT pr.naziv_proizvoda
FROM proizvod pr, garancija g
WHERE pr.garancija_id= g.garancija_id AND pr.popust_id IS NOT null AND pr.garancija_id=g.garancija_id AND g.mjeseci_garancije=24;


/*upit 2*/
SELECT p.naziv_proizvoda, p.cijena, p.cijena - p.cijena*po.iznos_popusta AS "cijena sa popustaom", po.iznos_popusta, s.naziv_skladista
FROM proizvod p, popust po, skladiste s, povezna_proizvod_skladiste pps
WHERE p.proizvod_id=pps.proizvod_id AND pps.skladiste_id=s.skladiste_id AND po.popust_id=p.popust_id AND ROWNUM<=10
ORDER BY po.iznos_popusta desc;

/*upit 3*/
SELECT pr.naziv_proizvoda, po.iznos_popusta*0.95
FROM proizvod pr, popust po
WHERE pr.popust_id=po.popust_id AND po.iznos_popusta>0.2;

/*upit 4*/ zasto ne valja?????????????
/*SELECT Count(ppr.kolicina) "broj prodatih", Sum(pr.cijena)-sum(pr.cijena)*ppr.iznos_popusta AS "ukupan prihod"
FROM drzava d, grad g, skladiste s, povezna_proizvod_skladiste pps, proizvod pr, povezna_proizvod_racun ppr, racun r
WHERE d.drzava_id=g.drzava_id AND g.grad_id=s.grad_id AND s.skladiste_id=pps.skladiste_id AND pps.proizvod_id=pr.proizvod_id
      AND pr.proizvod_id=ppr.proizvod_id AND ppr.racun_id=r.racun_id AND
      (r.datum_kupoprodaje BETWEEN To_Date('01.01.2018', 'dd.mm.yyyy')AND To_Date('01.06.2018', 'dd.mm.yyyy'));*/

/*upit 5*/ kako ?????????????
/*SELECT fl.ime || ' ' || fl.prezime, r.iznos_racuna
FROM kupac k, fizicko_lice fl, uposlenik u, racun r
WHERE fl.fizicko_lice_id = u.fizicko_lice_id AND fl.fizicko_lice_id = k.fizicko_lice_id AND k.kupac_id=r.kupac_id
      AND r.iznos_racuna > OD SVIH OSTALIH*/

/*upit 6*/
/*ELECT g.ime_grada
FROM grad g, pravno_lice pl
WHERE g.grad_id=pl.grad_id and*/

/*upit 7*/ ????da li je tacno
/*SELECT Min( Avg(u.plata) )
FROM drzava d, grad g, skladiste s, uposlenik u
WHERE  d.drzava_id=g.drzava_id AND s.grad_id=g.grad_id AND s.odgovorna_osoba=u.uposlenik_id
GROUP BY d.ime_drzave;*/

/*upit 8*/
/*SELECT fl.ime || ' ' || fl.prezime, o.ime_odjela
FROM  kupac k, uposlenik u, fizicko_lice fl, odjel o, ugovor_zaposlenika uz
where uz.uposlenik_id=u.uposlenik_id AND o.odjel_id=u.odjel_id AND u.fizicko_lice_id=fl.fizicko_lice_id AND fl.fizicko_lice_id=k.fizicko_lice_id
      AND uz.datum_raskidanja_ugovora < sysdate; */

/*Kategorija 3*/
/*upit 1*/
SELECT p.naziv_proizvoda, p.cijena, Nvl(po.iznos_popusta, 0)*100 AS "iznos popusta od 100 posto"
FROM proizvod p
Left JOIN popust po ON po.popust_id=p.popust_id;

/*upit 2*/
SELECT k.naziv_kategorije, Decode(k2.kategorija_id,
                                  NULL, 'nema kategorije',
                                  k2.naziv_kategorije) nadkategorija
FROM  kategorija k left JOIN kategorija k2
on k.nadkategorija_id=k2.kategorija_id;

/*Kategorija 4*/
/*upit 1*/
SELECT fl.ime, fl.adresa
FROM  fizicko_lice fl
UNION
SELECT pl.ime_pravnog, pl.adresa_pravnog
FROM pravno_lice pl;

/*upit 2*/
SELECT pl.ime_pravnog, Round(SYSDATE - up.datum_potpisivanja) AS "saranja u danima",                        /*vraca razliku u danima*/
                       Round(Months_Between(SYSDATE, up.datum_potpisivanja))  AS "saradnja u mjesecima",
                       Round(Months_Between(SYSDATE, up.datum_potpisivanja)/12)  AS "saradnja u godinama"
FROM pravno_lice pl, ugovor_pravnih up
WHERE pl.pravno_lice_id = up.pravno_lice_id;

/*upit 3*/    /*decode automatki poredi na osnovu jednoakosti, pa se ne moze pisati "Like" ispred moguceg naziva odjela,
                 nego ce se poredjenje izvrsiti na osnovu jendakosti*/
SELECT fl.ime, fl.prezime, Decode(o.ime_odjela,
                                   'Menadzment', 'Menadzer',
                                   'Odjel za skladiste', 'Skladistar',
                                   'Odjel za servis proizvoda', 'Serviser',
                                   'Uposlenik') AS titula
FROM uposlenik u, fizicko_lice fl, odjel o
Where u.fizicko_lice_id=fl.fizicko_lice_id AND u.odjel_id=o.odjel_id;


/*Kategorija 5*/
/*upit 1*/
SELECT naziv_proizvoda
FROM(
      SELECT pr.naziv_proizvoda, pd.proizvodjac_id, Sum(ppr.kolicina) AS suma
      FROM  proizvod pr, kategorija k, povezna_proizvod_racun ppr, povezna_proizvod_kategorija ppk, proizvodjac pd
      WHERE  pr.proizvod_id=ppk.proizvod_id AND ppk.kategorija_id=k.kategorija_id AND pr.proizvod_id=ppr.proizvod_id
            AND pd.proizvodjac_id=pr.proizvodjac_id AND k.nadkategorija_id IS NULL AND ROWNUM<=10
      GROUP BY pr.naziv_proizvoda, pd.proizvodjac_id
      ORDER BY suma);

/*upit 2*/
SELECT k.naziv_kategorije, Max(pr.cijena) najskuplji, Min(pr.cijena) najjeftiniji
FROM kategorija k, proizvod pr, povezna_proizvod_kategorija ppk
WHERE k.kategorija_id=ppk.kategorija_id AND pr.proizvod_id=ppk.proizvod_id
GROUP BY k.naziv_kategorije
ORDER BY k.naziv_kategorije, najjeftiniji+najskuplji ASC;

/*upit 3*/
/*SELECT fl.ime, pr.naziv_proizvoda
FROM kupac k, proizvod pr, povezna_proizvod_racun ppr, racun r, fizicko_lice fl
WHERE k.kupac_id=r.kupac_id AND r.racun_id=ppr.racun_id AND pr.proizvod_id=ppr.proizvod_id AND fl.fizicko_lice_id=k.fizicko_lice_id AND ROWNUM<=10
order by r.iznos_racuna ASC;*/

/*upit 4*/
/*SELECT o.ime_odjela
FROM odjel o, uposlenik u, fizicko_lice fl, kupac k, racun r
WHERE o.odjel_id=u.odjel_id AND u.fizicko_lice_id=fl.fizicko_lice_id AND k.fizicko_lice_id=fl.fizicko_lice_id AND k.kupac_id=r.kupac_id
GROUP BY o.ime_odjela
ORDER BY  Sum(r.iznos_racuna) DESC;*/

