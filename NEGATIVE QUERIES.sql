/* Pokazuje nazwy hoteli i numery pokojow nie znajdujacych sie na 1 pietrze */

SELECT Nazwa,Numer
FROM Pokoj, Hotel
WHERE Pietro NOT IN (1)

/* Pokazuje tych uzytkownikow ktorzy nie pochodza z Rumunii */

SELECT Imie,Nazwisko
FROM Uzytkownik
WHERE Narodowosc NOT IN ('Rumunska')

