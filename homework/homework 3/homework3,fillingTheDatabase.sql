insert into kontinent (kontinent_id, ime_kontinenta) values (1, 'Azija');
insert into kontinent (kontinent_id, ime_kontinenta) values (2, 'Europa');
insert into kontinent (kontinent_id, ime_kontinenta) values (3, 'Afrika');
insert into kontinent (kontinent_id, ime_kontinenta) values (4, 'Sjeverna Amerika');
insert into kontinent (kontinent_id, ime_kontinenta) values (5, 'Juzna Amerika');
insert into kontinent (kontinent_id, ime_kontinenta) values (6, 'Antartik');
insert into kontinent (kontinent_id, ime_kontinenta) values (7, 'Australia');

insert into drzava (drzava_id, ime_drzave, kontinent_id) values (1, 'Indonesia', 1);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (2, 'Panama', 4);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (3, 'Norway', 2);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (4, 'Bosna i Hercegovina', 2);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (5, 'China', 1);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (6, 'England', 2);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (7, 'Urugvaj', 5);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (8, 'Kenya', 3);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (9, 'Australia', 7);
insert into drzava (drzava_id, ime_drzave, kontinent_id) values (10, 'Argentina', 5);

insert into grad (grad_id, ime_grada, drzava_id) values (1, 'Stavanger', 3);
insert into grad (grad_id, ime_grada, drzava_id) values (2, 'Sarajevo', 4);
insert into grad (grad_id, ime_grada, drzava_id) values (3, 'Manchester', 6);
insert into grad (grad_id, ime_grada, drzava_id) values (4, 'David', 2);
insert into grad (grad_id, ime_grada, drzava_id) values (5, 'Montevideo', 7);
insert into grad (grad_id, ime_grada, drzava_id) values (6, 'Mombasa', 8);
insert into grad (grad_id, ime_grada, drzava_id) values (7, 'Sangaj', 5);
insert into grad (grad_id, ime_grada, drzava_id) values (8, 'Melburn', 9);
insert into grad (grad_id, ime_grada, drzava_id) values (9, 'Foca', 4);
insert into grad (grad_id, ime_grada, drzava_id) values (10, 'Buenos Aires', 10);

insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (1, 'Josephine', 'Chrisp', '1 Kosevo', 1);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (2, 'Naéva', 'Pentecost', '827 Charing Cross Alley', 5);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (3, 'Sejo', 'Sexon', '20 Amoth Terrace', 2);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (4, 'Lois', 'Kibbey', '321 Nelson Place', 10);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (5, 'Hamo', 'Terzic', '52 Put Heroja', 9);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (6, 'Yenora', 'Kyne', '30 Anniversary Way', 6);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (7, 'Wayne', 'Rooney', 'Sir Mat Busby Way', 3);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (8, 'Oceane', 'Rummings', '73 Reinke Pass', 4);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (9, 'Interessant', 'Sherland', '50 Forest Dale Plaza', 8);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (10, 'Reserves', 'Sayes', '3 Sloan Crossing', 7);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (11, 'Simplifiés', 'Hammill', '080 Texas Hill', 1);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (12, 'Maëlyss', 'Havenhand', '19 Kipling Street', 5);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (13, 'Zifo', 'Zific', '14 Kedzije', 2);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (14, 'Eloise', 'Fryett', '55 Fuller Street', 10);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (15, 'Anaëlle', 'Sherewood', '3 Jana Center', 9);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (16, 'Célestine', 'Allin', '5 Eggendart Lane', 6);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (17, 'Nélie', 'Maestrini', '75 Longview Lane', 3);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (18, 'Andrej', 'Lipa', '887 Schmedeman Way', 4);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (19, 'Mai', 'Uccello', '43 Fulton Court', 8);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (20, 'Adele', 'Playhill', '19 Sheridan Lane', 7);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (21, 'Sejo', 'Sexon', '1 Kosevo', 3);
insert into fizicko_lice (fizicko_lice_id, ime, prezime, adresa, grad_id) values (22, 'Mehmed', 'Kekic', '3 Kuloviceva', 3);

ALTER TABLE uposlenik
DROP COLUMN odjel_id;

/*insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (11, 1, 10, 1);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (12, 2, 9, 2);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (13, 3, 8, 3);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (14, 4, 7, 4);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (15, 5, 6, 5);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (16, 6, 5, 6);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (17, 7, 4, 7);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (18, 8, 3, 8);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (19, 9, 2, 9);
insert into uposlenik (fizicko_lice_id, uposlenik_id, odjel_id, sef_id) values (20, 10, 1, 10);*/

insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (11, 1, 1, 870);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (12, 2, 1, 900);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (13, 3, 1, 2500);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (14, 4, 1, 500);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (15, 5, 2, 550);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (16, 6, NULL, 5000);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (17, 7, 3, 700);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (18, 8, 3, 909);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (19, 9, NULL, 5000);
insert into uposlenik (fizicko_lice_id, uposlenik_id, sef_id, plata) values (20, 10, 4, 400);


