SELECT semestr_id, MIN(nazwisko) FROM
    (SELECT semestr_id, MIN(wybor.data) FROM semestr
        JOIN przedmiot_semestr USING (semestr_id)
        JOIN grupa USING (kod_przed_sem)
        JOIN wybor USING (kod_grupy)
        JOIN uzytkownik ON (wybor.kod_uz=uzytkownik.kod_uz)
    WHERE semestr.nazwa LIKE '%letni%'
    GROUP BY (semestr_id)) s
JOIN wybor ON (s.min=wybor.data)
JOIN uzytkownik USING (kod_uz)
GROUP BY (semestr_id, data)
