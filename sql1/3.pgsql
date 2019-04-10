
select kod_grupy from grupa
    join przedmiot_semestr using (kod_przed_sem)
    join przedmiot using (kod_przed)

    where 
        semestr_id=38 AND 
        przedmiot.nazwa='Matematyka dyskretna (M)' AND
        grupa.rodzaj_zajec='w';

select w1.data-w2.data from 
    wybor w1
    join grupa using(kod_grupy) 
    join wybor w2 using (kod_grupy)
    where 
        w1.data>w2.data AND 
        grupa.kod_grupy=5649
    ORDER BY 1 DESC
    LIMIT 1;