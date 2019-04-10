
select distinct nazwa from przedmiot
    join przedmiot_semestr using (kod_przed)
    join grupa using (kod_przed_sem)
    
where rodzaj='o' and rodzaj_zajec='e';