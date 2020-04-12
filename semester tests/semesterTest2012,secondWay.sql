--------------------------------------------------------------------------------
-- 2. Zadatak
--------------------------------------------------------------------------------
CREATE TABLE Proizvodac ( Proizvodac INTEGER NOT NULL,
                          Naziv_proizvodaca VARCHAR(50),
                          Grad VARCHAR(50),
                          Adresa VARCHAR(50),
                          Web_adresa VARCHAR(50),
                          Status VARCHAR(50) NOT NULL,

CONSTRAINT c_Proizvodac_Proizvodac_PK PRIMARY KEY (Proizvodac),
CONSTRAINT c_Proizvodac_Status_CK CHECK (Status IN ('Ovlasten','Neovlasten'))  ); -- Ovo nije obavezno, ali ako se bude tražilo da STATUS može imati samo odreðene vrijednosti

CREATE TABLE FiskalniUredaj ( FiskalniUredaj INTEGER NOT NULL,
                              Vrsta_fiskalnog_uredaja INTEGER NOT NULL,
                              Serijski_broj_uredaja VARCHAR(50),
                              Cijena NUMBER,
                              Datum_servisiranja DATE,

CONSTRAINT c_FiskalniUredaj_FiskalniUredaj_PK PRIMARY KEY (FiskalniUredaj),
CONSTRAINT c_FiskalniUredaj_Vrsta_fiskalnog_uredaja_FK FOREIGN KEY (Vrsta_fiskalnog_uredaja) REFERENCES VrstaFiskalnogUredaja (VrstaFiskalnogUredaja) );

CREATE TABLE Serviser ( Serviser INTEGER NOT NULL,
                        Servis INTEGER NOT NULL,
                        Prezime VARCHAR(50),
                        Ime VARCHAR(50),
                        Telefon VARCHAR(50),
                        Email VARCHAR(50),

CONSTRAINT c_Serviser_Serviser_PK PRIMARY KEY (Serviser),
CONSTRAINT c_Serviser_Servis_FK FOREIGN KEY (Servis) REFERENCES Servis (Servis) );

CREATE TABLE Obveznik ( Obveznik INTEGER NOT NULL,
                        Naziv INTEGER NOT NULL,
                        Grad VARCHAR(50),
                        Adresa VARCHAR(50),
                        Telefon VARCHAR(50),
                        WEB_adresa VARCHAR(50),
                        Maticni_broj VARCHAR(50),

CONSTRAINT c_Obveznik_Obveznik_PK PRIMARY KEY (Obveznik) );
--------------------------------------------------------------------------------
-- 3. Zadatak
--------------------------------------------------------------------------------
SELECT p.Naziv_proizvodaca, vfu.Naziv, Count(fu.Uredaj), Sum(vfu.Cijena)
FROM Proizvodac p, Vrsta_fiskalnog_uredaja vfu, Fiskalni_uredaj fu
WHERE p.Proizvodac(+) = vfu.Proizvodac AND fu.Vrsta_uredaja(+) = vfu.Vrsta_uredaja
GROUP BY ROLLUP(p.Naziv_proizvodaca, vfu.Naziv);
--------------------------------------------------------------------------------
-- 4. Zadatak
--------------------------------------------------------------------------------
CREATE INDEX serviser_UpperImePrezime_idx
ON Serviser(UPPER(Ime || ' ' || Prezime));

CREATE ROLE fizika;

GRANT ALL PRIVILEGES TO fizika; -- Ovdje nije baš fino definisano šta se treba dozvoliti ulozi, ponovite dodjeljivanje prava na SELECT, DELETE itd.

CREATE USER Tazman
IDENTIFIED BY Lozinka;

