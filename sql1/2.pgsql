select imie, nazwisko from
    uzytkownik 
    join wybor using (kod_uz)
    join grupa using (kod_grupy)
    join przedmiot_semestr using (kod_przed_sem)
    join przedmiot using (kod_przed)

    where 
        semestr_id=38 AND 
        przedmiot.nazwa='Matematyka dyskretna (M)' AND
        grupa.rodzaj_zajec='w'

    ORDER BY wybor.data ASC
    LIMIT 1