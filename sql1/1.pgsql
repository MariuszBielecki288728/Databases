select nazwisko from
uzytkownik join grupa using (kod_uz)
join przedmiot_semestr using (kod_przed_sem)
join semestr using (semestr_id)
join przedmiot using (kod_przed)
where
    semestr_id=38
    AND przedmiot.nazwa='Matematyka dyskretna (M)'
    AND grupa.rodzaj_zajec='c'
ORDER BY nazwisko ASC;