GRANT fizika TO Tazman;
--------------------------------------------------------------------------------
-- 5. Zadatak
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE KorekcijaStatusaProizvodaca_Proc(SifraUredaja INTEGER) IS
BEGIN


  UPDATE Proizvodac p
  SET p.Status = ( SELECT f.Status
                   FROM Fiskalizacija f, Fiskalni_uredaj fu
                   WHERE f.FiskalniUredaj = fu.Uredaj AND fu.Uredaj = SifraUredaja AND
                   Datum_fiskalizacije IN ( SELECT Max(f1.Datum_fiskalizacije)
                                            FROM Fiskalizacija f1 ));
  COMMIT;    --"commit" se stavlja nakon DML-ova STALNOOOOOOOOO

END;
/
--------------------------------------------------------------------------------
-- 6. Zadatak
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION VratiStazInspektora_Func(uv_ImeInspektora IN Inspektor.Ime%TYPE, uv_PrezimeInspektora IN Inspektor.Prezime%TYPE)
--u funkcijama mora uvijek ici ime paramtera, pa "IN"
RETURN VARCHAR2 IS

   lv_BrojInspektora NUMBER := 0;
   lv_Mjeseci NUMBER := 0;
   lv_Poruka VARCHAR2(1000);

   CURSOR BrojZaposlenihKursor IS
      SELECT Count(*)
      FROM Inspektor
      WHERE Ime = uv_ImeInspektora AND Prezime = uv_PrezimeInspektora;

   CURSOR StazKursor IS
    SELECT Decode( Datum_prestanka, NULL, Months_Between(Datum_prestanka, Datum_zaposlenja), Months_Between(SYSDATE, Datum_zaposlenja))
    FROM Inspektor
    WHERE Ime = uv_ImeInspektora AND Prezime = uv_PrezimeInspektora;

BEGIN

   OPEN BrojZaposlenihKursor;
   FETCH BrojZaposlenihKursor INTO lv_BrojInspektora;
   CLOSE BrojZaposlenihKursor;

   IF lv_BrojInspektora > 1 THEN
    lv_Poruka := 'Postoji više od jednog inspektora sa datim nazivom.';
   ELSIF lv_BrojInspektora = 1 THEN
    OPEN StazKursor;
    FETCH StazKursor INTO lv_Mjeseci;
    CLOSE StazKursor;
    lv_Poruka := Concat(Concat(Concat('Godina:', Trunc(lv_Mjeseci, 12)), ' i mjeseci:'), Mod(lv_Mjeseci, 12));
   ELSE
    lv_Poruka := 'Nepostojeæi inspektor.';
   END IF;

   RETURN (lv_Poruka);

END dajPrebivaliste;
/

--------------------------------------------------------------------------------
-- 7. Zadatak
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW PrikazFiskalizacije_View
AS
SELECT fu.Serijski_broj, f.Datum_fiskalizacije, s.Naziv, s.Grad, s.Adresa, sr.Telefon, sr.Email, Avg(fu.Cijena), Count(fu.Uredaj)
FROM Fiskalni_uredaj fu, Fiskalizacija f, Servis s, Serviser sr, Vrsta_fiskalnog_uredaja vfu, Proizvodac p, Inspektor i
WHERE fu.Uredaj = f.FiskalniUredaj AND f.Serviser = sr.Serviser AND sr.Servis = s.Servis AND fu.Vrsta_uredaja = vfu.VrstaUredaja AND vfu.Proizvodac = p.Proizvodac AND f.Inspektor = i.Inspektor AND
      ((fu.Datum_servisiranja < i.Datum_zaposlenja AND p.Grad = s.Grad) OR
      (fu.Datum_servisiranja > i.Datum_zaposlenja AND ( SELECT Count(vfu1.VrstaUredaja)
                                                        FROM Vrsta_fiskalnog_uredaja vfu1
                                                        WHERE vfu1.VrstaUredaja = fu.VrstaUredaja AND
                                                              vfu1.Proizvodac = p.Proizvodac AND
                                                              fu.Datum_servisiranja BETWEEN i.Datum_zapolsenja AND SYSDATE ) > ( SELECT Count(fu1.Datum_servisiranja)
                                                                                                                                 FROM Fiskalni_uredaj fu1
                                                                                                                                 WHERE fu1.Uredaj = fu.Uredaj ) ) )
