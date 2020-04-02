--2.1
--1.
SELECT nazwa, ulica, miejscowosc FROM public.klienci
ORDER BY nazwa;
--2.
SELECT nazwa, ulica, miejscowosc FROM public.klienci
ORDER BY miejscowosc asc, nazwa;
--3.
SELECT k.nazwa, k.ulica, k.miejscowosc FROM public.klienci k
WHERE k.miejscowosc in ('Kraków', 'Warszawa')
ORDER BY k.miejscowosc desc, k.nazwa asc;
--4.
SELECT nazwa, ulica, miejscowosc from public.klienci
Order by miejscowosc desc;
--5.
SELECT nazwa, ulica, miejscowosc from public.klienci
Where miejscowosc='Kraków'
Order by nazwa;

--2.2
--1.
SELECT nazwa, masa FROM public.czekoladki
where masa>20
--2. 
SELECT nazwa, masa, koszt FROM public.czekoladki
where masa>20 and koszt>0.25
--3.
SELECT nazwa, masa, koszt*100 as kosztZł FROM public.czekoladki
where masa>20 and koszt>0.25
--4.
SELECT nazwa, czekolada, nadzienie, orzechy FROM public.czekoladki
where ((czekolada='mleczna' and nadzienie='maliny') OR
    (czekolada ='mleczna' AND nadzienie='truskawki') OR 
    (orzechy='laskowe' and czekolada not in('gorzka')))
--5.
SELECT nazwa, koszt FROM public.czekoladki
WHERE koszt>0.25

--6. 
SELECT nazwa, czekolada FROM public.czekoladki
WHERE czekolada in('mleczna', 'biała')

--2.3
SELECT 2^20
SELECT SQRT(3)
SELECT PI()

--2.4
--1.
SELECT IDCzekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa in(15,24)
--2.
SELECT IDCzekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE koszt in(0.25, 0.35)
--3.
SELECT IDCzekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE masa in(25, 35) OR koszt in(0.25, 0.35)

--2.5.
--1.
SELECT IDCzekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE orzechy is not null;
--2.
SELECT IDCzekoladki, nazwa, masa, koszt FROM public.czekoladki
WHERE orzechy is null;
--3.
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE orzechy is not null or nadzienie is not null;
--4.
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE czekolada in('mleczna', 'biała') AND orzechy is null;
--5.
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE czekolada not in('mleczna', 'biała') 
AND (orzechy is not null OR nadzienie is not null);
--6. 
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE nadzienie is not null
--7. 
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE nadzienie is null
--8.
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE nadzienie is null AND orzechy is null;
--9.
SELECT IDCzekoladki, nazwa, orzechy, nadzienie FROM public.czekoladki
WHERE nadzienie is null AND czekolada in('mleczna', 'biała');