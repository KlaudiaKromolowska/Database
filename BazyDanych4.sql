--4.2.1
SELECT datarealizacji, idzamowienia, nazwa, ulica FROM public.zamowienia
join public.klienci
on nazwa like '%Antoni'

--4.2.2
SELECT datarealizacji, idzamowienia, nazwa, ulica FROM public.zamowienia
join public.klienci
on ulica like '%/%'

--4.3.1
SELECT k.nazwa, k.ulica, k.miejscowosc, z.datarealizacji from klienci k
join zamowienia z
on datarealizacji >= current_date - interval '5 years'
order by datarealizacji

--4.3.2
SELECT k.nazwa, k.ulica, k.miejscowosc, p.nazwa from klienci k
join pudelka p
on p.nazwa = 'Kremowa fantazja' OR p.nazwa = 'Kolekcja jesienna'
------------
SELECT k.nazwa, k.ulice, k.miejscowosc
FROM 
klienci k
JOIN zamowienia z on k.idklienta = z.idklienta
JOIN artykuly a on z.idzamowienia = a.idzamowienia
JOIN pudelka p ON a.idpudelka = p.idpudelka
WHERE
p.nazwa IN ('Kremowa fantazja', 'Kolekcja jesienna')

--4.3.3
SELECT * from klienci
where idklienta in(SELECT idklienta from zamowienia)
---------------------------
SELECT  k.nazwa FROM public.zamowienia z
natural join public.klienci k
group by k.nazwa
order by nazwa
SELECT k.nazwa, k.ulica, k.miejscowosc, z.idklienta
FROM klienci k
JOIN zamowienia z on k.idklienta = z.idklienta
group by k.nazwa, k.ulica, k.miejscowosc, z.idklienta
order by z.idklienta
--4.3.4
SELECT k.* from klienci k LEFT JOIN zamowienia z
on k.idklienta = z.idklienta where z.idzamowienia IS NULL


--4.4.1
select left(rtrim(p.nazwa ||' - '|| p.opis),50) as "Pudelko", left(rtrim(z.sztuk || '-' || c.nazwa || ' - ' || c.opis),50) as "Zawartość"
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
order by 1;

--4.4.2
select p.idpudelka as "Id", left(rtrim(p.nazwa ||' - '|| p.opis),45) as "Pudelko", left(rtrim(z.sztuk || '-' || c.nazwa || ' - ' || c.opis),45) as "Zawartość"
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where p.idpudelka = 'heav'
order by 2;

--4.5.1
select p.nazwa, p.opis, p.cena, c.idczekoladki
from pudelka p  natural join zawartosc z join czekoladki c using (idczekoladki)
where c.idczekoladki like 'd09'

--4.5.2
select p. nazwa as "Pudelko"
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where c.nazwa like 'S%'
group by p.nazwa;

--4.5.3
select p. nazwa as "Pudelko"
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
where z.sztuk>4
group by p.nazwa;


--4.5.4
select p. nazwa as "Pudelko"
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
WHERE c.nadzienie like 'truskawki'
group by p.nazwa

--4.5.4
select p. nazwa as "Pudelko", c.czekolada
from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki)
WHERE c.czekolada not like 'gorzka'
group by p.nazwa, c.czekolada
order by 2

--4.6.1
SELECT cz.idczekoladki, cz.nazwa FROM czekoladki cz
WHERE koszt > (SELECT koszt FROM czekoladki WHERE idczekoladki = 'd08')
--4.6.2
WITH gorka AS (
        SELECT a.idpudelka FROM klienci k
        Natural JOIN zamowienia z JOIN artykuly a
        ON k.nazwa = 'Górka Alicja'
)
SELECT kk.nazwa FROM klienci kk
Natural JOIN zamowienia zz
NATURAL JOIN artykuly aa 
JOIN gorka
ON kk.nazwa <> 'Górka Alicja'
GROUP BY kk.nazwa
ORDER BY kk.nazwa ASC