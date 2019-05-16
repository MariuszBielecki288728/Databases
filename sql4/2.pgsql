CREATE OR REPLACE FUNCTION plan_zajec_prac(int,int)
    RETURNS TABLE(
        nazwa przedmiot.nazwa%TYPE,
        rodzaj grupa.rodzaj_zajec%TYPE,
        termin grupa.termin%TYPE,
        sala grupa.sala%TYPE,
        liczba INT
    )
AS $X$
    SELECT DISTINCT nazwa, rodzaj_zajec, termin, sala, COUNT(wybor.kod_uz)::INT
    FROM grupa
        JOIN przedmiot_semestr USING(kod_przed_sem)
        JOIN wybor USING(kod_grupy)
        JOIN przedmiot USING(kod_przed)
    WHERE grupa.kod_uz=$1 AND semestr_id=$2
    GROUP BY nazwa, kod_przed, rodzaj_zajec, termin, sala;
$X$
LANGUAGE SQL STABLE; 

SELECT * FROM plan_zajec_prac(187, 39);