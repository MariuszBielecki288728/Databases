SELECT DISTINCT uzytkownik.kod_uz, imie, nazwisko FROM uzytkownik
    JOIN wybor w USING (kod_uz)
    JOIN grupa USING (kod_grupy)
    JOIN przedmiot_semestr ps USING (kod_przed_sem)
    JOIN przedmiot USING (kod_przed)
WHERE przedmiot.nazwa LIKE 'Algorytmy i struktury danych%' 
    AND EXISTS (
        SELECT 1 FROM wybor
            JOIN grupa USING (kod_grupy)
            JOIN przedmiot_semestr USING (kod_przed_sem)
            JOIN przedmiot USING (kod_przed)
        WHERE przedmiot.nazwa LIKE 'Matematyka dyskretna%'
        AND semestr_id > ps.semestr_id
        AND wybor.kod_uz = w.kod_uz
    );