insert into odjel (odjel_id, ime_odjela, sef_id) values (1, 'Menadzment', 1);
insert into odjel (odjel_id, ime_odjela, sef_id) values (2, 'Odjel za skladiste', 2);
insert into odjel (odjel_id, ime_odjela, sef_id) values (3, 'Odjel za servis proizvoda', 3);
insert into odjel (odjel_id, ime_odjela, sef_id) values (4, 'Odjel za pakovanje proizvoda', 4);
insert into odjel (odjel_id, ime_odjela, sef_id) values (5, 'Odjel za transport', 5);
insert into odjel (odjel_id, ime_odjela, sef_id) values (6, 'PR odjel', 6);
insert into odjel (odjel_id, ime_odjela, sef_id) values (7, 'Sedmi', 7);
insert into odjel (odjel_id, ime_odjela, sef_id) values (8, 'Osmi', 8);
insert into odjel (odjel_id, ime_odjela, sef_id) values (9, 'Deveti', 9);
insert into odjel (odjel_id, ime_odjela, sef_id) values (10, 'Deseti', 10);

ALTER TABLE uposlenik
ADD (odjel_id INTEGER REFERENCES odjel(odjel_id));

UPDATE uposlenik SET odjel_id = 1 WHERE uposlenik_id = 1;
UPDATE uposlenik SET odjel_id = 2 WHERE uposlenik_id = 2;
UPDATE uposlenik SET odjel_id = 3 WHERE uposlenik_id = 3;
UPDATE uposlenik SET odjel_id = 4 WHERE uposlenik_id = 4;
UPDATE uposlenik SET odjel_id = 5 WHERE uposlenik_id = 5;
UPDATE uposlenik SET odjel_id = 6 WHERE uposlenik_id = 6;
UPDATE uposlenik SET odjel_id = 7 WHERE uposlenik_id = 7;
UPDATE uposlenik SET odjel_id = 8 WHERE uposlenik_id = 8;
UPDATE uposlenik SET odjel_id = 9 WHERE uposlenik_id = 9;
UPDATE uposlenik SET odjel_id = 10 WHERE uposlenik_id = 10;

ALTER TABLE uposlenik
MODIFY (odjel_id INTEGER NOT NULL);

insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (1, DATE'2002-5-25',  DATE'2022-5-25', 5);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (2, DATE'2003-4-25', date'2011-02-05', 4);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (3, DATE'2011-10-10', DATE'2017-11-12', 3);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (4, DATE'2005-07-12', DATE'2008-07-11', 2);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (5, DATE'2008-03-11', DATE'2009-11-05', 1);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (6, DATE'2006-04-08', DATE'2008-12-08', 10);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (7, DATE'2004-05-04', DATE'2015-08-08', 8);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (8, DATE'2010-06-04', DATE'2012-09-07', 8);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (9, DATE'2016-07-08', DATE'2020-12-29', 7);
insert into ugovor_zaposlenika (ugovor_zaposlenika_id, datum_zaposlenja_uposlenog, datum_raskidanja_ugovora, uposlenik_id) values (10, DATE'2009-05-03', DATE'2020-11-08', 6);

insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (1, 1, 1, 'prvo', ' Chinook Trail');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (2, 2, 2, 'drugo', 'Dakota Plaza');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (3, 3, 3, 'trece', '7 Transport Avenue');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (4, 4, 4, 'cetvrto', '89480 Ludington Alley');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (5, 5, 5, 'peto', '87989 Utah Lane');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (6, 6, 6, 'sesto', '714 Heath Park');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (7, 7, 7, 'sedmo', '3326 Upham Alley');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (8, 8, 8, 'osmo', '85 Ruskin Drive');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (9, 9, 9, 'deveto', '1 Troy Place');
insert into skladiste (skladiste_id, odgovorna_osoba, grad_id, naziv_skladista, adresa_skladista) values (10, 10, 10, 'deseto', '524 Logan Way');

insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (1, '1 Kosevo', 1, 1, 'Lind-King');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (2, '751 Helena Hill', 2, 2, 'Smitham i Sons');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (3, '6628 Ridgeview Circle', 3, 3, 'Koepp, Nienow i Gusikowski');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (4, '261 Fairfield Circle', 4, 4, 'O''Connell i Sons');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (5, '09813 Carberry Point', 5, 5, 'Pfeffer Groupa');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (6, '55 Vermont Point', 6, 6, 'Smitham i Sons');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (7, '0317 Lindbergh Terrace', 7, 7, 'Gorczany Streich i Thompson');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (8, '0070 Dwight Alley', 8, 8, 'Spinka-Brakus');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (9, '31451 Cody Circle', 9, 9, 'Howell-Hoeger');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (10, '1433 Trailsway Lane', 10, 10, 'Hilpert-Sanford');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (11, '617 Banding Lane', 11, 1, 'Harber Pouros i Lockman');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (12, '706 Red Cloud Alley', 12, 2, 'Kilback Collier i Haley');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (13, '96 Del Mar Trail', 13, 3, 'Hodkiewicz Cummerata i Feest');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (14, '09 Novick Road', 14, 4, 'Johns-Heathcote');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (15, '3890 Trailsway Plaza', 15, 5, 'Wisoky-Haag');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (16, '2431 Lotheville Pass', 16, 6, 'Sanford LLC');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (17, '8606 Melby Alley', 17, 7, 'Harber i Sons');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (18, '684 Kipling Crossing', 18, 8, 'Spinka, Walter i Windler');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (19, '27 Quincy Road', 19, 9, 'Schneider-Lind');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (20, '9960 Anthes Parkway', 20, 10, 'Hamill-Eichmann');
insert into pravno_lice (pravno_lice_id, adresa_pravnog, broj_ugovora, grad_id, ime_pravnog) values (21, '1 Kosevo', 21, 1, 'Sasa Kovacevic');


insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (1, DATE'2002-06-01', DATE'2016-04-28', 1);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (2, DATE'2008-11-25', DATE'2017-08-30', 2);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (3, DATE'2002-04-24', DATE'2009-02-19', 3);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (4, DATE'2015-12-06', DATE'2017-08-10', 4);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (5, DATE'2004-12-10', DATE'2017-01-09', 5);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (6, DATE'2000-12-05', DATE'2003-11-22', 6);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (7, DATE'2000-08-02', DATE'2004-03-12', 7);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (8, DATE'2011-05-16', DATE'2012-10-08', 8);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (9, DATE'2005-11-03', DATE'2008-04-02', 9);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (10, DATE'2013-04-09', DATE'2016-10-06', 10);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (11, DATE'2001-09-09', DATE'2003-05-17', 11);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (12, DATE'2003-09-29', DATE'2009-05-22', 12);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (13, DATE'2009-06-08', DATE'2012-08-12', 13);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (14, DATE'2003-11-14', DATE'2007-12-22', 14);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (15, DATE'2000-12-07', DATE'2002-11-30', 15);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (16, DATE'2002-02-02', DATE'2006-03-25', 16);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (17, DATE'2007-03-03', DATE'2010-06-22', 17);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (18, DATE'2002-06-30', DATE'2003-03-08', 18);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (19, DATE'2001-08-22', DATE'2007-05-09', 19);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (20, DATE'2007-02-22', DATE'2010-11-21', 20);
insert into ugovor_pravnih (ugovor_pravnog_id, datum_potpisivanja, datum_raskidanja, pravno_lice_id) values (21, DATE'2016-12-06', DATE'2017-08-10', 1);


insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (1, 11);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (2, 12);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (3, 13);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (4, 14);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (5, 15);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (6, 16);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (7, 17);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (8, 18);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (9, 19);
insert into proizvodjac (proizvodjac_id, pravno_lice_id) values (10, 20);

insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (1, 1);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (2, 2);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (3, 3);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (4, 4);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (5, 5);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (6, 6);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (7, 7);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (8, 8);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (9, 9);
insert into kurirska_sluzba (kurirska_sluzba_id, pravno_lice_id) values (10, 10);

insert into kupac (kupac_id, fizicko_lice_id) values (1, 1);
insert into kupac (kupac_id, fizicko_lice_id) values (2, 2);
insert into kupac (kupac_id, fizicko_lice_id) values (3, 3);
insert into kupac (kupac_id, fizicko_lice_id) values (4, 4);
insert into kupac (kupac_id, fizicko_lice_id) values (5, 5);
insert into kupac (kupac_id, fizicko_lice_id) values (6, 6);
insert into kupac (kupac_id, fizicko_lice_id) values (7, 7);
insert into kupac (kupac_id, fizicko_lice_id) values (8, 8);
insert into kupac (kupac_id, fizicko_lice_id) values (9, 9);
insert into kupac (kupac_id, fizicko_lice_id) values (10, 10);

insert into garancija (garancija_id, mjeseci_garancije) values (1, 24);
insert into garancija (garancija_id, mjeseci_garancije) values (2, 24);
insert into garancija (garancija_id, mjeseci_garancije) values (3, 0);
insert into garancija (garancija_id, mjeseci_garancije) values (4, 12);
insert into garancija (garancija_id, mjeseci_garancije) values (5, 6);
insert into garancija (garancija_id, mjeseci_garancije) values (6, 36);
insert into garancija (garancija_id, mjeseci_garancije) values (7, 120);
insert into garancija (garancija_id, mjeseci_garancije) values (8, 12);
insert into garancija (garancija_id, mjeseci_garancije) values (9, 12);
insert into garancija (garancija_id, mjeseci_garancije) values (10, 12);

