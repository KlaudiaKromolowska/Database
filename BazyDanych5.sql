--5.1
--1.
SELECT count(*) as liczba_czekoladek FROM public.czekoladki cz;
--2.
SELECT count(nadzienie) as liczba_czekoladek FROM public.czekoladki cz;
SELECT count(*) as liczba_czekoladek FROM public.czekoladki cz
where cz.nadzienie is not null;
SELECT cz.czekolada, COUNT(*) as liczba_czekoladek FROM czekoladki cz GROUP BY cz.czekolada
--3.
select z.idpudelka, sum(z.sztuk)
from zawartosc z natural join czekoladki c
group by z.idpudelka
order by 2 desc
limit 1

--5.2
--1.
SELECT p.idpudelka, SUM(cz.masa) as masa FROM czekoladki cz
JOIN zawartosc z ON cz.idczekoladki = z.idczekoladki
JOIN pudelka p ON z.idpudelka = p.idpudelka
GROUP BY p.idpudelka
--2.
SELECT p.idpudelka, SUM(cz.masa) as masa FROM czekoladki cz
JOIN zawartosc z ON cz.idczekoladki = z.idczekoladki
JOIN pudelka p ON z.idpudelka = p.idpudelka
GROUP BY p.idpudelka
order by masa desc
limit 1

--5.3
--1.
SELECT z.datarealizacji, SUM(z.idzamowienia) as ilosc_zamowien FROM zamowienia z
GROUP BY z.datarealizacji
order by z.datarealizacji
--2.
SELECT SUM(z.idzamowienia) as ilosc_zamowien FROM zamowienia z

--5.4
--1.
SELECT z.idczekoladki, count(z.idpudelka) as ilosc_pudelek FROM zawartosc z
group by z.idczekoladki
order by ilosc_pudelek desc
--2.
select z.idpudelka, sum(z.sztuk)
from zawartosc z natural join czekoladki c
where c.orzechy is null
group by z.idpudelka
order by 2 desc

--5.5
--1.
select date_trunc('quarter', z.datarealizacji) as kwartal, count(z.idzamowienia) as ilosc
from public.zamowienia z
group by kwartal
--2.
select date_trunc('month', z.datarealizacji) as miesiac,date_trunc('year', z.datarealizacji) as rok,
 count(z.idzamowienia) as ilosc
from public.zamowienia z
group by miesiac, rok

--5.6.1
select sum(pudelkawszystkie.waga) from
(select pudelko.masa*stan as waga from
(select z.idpudelka as idpudelka, sum(z.sztuk*c.masa) as masa from
zawartosc z
natural join czekoladki c
group by z.idpudelka)
pudelko join pudelka using (idpudelka)) pudelkawszystkie

--5.7
--1.
SELECT zysk.idpudelka, (zysk.cena-zysk.koszt) as "zysk" from
(select idpudelka, p.cena as cena, sum(z.sztuk*c.koszt) as koszt
from pudelka p natural join zawartosc z join czekoladki c using (idczekoladki)
group by idpudelka) zysk
--2.
select sum(zamowienia.zysk) from
(SELECT idpudelka, sum(a.sztuk*(zysk.cena-zysk.koszt)) as zysk from
(select idpudelka, p.cena as cena, sum(z.sztuk*c.koszt) as koszt
from pudelka p natural join zawartosc z join czekoladki c using (idczekoladki)
group by idpudelka) zysk join artykuly a using(idpudelka)
group by idpudelka) zamowienia

--5.8
CREATE SEQUENCE lp START 1;
SELECT nextval('lp') as lp, p.idpudelka FROM pudelka p ORDER BY p.idpudelka ASC;
DROP SEQUENCE lp;
