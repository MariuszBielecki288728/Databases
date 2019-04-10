(select distinct nazwa from przedmiot 
where rodzaj='k')
EXCEPT
(select nazwa from przedmiot 
    join przedmiot_semestr 
    using (kod_przed));