CREATE OR REPLACE FUNCTION procedura_wyzwalacza() RETURNS TRIGGER AS $X$
DECLARE 
    rz grupa.rodzaj_zajec%TYPE;
    kps grupa.kod_przed_sem%TYPE;
    kg grupa.kod_grupy%TYPE;
BEGIN
    SELECT rodzaj_zajec, kod_przed_sem INTO rz, kps 
    FROM grupa WHERE grupa.kod_grupy = NEW.kod_grupy;

    IF (rz = 'w') THEN 
        RETURN NULL; 
    END IF;

    FOR kg IN (
        SELECT kod_grupy 
        FROM grupa
        WHERE kod_przed_sem = kps AND rodzaj_zajec = 'w'
    )
    LOOP
        IF (NOT EXISTS(SELECT * FROM wybor WHERE wybor.kod_uz=NEW.kod_uz
        AND wybor.kod_grupy = kg) ) THEN
            INSERT INTO wybor(kod_grupy, kod_uz, data)
            VALUES (kg, NEW.kod_uz, NEW.data);
        END IF;
    END LOOP;
RETURN NULL;
END
$X$ LANGUAGE PLpgSQL;

SELECT kod_przed_sem, COUNT(rodzaj_zajec) FROM grupa
GROUP BY kod_przed_sem
ORDER BY count DESC
LIMIT 1;
SELECT * FROM grupa WHERE grupa.kod_przed_sem=2648;
SELECT * FROM wybor WHERE wybor.kod_uz=4200
        AND wybor.kod_grupy = 4719;

INSERT INTO wybor(kod_grupy, kod_uz, data)
VALUES (4725, 4200, '2016-02-17T22:01:51.912Z');

SELECT * FROM wybor WHERE wybor.kod_uz=4200
        AND wybor.kod_grupy = 4719;