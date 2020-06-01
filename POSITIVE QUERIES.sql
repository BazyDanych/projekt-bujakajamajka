/* Pokazuje numery wolnych pokoi*/

SELECT Numer FROM Pokoj WHERE Czy_wolny = TRUE;

/* Pokazuje imiona i nazwiska zarejestrowanych Rumunów */

SELECT Imie,Nazwisko FROM Uzytkownik WHERE NARODOWOSC = 'Rumunska';

/* Pokazuje hotele, w których są wolne pokoje */

SELECT Nazwa, Numer, Cena_za_noc
FROM Hotel, Pokoj
WHERE Czy_wolny = TRUE
GROUP BY Nazwa

/* Pokazuje hotele w Islamabadzie, mające powyżej 4 gwiazdek, w których nadal są wolne pokoje */

SELECT Nazwa, Miejscowosc, Cena_za_noc
FROM Hotel, Lokalizacja, Pokoj
WHERE Miejscowosc = 'Islamabad' AND Gwiazdki > 4 AND Czy_wolny = TRUE
GROUP BY Cena_za_noc

/* Hotele nieprzyjazne dla zwierzat, ale za to z wolnym pokojem z wifi */

SELECT Nazwa FROM Hotel, Pokoj
WHERE Hotel.Przyjazny_zwierzeta = FALSE AND Pokoj.Czy_jest_wifi = TRUE AND Pokoj.Czy_wolny = TRUE
GROUP BY Nazwa
