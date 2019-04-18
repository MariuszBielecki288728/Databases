SELECT DISTINCT nazwa, COUNT(DISTINCT wybor.kod_uz) 
    FROM przedmiot
    LEFT JOIN przedmiot_semestr USING (kod_przed)
    LEFT JOIN grupa USING (kod_przed_sem)
    LEFT JOIN wybor USING (kod_grupy)
WHERE rodzaj = 'p'
GROUP BY (kod_przed, nazwa)
HAVING COUNT(DISTINCT wybor.kod_uz) >= ALL (
    SELECT COUNT(DISTINCT wybor.kod_uz)
    FROM przedmiot
    LEFT JOIN przedmiot_semestr USING (kod_przed)
    LEFT JOIN grupa USING (kod_przed_sem)
    LEFT JOIN wybor USING (kod_grupy)
    WHERE przedmiot.rodzaj = 'p'
    GROUP BY (kod_przed, nazwa)
)