insert into popust (popust_id, iznos_popusta) values (1, 0.15);
insert into popust (popust_id, iznos_popusta) values (2, 0.9);
insert into popust (popust_id, iznos_popusta) values (3, 0.50);
insert into popust (popust_id, iznos_popusta) values (4, 0.35);
insert into popust (popust_id, iznos_popusta) values (5, 0.65);
insert into popust (popust_id, iznos_popusta) values (6, 0.20);
insert into popust (popust_id, iznos_popusta) values (7, 0.76);
insert into popust (popust_id, iznos_popusta) values (8, 0.55);
insert into popust (popust_id, iznos_popusta) values (9, 0.10);
insert into popust (popust_id, iznos_popusta) values (10, 0.15);

insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (1, 'Potatoes - Mini Red', 433.42, 1, null, 1);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (2, 'Extract - Vanilla,artificial', 947.24, 2, 2, 2);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (3, 'Cheese - Roquefort Pappillon', 713.56, 3, null, null);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (4, 'Mop Head - Cotton, 24 Oz', 438.75, 4, 4, null);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (5, 'Syrup - Monin - Blue Curacao', 52.8, 5, 5, 5);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (6, 'Soap - Mr.clean Flor Soap', 727.54, 6, 6, 6);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (7, 'Sobe - Green Tea', 728.66, 7, 7, 7);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (8, 'Cheese - Marble', 396.36, 8, 8, null);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (9, 'Pepper - Pablano', 26.66, 9, 9, 9);
insert into proizvod  (proizvod_id, naziv_proizvoda, cijena, proizvodjac_id, garancija_id, popust_id) values (10, 'Couscous', 725.6, 10, null, null);

insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (1, 1, 228);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (2, 2, 180);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (3, 3, 297);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (4, 4, 0);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (5, 5, 75);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (6, 6, 892);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (7, 7, 143);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (8, 8, 40);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (9, 9, 948);
insert into povezna_proizvod_skladiste (proizvod_id, skladiste_id, kolicina) values (10, 10, 526);


insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (1, 'Higena', null);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (2, 'Igracke', 2);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (3, 'Hrana', 1);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (4, 'Skolski pribor', 2);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (5, 'Basta', null);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (6, 'Pica', null);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (7, 'Zivotinje', 3);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (8, 'Restoran', 5);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (9, 'Jastuci i posteljine', 1);
insert into kategorija (kategorija_id, naziv_kategorije, nadkategorija_id) values (10, 'Drveni proizvodi', 5);

insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (1, 1);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (2, 2);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (3, 3);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (4, 4);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (5, 5);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (6, 6);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (7, 7);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (8, 8);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (9, 9);
insert into povezna_proizvod_kategorija (proizvod_id, kategorija_id) values (10, 10);

insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (1, 1, DATE'2009-10-29');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (2, 2, DATE'2018-06-02');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (3, 3, DATE'2018-09-03');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (4, 4, DATE'2017-07-21');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (5, 5, DATE'2018-03-02');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (6, 6, DATE'2017-09-23');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (7, 7, DATE'2016-03-31');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (8, 8, DATE'2015-11-18');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (9, 9, DATE'2014-08-14');
insert into isporuka (isporuka_id, kurirska_sluzba_id, datum_isporuke) values (10, 10, DATE'2008-08-15');

insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (1, DATE'2004-02-10', 533, 10, 1);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (2, DATE'2003-04-05', 2898, 9, 2);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (3, DATE'2005-04-24', 887, 8, 3);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (4, DATE'2008-06-14', 6, 7, 4);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (5, DATE'2011-03-27', 402, 6, 5);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (6, DATE'2003-12-20', 4, 5, 6);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (7, DATE'2013-11-12', 6, 4, 7);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (8, DATE'2017-04-16', 87, 3, 8);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (9, DATE'2009-08-14', 19941, 2, 9);
insert into racun (racun_id, datum_kupoprodaje, iznos_racuna, isporuka_id, kupac_id) values (10, DATE'2008-03-13', 655, 1, 10);

insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (1, 1, 0.7, 3086, null);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (2, 2, null, 7158, 12);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (3, 3, 0.50, 8259, 6);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (4, 4, 0.4, 3259, 24);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (5, 5, 0.2, 5474, 48);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (6, 6, 0.9, 1475, 24);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (7, 7, 1.0, 3155, null);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (8, 8, null, 2378, 12);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (9, 9, 0.1, 9037, 12);
insert into povezna_proizvod_racun (proizvod_id, racun_id, iznos_popusta, kolicina, iznos_garancije) values (10, 10, 0.5, 3626, 6);

