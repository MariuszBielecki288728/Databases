CREATE OR REPLACE FUNCTION pierwszy_zapis(int, int) RETURNS timestamp with time zone AS

$X$

    SELECT w.data

    FROM wybor w 
        JOIN grupa g USING(kod_grupy)
        JOIN przedmiot_semestr ps USING(kod_przed_sem)
        JOIN uzytkownik u ON (u.kod_uz = w.kod_uz)

    WHERE w.kod_uz=$1 AND semestr_id=$2
    ORDER BY w.data;

$X$
LANGUAGE SQL STABLE; 

SELECT nazwisko, pierwszy_zapis(kod_uz, 32)
FROM uzytkownik
WHERE nazwisko LIKE 'A%' AND pierwszy_zapis(kod_uz, 32) IS NOT NULL
;