GROUP BY fu.Serijski_broj, f.Datum_fiskalizacije, s.Naziv, s.Grad, s.Adresa, sr.Telefon, sr.Email
HAVING Count(fu.Uredaj) > ( SELECT Avg(Count(fu.Uredaj))
                            FROM Fiskalni_uredaj fu, Proizvodac p
                            WHERE ROWNUM <= 5
                            ORDER BY Count(fu.Uredaj) DESC; ) -- Za najveæe proizvoðaèe uzimam one koji imaju najveæi broj ureðaja

-- S obzirom da je ovaj zadatak dosta glomazan i konfuzan, ne mogu garantovati za ispravnost, ali možete shvatiti logiku kojom se trebate voditi prilikom
-- izrade ovako teških zadataka
--------------------------------------------------------------------------------
-- 8. Zadatak
--------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER KontrolaFiskalizacije_Trig
BEFORE INSERT ON Fiskalizacija
FOR EACH ROW

  lv_gradObveznika VARCHAR2(50);
  lv_gradServisa VARCHAR2(50);
  lv_gradInspektora VARCHAR2(50);
  lv_Proizvodac INTEGER;
  lv_statusProizvodaca VARCHAR2(50);

BEGIN

  SELECT o.Grad
  INTO lv_gradObveznika
  FROM Obveznik o
  WHERE o.Obveznik = :new.Obveznik;

  SELECT s.Grad
  INTO lv_gradServisa
  FROM Servis s, Serviser sr
  WHERE sr.Servis = s.Servis AND sr.Serviser = :new.Serviser;

  SELECT i.Grad
  INTO lv_gradInspektora
  FROM Inspektor i
  WHERE i.Inspektor = :new.Inspektor;

  IF lv_gradObveznika <> lv_gradServisa OR lv_gradObveznika <> lv_gradInspektora OR lv_gradInspektora <> lv_gradServisa THEN
    SELECT p.Proizvodac, p.Status
    INTO lv_Proizvodac, lv_statusProizvodaca
    FROM Proizvodac p, Servis s, Serviser sr
    WHERE s.Proizvodac = p.Proizvodac AND sr.Servis = s.Servis AND sr.Serviser = :new.Serviser;

    IF lv_statusProizvodaca = :new.Status THEN
      UPDATE Fiskalni_uredaj fu SET fu.Cijena = ( SELECT vfu.Cijena
                                                  FROM Vrsta_fisalnog_uredaja vfu
                                                  WHERE  vfu.Proizvodac = lv_Proizvodac );
    ELSE
      Raise_Application_Error(-20500, 'Grad obveznika, servisa i inspektora, kao i statusi proizvoðaèa i fiskalizacije nisu isti.');
    END IF;
  END IF;

END;
/
--------------------------------------------------------------------------------
-- Korisne napomene :
--------------------------------------------------------------------------------
-- 1. Ponovite SET operatore, dakle UNION, UNION ALL, INTERSECT i MINUS
-- 2. Ponovite Hijerarhijsku strukturu podataka, dakle TOP DOWN i BOTTOM UP
--    kreiranje drveæa, èesto se desi da takvi zadaci doðu na ispitu i iako nisu
--    teški ne mogu se uraditi jer se to predavanje nije ni proèitalo
-- 3. Funkcije i Procedure nisu toliko puno obraðivane u materijalima pa vam je
--    najbolje da to direktno nauèite iz Oracle dokumentacije :
--    Procedure: http://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_6009.htm
--    Funkcije: http://docs.oracle.com/cd/B19306_01/server.102/b14200/statements_5009.htm
-- 4. Obavezno ponoviti kreiranje top 10 analize
-- 5. Cheers m8s !
--------------------------------------------------------------------------------