--1.3
--5
SELECT nazwa, czekolada FROM public.czekoladki
WHERE czekolada ='mleczna';
SELECT nazwa, czekolada, orzechy FROM public.czekoladki
WHERE czekolada ='mleczna' and orzechy='laskowe';
SELECT nazwa, czekolada, orzechy FROM public.czekoladki
WHERE czekolada in ('mleczna','gorzka')
SELECT nazwa, czekolada, masa FROM public.czekoladki
WHERE masa>25
--6.
SELECT nazwa, miejscowosc FROM public.klienci
WHERE miejscowosc in('Gdańsk', 'Kraków', 'Warszawa')
SELECT nazwa, miejscowosc FROM public.klienci
WHERE miejscowosc NOT IN ('Gdańsk')
SELECT nazwa, ulica FROM public.klienci
WHERE ulica like 'Akacjowa %'

