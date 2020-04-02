--LAB 6
--6.1
--1.
INSERT INTO czekoladki VALUES ('w98', 'Biały kieł', ' biała', 'laskowe', 'marcepan', 'Rozpływające się w rękach i kieszeniach', '0.45', '20')
--6.2
INSERT INTO czekoladki VALUES ('X91', 'Nieznana Nieznajoma', NULL, NULL, NULL, 'Niewidzialna czekoladka wspomagajaca odchudzanie.,', 0.26, 0)

INSERT INTO czekoladki VALUES ('M98', 'Mleczny Raj', 'mleczna', NULL, NULL, 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,', 0.26, 36)
--6.3
--1.
DELETE FROM czekoladki WHERE idczekoladki = 'X91' OR idczekoladki = 'M98'
--3.
INSERT INTO czekoladki (idczekoladki, nazwa, opis, koszt, masa) VALUES ('X91', 'Nieznana Nieznajoma', 'Niewidzialna czekoladka wspomagająca odchudzanie.,', 0.26, 36)
--6.4
--1.
UPDATE klienci SET nazwa='Iza Nowak' WHERE nazwa ~'Iza Matusiak' 
--2.
UPDATE czekoladki SET koszt=(0.9*koszt) 
WHERE idczekoladki IN ('W98','M98','X91')
--3.
UPDATE czekoladki SET 
koszt = (SELECT koszt FROM czekoladki WHERE idczekoladki = 'W98') 
WHERE nazwa = 'Nieznana Nieznajoma';
--4.
UPDATE klienci SET miejscowosc='Piotrograd'
WHERE miejscowosc= 'Leningrad'
--5.
UPDATE czekoladki cz SET koszt = cz.koszt + 0.15 
WHERE substr(cz.idczekoladki, 2, 2)::int > 90

--6.5
--1.
DELETE  FROM klienci WHERE nazwa LIKE 'Matusiak %'
--2. 
DELETE  FROM klienci WHERE idklienta>91
--3.
DELETE  FROM czekoladki WHERE koszt>=0.45 OR masa>=36 OR masa=0

--6.6
INSERT INTO pudelka (
    idpudelka,
    nazwa,
    opis,
    cena, 
    stan
)  VALUES (
    '0001',
    'Cukiernia1',
    'Pyszne',
     20,
     100
), (
    '0002',
    'Cukiernia2',
    'Bardzo pyszne',
     12,
     700
);

INSERT INTO zawartosc (
    idpudelka,
    idczekoladki, 
    sztuk
) VALUES ( 
    '0001',
    'b02',
     4 
), (
    '0001',
    'm09',
     4 
), (
    '0001',
    'b03', 
    4
 ), (
    '0001', 
    'b05', 
    4 
), (
    '0002',
    'm09',
     4 
), (
    '0002',
    'b03', 
    4
 ), (
    '0002', 
    'b05', 
    4 
), (
    '0002', 
    'b05', 
    4 
)

--6.8
--1.
update zawartosc set sztuk = sztuk + 1
where idpudelka in ('0001');
--2.
update czekoladki set czekolada = 'brak'
where czekolada is null;
update czekoladki set orzechy = 'brak'
where orzechy is null;
update czekoladki set nadzienie = 'brak'
where nadzienie is null;
--3
update czekoladki set czekolada = null
where czekolada = 'brak';
update czekoladki set orzechy = null
where orzechy = 'brak';
update czekoladki set nadzienie = null
where nadzienie = 'brak';

