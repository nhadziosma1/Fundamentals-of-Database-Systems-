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

CREATE TABLE FIZICKO_LICE     (  fizicko_lice_id INTEGER PRIMARY KEY,
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

 CREATE TABLE ODJEL     (  odjel_id INTEGER PRIMARY KEY,
                            ime_odjela VARCHAR (40) NOT null
  );

 CREATE TABLE UPOSLENIK  (  uposlenik_id INTEGER PRIMARY KEY,
                          fizicko_lice_id INTEGER REFERENCES FIZICKO_LICE(fizicko_lice_id) NOT NULL unique, /* 1:1 vezu*/
                          drzava_id INTEGER REFERENCES DRZAVA(drzava_id) not null,
                          kontinent_id INTEGER  REFERENCES KONTINENT(kontinent_id) NOT null,
                          odjel_id INTEGER REFERENCES ODJEL(odjel_id) NOT null,
                          sef_id INTEGER REFERENCES UPOSLENIK(uposlenik_id) null, /*moze biti null*/
                          ugovor_o_zaposlenju_id INTEGER REFERENCES UGOVOR_ZAPOSLENIKA(ugovor_zaposlenika_id) NOT null
 );

 CREATE TABLE SKLADISTE ( skladiste_id INTEGER PRIMARY KEY,
                          naziv_skladista VARCHAR(40) NOT null,
                          adresa_skladista VARCHAR(40) NOT null,
                          odgovorna_osoba INTEGER REFERENCES UPOSLENIK(uposlenik_id) NOT null,
                          kontinent_id INTEGER REFERENCES KONTINENT (kontinent_id) NOT null,
                          grad_id INTEGER REFERENCES GRAD(grad_id) NOT null,
                          drzava_id INTEGER REFERENCES DRZAVA(drzava_id) NOT null
 );

CREATE TABLE PRAVNO_LICE     (  pravno_lice_id INTEGER PRIMARY KEY,
                                  vrsta_pravnog_lica INTEGER NOT null,
                                  ime_pravnog VARCHAR (40) NOT null,
                                  broj_ugovora INTEGER NOT null,
                                  adresa_pravnog VARCHAR(40) NOT null,
                                  grad_id INTEGER REFERENCES GRAD(grad_id)
 );

CREATE TABLE UGOVOR_PRAVNIH    (  ugovor_pravnog_id INTEGER PRIMARY KEY,
                                  datum_raskidanja DATE NOT null,
                                  datum_potpisivanja DATE NOT null,
                                  pravno_lice_id INTEGER REFERENCES PRAVNO_LICE(pravno_lice_id) NOT null
 );

CREATE TABLE PROIZVODJAC      (  proizvodjac_id INTEGER PRIMARY KEY,
                                  pravno_lice_id INTEGER  REFERENCES PRAVNO_LICE(pravno_lice_id) unique NOT null
 );
             /* 1:1 relacija*/
CREATE TABLE KURIRSKA_SLUZBA   (  kurirska_sluzba_id INTEGER PRIMARY KEY,
                                  pravno_lice_id INTEGER REFERENCES PRAVNO_LICE(pravno_lice_id) unique NOT null

 );
                         /* 1:1 relacija*/
CREATE TABLE KUPAC             (  kupac_id INTEGER PRIMARY KEY,
                                  fizicko_lice_id INTEGER REFERENCES FIZICKO_LICE(fizicko_lice_id) UNIQUE NOT null
 );


 CREATE TABLE GARANCIJA      (  garancija_id INTEGER PRIMARY KEY,
                                mjeseci_garancije integer NOT null
 );

 CREATE TABLE POPUST      (  popust_id INTEGER PRIMARY KEY,
                             iznos_popusta real  NOT null
 );

 CREATE TABLE PROIZVOD         (  proizvod_id INTEGER PRIMARY KEY,
                                  naziv_proizvoda VARCHAR (40) NOT null,
                                  cijena INTEGER NOT null,
                                  proizvodjac_id INTEGER REFERENCES PROIZVODJAC(proizvodjac_id) NOT null,
                                  garancija_id INTEGER REFERENCES GARANCIJA(garancija_id) NULL,  /*moze biti null*/
                                  popust_id INTEGER REFERENCES POPUST(popust_id) NULL /*moze biti null*/
 );

 CREATE TABLE POVEZNA_PROIZVOD_SKLADISTE      (
                                                 skladiste_id INTEGER REFERENCES SKLADISTE(skladiste_id) NOT NULL,
                                                 proizvod_id INTEGER REFERENCES PROIZVOD(proizvod_id) NOT NULL,
                                                 kolicina INTEGER NOT null
 );

 CREATE TABLE KATEGORIJA      (   kategorija_id INTEGER PRIMARY KEY,
                                  naziv_kategorije VARCHAR(40) NOT null,
                                  nadkategorija_id INTEGER null
 );

 CREATE TABLE POVEZNA_PROIZVOD_KATEGORIJA      (  proizvod_id INTEGER REFERENCES PROIZVOD(proizvod_id) NOT null,
                                                  kategorija_id INTEGER REFERENCES KATEGORIJA(kategorija_id) NOT null
 );

 CREATE TABLE ISPORUKA      (  isporuka_id INTEGER PRIMARY KEY,
                              kurirska_sluzba_id INTEGER REFERENCES KURIRSKA_SLUZBA(kurirska_sluzba_id) NOT null
 );

 CREATE TABLE RACUN        (  racun_id INTEGER PRIMARY KEY,
                              datum_kupoprodaje DATE NOT null,
                              iznos_racuna INTEGER NOT null,
                              fizicko_lice_id INTEGER NOT null,
                              isporuka_id INTEGER REFERENCES ISPORUKA(isporuka_id) NOT null
 );

 CREATE TABLE POVEZNA_PROIZVOD_RACUN      (  proizvod_id INTEGER REFERENCES PROIZVOD(proizvod_id) NOT null,
                                             racun_id INTEGER REFERENCES RACUN(racun_id) NOT null,
                                             kolicina INTEGER NOT null
 );

 /*ISPRAVKE NA POCETNO RJESENJE PREDATO U ZADACI 1:*/
 /*izbacio iz skladista veze sa drzavom i kontinentom*/
 ALTER TABLE SKLADISTE
 DROP COLUMN kontinent_id;

 ALTER TABLE SKladiste
 DROP COLUMN drzava_id;
 /*izbacio iz uposlenika veze sa drzavom i kontinentom*/
 ALTER TABLE UPOSLENIK
 DROP COLUMN drzava_id;

 ALTER TABLE UPOSLENIK
 DROP COLUMN kontinent_id;

 /*skontaksom "add foreign key" ne dodajes novu kolonu, vec od postojece pravis strani kljuc*/
 ALTER table KAtegorija
 ADD FOREIGN KEY( nadkategorija_id )REFERENCES kategorija (kategorija_id);

 /*dodavanje sefa odjela*/
 ALTER TABLE ODJEL
 ADD sef_id INTEGER NOT null;

 ALTER TABLE odjel
 ADD UNIQUE (sef_id);

 ALTER TABLE odjel
 ADD FOREIGN KEY(sef_id) REFERENCES uposlenik (uposlenik_id);

/*pravljenje 1:n veze izmedju tabela uposlenik-ugovor_uposlenika*/
 ALTER TABLE ugovor_zaposlenika
 ADD uposlenik_id INTEGER NOT NULL;

 ALTER TABLE ugovor_zaposlenika
 ADD FOREIGN KEY (uposlenik_id) REFERENCES uposlenik( uposlenik_id);

 ALTER TABLE Uposlenik
 DROP COLUMN ugovor_o_zaposlenju_id;

 /*spajanje kupca sa racunom, umjesto fizickog lica*/
 ALTER TABLE Racun
 DROP COLUMN fizicko_lice_id;

 ALTER TABLE racun
 ADD kupac_id INTEGER NOT null;

 ALTER TABLE racun
 ADD FOREIGN KEY (kupac_id) REFERENCES kupac(kupac_id);

 /*brisanje kolone "vrsta", jer  nije fizicko lice ujedno moze biti i kupac i uposlenik*/
 ALTER TABLE fizicko_lice
 drop COLUMN vrsta;

 /*dodavanje "datum_isporuke" u tabelu isporuka*/
 ALTER TABLE isporuka
 ADD datum_isporuke date NOT NULL;

/*izbrisi kolonu "vsrsta_pravnog_lica", jer je nepotreba*/
ALTER TABLE pravno_lice
DROP COLUMN vrsta_pravnog_lica;

/*dodana kolna "iznos_popusta" u poveznu tabelu izmedju racuna i proizvoda da bi se mogla ocitati vrijednost popusta u trenutku kupovine proizvoda*/
ALTER TABLE povezna_proizvod_racun
ADD iznos_popusta REAL NULL;

/*dodana kolona plata u uposlenika- zbog upita*/
ALTER TABLE uposlenik
ADD plata INTEGER NOT NULL;

/*kraj*/
