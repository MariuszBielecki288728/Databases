WITH 
    
    db (kod_uz) AS (
    SELECT DISTINCT wybor.kod_uz FROM wybor
        JOIN grupa USING (kod_grupy)
        JOIN przedmiot_semestr USING (kod_przed_sem)
        JOIN przedmiot USING (kod_przed)
    WHERE przedmiot.nazwa = 'Bazy danych'),
    
    sk (kod_uz) AS (
        SELECT DISTINCT wybor.kod_uz FROM wybor
            JOIN grupa USING (kod_grupy)
            JOIN przedmiot_semestr USING (kod_przed_sem)
            JOIN przedmiot USING (kod_przed)
        WHERE przedmiot.nazwa = 'Sieci komputerowe'
    )

((SELECT * FROM db) EXCEPT (SELECT * FROM sk))
UNION
((SELECT * FROM sk) EXCEPT (SELECT * FROM db))