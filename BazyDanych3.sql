--3.1.1
SELECT idZamowienia, dataRealizacji FROM public.zamowienia
WHERE dataRealizacji BETWEEN '2013-11-12' AND '2013-11-20'
ORDER BY dataRealizacji;

--3.1.2
SELECT idZamowienia, dataRealizacji FROM public.zamowienia
WHERE dataRealizacji BETWEEN '2013-12-01' AND '2013-12-06' 
OR dataRealizacji BETWEEN '2013-12-15' AND '2013-12-20'
ORDER BY dataRealizacji;

--3.1.3
SELECT idZamowienia, dataRealizacji FROM public.zamowienia
WHERE dataRealizacji BETWEEN '2013-12-01' AND '2013-12-31'
ORDER BY dataRealizacji;

--3.1.4
SELECT idZamowienia, dataRealizacji FROM public.zamowienia
WHERE date_part('month', dataRealizacji) = 12
ORDER BY dataRealizacji;

--3.2.1
SELECT idCzekoladki, nazwa, czekolada, orzechy, nadzienie FROM public.czekoladki
WHERE nazwa LIKE 'S%'
ORDER BY nazwa;

--3.2.2
SELECT idCzekoladki, nazwa, czekolada, orzechy, nadzienie FROM public.czekoladki
WHERE nazwa LIKE 'S%i'
ORDER BY nazwa;

--3.2.3
SELECT idCzekoladki, nazwa, czekolada, orzechy, nadzienie FROM public.czekoladki
WHERE nazwa LIKE 'S% m%'
ORDER BY nazwa;

--3.2.4
SELECT idCzekoladki, nazwa, czekolada, orzechy, nadzienie FROM public.czekoladki
WHERE nazwa LIKE 'A%' OR nazwa LIKE 'B%' OR nazwa LIKE 'C%'
ORDER BY nazwa;

--3.2.5
SELECT idCzekoladki, nazwa, czekolada, orzechy, nadzienie FROM public.czekoladki
WHERE nazwa LIKE '%orzech%' OR nazwa LIKE 'Orzech%'
ORDER BY nazwa;

--3.3.1
SELECT nazwa, miejscowosc FROM public.klienci
WHERE miejscowosc LIKE '_% %_'
ORDER BY miejscowosc;

--3.3.2
SELECT nazwa, telefon FROM public.klienci
WHERE telefon LIKE '0%'
ORDER BY telefon;

--3.4.1
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa IN (15, 24)
UNION
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE koszt IN (0.15, 0.24)

--3.4.2
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa IN (15, 24)
EXCEPT
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE koszt IN (0.15, 0.24)

--3.4.3
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa IN (15, 24) AND koszt IN (0.15, 0.24)
UNION
SELECT idczekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa IN(25, 35) AND koszt IN (0.25, 0.35);

--3.5.1
SELECT idklienta FROM public.klienci
EXCEPT
SELECT idklienta FROM public.zamowienia
ORDER BY idklienta;

--3.6.1
select idmeczu, gospodarze, goscie as "goscie",
(case when (gospodarze[1] > goscie[1]) then 1 else 0 end +
case when (gospodarze[2] > goscie[2]) then 1 else 0 end +
case when (gospodarze[3] > goscie[3]) then 1 else 0 end +
case when (gospodarze[4] > goscie[4]) then 1 else 0 end +
case when (gospodarze[5] > goscie[5]) then 1 else 0 end)
as "wygrane gospodarze",
(case when (gospodarze[1] < goscie[1]) then 1 else 0 end +
case when (gospodarze[2] < goscie[2]) then 1 else 0 end +
case when (gospodarze[3] < goscie[3]) then 1 else 0 end +
case when (gospodarze[4] < goscie[4]) then 1 else 0 end +
case when (gospodarze[5] < goscie[5]) then 1 else 0 end)
as "wygrane goscie"
from statystyki;

--3.6.2
select idmeczu, gospodarze, goscie as "goscie",
(case when (gospodarze[1] > goscie[1]) then 1 else 0 end +
case when (gospodarze[2] > goscie[2]) then 1 else 0 end +
case when (gospodarze[3] > goscie[3]) then 1 else 0 end +
case when (gospodarze[4] > goscie[4]) then 1 else 0 end +
case when (gospodarze[5] > goscie[5]) then 1 else 0 end)
as "wygrane gospodarze",
(case when (gospodarze[1] < goscie[1]) then 1 else 0 end +
case when (gospodarze[2] < goscie[2]) then 1 else 0 end +
case when (gospodarze[3] < goscie[3]) then 1 else 0 end +
case when (gospodarze[4] < goscie[4]) then 1 else 0 end +
case when (gospodarze[5] < goscie[5]) then 1 else 0 end)
as "wygrane goscie"
from statystyki
where gospodarze[5]>15 OR goscie[5]>15;