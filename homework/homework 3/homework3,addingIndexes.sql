CREATE INDEX index_datum_isporuke
ON ISPORUKA (datum_isporuke);

CREATE INDEX index_popust_id
ON PROIZVOD (popust_id);

CREATE INDEX index_grarancija_id
ON PROIZVOD (garancija_id);

CREATE INDEX index_odgovorna_osoba
ON SKLADISTE (odgovorna_osoba);

CREATE INDEX index_datum_raskidanja_ugovora
ON UGOVOR_ZAPOSLENIKA (datum_raskidanja_ugovora);

CREATE INDEX index_sef_id
ON UPOSLENIK (sef_id);

SELECT uic.index_name, uic.column_name, uic.column_position col_pos, ui.uniqueness
FROM user_indexes ui, user_ind_columns uic
WHERE  uic.index_name = ui.index_name AND uic.table_name='PROIZVOD';

