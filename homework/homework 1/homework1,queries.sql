

/*brise sve kreirane tabele*/
/*BEGIN

FOR c IN (SELECT table_name FROM user_tables) LOOP
EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
END LOOP;

END;*/

CREATE TABLE KONTINENT  (  kontinent_id INTEGER PRIMARY KEY,
                          ime_kontinenta VARCHAR(40) NOT null
 );

CREATE TABLE DRZAVA    (  drzava_id INTEGER PRIMARY KEY,
                          ime_drzave VARCHAR(40) not null,
                          kontinent_id INTEGER  REFERENCES KONTINENT(kontinent_id) NOT null
 );

CREATE TABLE GRAD     ( grad_id INTEGER PRIMARY KEY,
                          ime_grada VARCHAR(40) NOT null,
                          drzava_id INTEGER  REFERENCES DRZAVA(drzava_id)NOT null
 );

CREATE TABLE FIZICKA_LICA     (  fizicko_lice_id INTEGER PRIMARY KEY,
                                  vrsta INTEGER NOT null,
                                  ime VARCHAR (40) NOT null,
                                  prezime VARCHAR (40) NOT null,
                                  adresa VARCHAR(40) NOT null,
                                  grad_id INTEGER REFERENCES GRAD(grad_id) NOT null
 );

 CREATE TABLE UGOVOR_ZAPOSLENIKA     (  ugovor_zaposlenika_id INTEGER PRIMARY KEY,
                                        datum_zaposlenja_uposlenog DATE NOT null,
                                        datum_raskidanja_ugovora DATE null  /*moze biti null*/
 );

 CREATE TABLE ODJELI     (  odjel_id INTEGER PRIMARY KEY,
                            /*sef_id INTEGER REFERENCES UPOSLENIK(sef_id) NOT null,*/
                            ime_odjela VARCHAR (40) NOT null
  );

 CREATE TABLE UPOSLENIK  (  uposlenik_id INTEGER PRIMARY KEY,
                          fizicko_lice_id INTEGER REFERENCES FIZICKA_LICA(fizicko_lice_id) NOT NULL unique, /* 1:1 vezu*/
                          drzava_id INTEGER REFERENCES DRZAVA(drzava_id) not null,
                          kontinent_id INTEGER  REFERENCES KONTINENT(kontinent_id) NOT null,
                          odjel_id INTEGER REFERENCES ODJELI(odjel_id) NOT null,
                          sef_id INTEGER REFERENCES UPOSLENIK(uposlenik_id) null, /*moze biti null*/
                          ugovor_o_zaposlenju_id INTEGER REFERENCES UGOVOR_ZAPOSLENIKA(ugovor_zaposlenika_id) NOT null
 );

 CREATE TABLE SKLADISTE ( skladiste_id INTEGER PRIMARY KEY,
                          naziv_skladiste VARCHAR(40) NOT null,
                          adresa_skaldista VARCHAR(40) NOT null,
                          odgovorna_osoba INTEGER REFERENCES UPOSLENIK(uposlenik_id) NOT null,
                          kontinent_id INTEGER REFERENCES KONTINENT (kontinent_id) NOT null,
                          grad_id INTEGER REFERENCES GRAD(grad_id) NOT null,
                          drzava_id INTEGER REFERENCES DRZAVA(drzava_id) NOT null
 );

CREATE TABLE PRAVNA_LICA     (  pravno_lice_id INTEGER PRIMARY KEY,
                                  vrsta_pravnog_lica INTEGER NOT null,
                                  ime_pravnog VARCHAR (40) NOT null,
                                  broj_ugovora INTEGER NOT null,
                                  adresa_pravnog VARCHAR(40) NOT null,
                                  grad_id INTEGER REFERENCES GRAD(grad_id)
 );

CREATE TABLE UGOVOR_PRAVNIH    (  ugovor_pravnog_id INTEGER PRIMARY KEY,
                                  datum_raskidanja DATE NOT null,
                                  datum_potpisivanja DATE NOT null,
                                  pravno_lice_id INTEGER REFERENCES PRAVNA_LICA(pravno_lice_id) NOT null
 );

CREATE TABLE PROIZVODJACI      (  proizvodjaci_id INTEGER PRIMARY KEY,
                                  pravno_lice_id INTEGER  REFERENCES PRAVNA_LICA(pravno_lice_id) unique NOT null
 );
             /* 1:1 relacija*/
CREATE TABLE KURIRSKE_SLUZBE   (  kurirska_sluzba_id INTEGER PRIMARY KEY,
                                  pravno_lice_id INTEGER REFERENCES PRAVNA_LICA(pravno_lice_id) unique NOT null

 );
                         /* 1:1 relacija*/
CREATE TABLE KUPAC             (  kupac_id INTEGER PRIMARY KEY,
                                  fizicko_lice_id INTEGER REFERENCES FIZICKA_LICA(fizicko_lice_id) UNIQUE NOT null
 );


 CREATE TABLE GARANCIJA      (  garancija_id INTEGER PRIMARY KEY,
                                iznos_garancije INTEGER
 );

 CREATE TABLE POPUST      (  popust_id INTEGER PRIMARY KEY,
                             iznos_garancije INTEGER
 );

 CREATE TABLE PROIZVOD         (  proizvod_id INTEGER PRIMARY KEY,
                                  naziv_proizvoda VARCHAR (40) NOT null,
                                  cijena INTEGER NOT null,
                                  proizvodjac_id INTEGER REFERENCES PROIZVODJACI(proizvodjaci_id) NOT null,
                                  garancija_id INTEGER REFERENCES GARANCIJA(garancija_id) NULL,  /*moze biti null*/
                                  popust_id INTEGER REFERENCES POPUST(popust_id) NULL /*moze biti null*/
 );

 CREATE TABLE POVEZNA_PROIZVOD_SKLADISTE      (
                                                 skaldiste_id INTEGER REFERENCES SKLADISTE(skladiste_id) NOT NULL,
                                                 proizvod_id INTEGER REFERENCES PROIZVOD(proizvod_id) NOT NULL,
                                                 kolicina INTEGER NOT null
 );

 CREATE TABLE KATEGORIJA      (   kategorija_id INTEGER PRIMARY KEY,
                                  naziv_kategorije VARCHAR(40),
                                  nadkategorija_id INTEGER
 );

 CREATE TABLE POVEZNA_PROIZVOD_KATEGORIJA      (  proizvod_id INTEGER REFERENCES PROIZVOD(proizvod_id) NOT null,
                                                  kategorija_id INTEGER REFERENCES KATEGORIJA(kategorija_id) NOT null
 );

 CREATE TABLE ISPORUKA      (  isporuka_id INTEGER PRIMARY KEY,
                              kurirska_sluzba_id INTEGER REFERENCES KURIRSKE_SLUZBE(kurirska_sluzba_id) NOT null
 );

 CREATE TABLE RACUN        (  racun_id INTEGER PRIMARY KEY,
                              datum_kupoprodaje DATE NOT null,
                              iznos_racuna INTEGER NOT null,
                              fizicko_lice_id INTEGER NOT null,
                              isporuka_id INTEGER REFERENCES ISPORUKA(isporuka_id) NOT null
 );

 CREATE TABLE POVEZNA_PROIZVOD_RACUN      (  proizvodjaci_id INTEGER REFERENCES PROIZVODJACI(proizvodjaci_id) NOT null,
                                             racun_id INTEGER REFERENCES RACUN(racun_id) NOT null,
                                             kolicina INTEGER NOT null
 );


