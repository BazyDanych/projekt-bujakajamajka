CREATE DATABASE Hotele;

USE Hotele;

CREATE TABLE `Hotel` (
	`hotel_id` INT NOT NULL,
	`rezerwacja_id` INT NOT NULL,
	`pokoj_id` INT NOT NULL,
	`posilki_id` INT NOT NULL,
	`ocena_id` INT NOT NULL,
	`lokalizacja_id` INT NOT NULL,
	`czy_istnieje_parking` BOOLEAN NOT NULL,
	`czy_istnieje_sala_konf` BOOLEAN NOT NULL,
	`czy_istnieje_basen` BOOLEAN NOT NULL,
	`czy_istnieje_silownia` BOOLEAN NOT NULL,
	`Nazwa` varchar (255) NOT NULL,
	`Gwiazdki` INT NOT NULL,
	`przyjazny_zwierzeta` BOOLEAN NOT NULL,
	`przyjazny_niepelnosprawnym` BOOLEAN NOT NULL,
	PRIMARY KEY (`hotel_id`)
);

CREATE TABLE `Pokoj` (
	`pokoj_id` INT NOT NULL,
	`Numer` INT NOT NULL,
	`Pietro` INT NOT NULL,
	`Rozmiar` INT NOT NULL,
	`Ilosc_lozek` INT NOT NULL,
	`Cena_za_noc` INT NOT NULL,
	`czy_jest_wifi` BOOLEAN NOT NULL,
	`czy_dla_palacych` BOOLEAN NOT NULL,
	`czy_wlasna_lazienka` BOOLEAN NOT NULL,
	`czy_balkon` BOOLEAN NOT NULL,
	`czy_wolny` BOOLEAN NOT NULL,
	PRIMARY KEY (`pokoj_id`)
);

CREATE TABLE `Rezerwacja` (
	`rezerwacja_id` INT NOT NULL,
	`hotel_id` INT NOT NULL,
	`uzytkownik_id` INT NOT NULL,
	`Data_rezerwacji` DATE NOT NULL,
	`Ilosc_nocy` INT NOT NULL,
	`Czy_zaplacono` BOOLEAN NOT NULL,
	PRIMARY KEY (`rezerwacja_id`)
);

CREATE TABLE `Uzytkownik` (
	`uzytkownik_id` INT NOT NULL,
	`Imie` TEXT NOT NULL,
	`Nazwisko` TEXT NOT NULL,
	`Nr_Paszportu` INT NOT NULL,
	`Data_urodzenia` DATE NOT NULL,
	`email` TEXT NOT NULL,
	`nr_telefonu` INT NOT NULL,
	`Narodowosc` TEXT NOT NULL,
	PRIMARY KEY (`uzytkownik_id`)
);

CREATE TABLE `Oceny` (
	`ocena_id` INT NOT NULL AUTO_INCREMENT,
	`Ocena` INT NOT NULL,
	`Komentarz` TEXT NOT NULL,
	PRIMARY KEY (`ocena_id`)
);

CREATE TABLE `Lokalizacja` (
	`lokalizacja_id` INT NOT NULL,
	`Kraj` varchar(255) NOT NULL,
	`Miejscowosc` varchar(255) NOT NULL,
	`Ulica` varchar(255) NOT NULL,
	`Kod_Poczkowy` INT(255) NOT NULL,
	`Nr_budynku` INT(255) NOT NULL,
	`Nr_lokalu` INT(255) NOT NULL,
	PRIMARY KEY (`lokalizacja_id`)
);

CREATE TABLE `Lokalizacja_Atrakcje` (
	`id_lokalizacja` INT NOT NULL,
	`id_atrakcje` INT NOT NULL
);

CREATE TABLE `Atrakcje` (
	`id_atrakcje` INT NOT NULL,
	`id_koszty` INT NOT NULL,
	`stale/tymczasowe` INT NOT NULL,
	`Godziny_otwarcia` varchar(255) NOT NULL,
	`Przyjazny_zwierzeta` BOOLEAN NOT NULL,
	`Przyjazny_niepelnosprawnym` BOOLEAN NOT NULL,
	`Przyjazny_dzieciom` BOOLEAN NOT NULL,
	PRIMARY KEY (`id_atrakcje`)
);

CREATE TABLE `Posilki` (
	`id_posilki` INT NOT NULL,
	`id_menu` INT NOT NULL,
	`czy_samoobsluga` BOOLEAN NOT NULL,
	`oferta_sniadaniowa` BOOLEAN NOT NULL,
	`oferta_obiadowa` BOOLEAN NOT NULL,
	`oferta_kolacyjna` BOOLEAN NOT NULL,
	`godziny_obslugi` varchar(255) NOT NULL,
	PRIMARY KEY (`id_posilki`)
);

CREATE TABLE `Koszty` (
	`id_koszty` INT NOT NULL,
	`Bilet_normalny` INT NOT NULL,
	`Bilet_ulgowy` INT NOT NULL,
	PRIMARY KEY (`id_koszty`)
);

CREATE TABLE `Menu` (
	`menu_id` INT NOT NULL,
	`danie_id` INT NOT NULL,
	`przekaski_id` INT NOT NULL,
	`napoje_id` INT NOT NULL,
    PRIMARY KEY (`menu_id`)
);

CREATE TABLE `Jedzenie` (
	`jedzenie_id` INT NOT NULL,
	`Nazwa` VARCHAR (255) NOT NULL,
	`Koszt` INT NOT NULL,
	`Rozmiar_porcji` INT NOT NULL,
	`czy_weganskie` BOOLEAN NOT NULL,
	`czy_alkoholowe` BOOLEAN NOT NULL,
	PRIMARY KEY (`jedzenie_id`)
);

ALTER TABLE Hotel ADD CONSTRAINT hotel_fk0 FOREIGN KEY (rezerwacja_id) REFERENCES Rezerwacja(rezerwacja_id);
ALTER TABLE Hotel ADD CONSTRAINT hotel_fk1 FOREIGN KEY (pokoj_id) REFERENCES Pokoj(pokoj_id);
ALTER TABLE Hotel ADD CONSTRAINT hotel_fk2 FOREIGN KEY (posilki_id) REFERENCES Posilki(id_posilki);
ALTER TABLE Hotel ADD CONSTRAINT hotel_fk3 FOREIGN KEY (ocena_id) REFERENCES Oceny(ocena_id);
ALTER TABLE Hotel ADD CONSTRAINT hotel_fk4 FOREIGN KEY (lokalizacja_id) REFERENCES Lokalizacja(lokalizacja_id);

ALTER TABLE Rezerwacja ADD CONSTRAINT rezerwacja_fk0 FOREIGN KEY (rezerwacja_id) REFERENCES Hotel(hotel_id);
ALTER TABLE Rezerwacja ADD CONSTRAINT rezerwacja_fk1 FOREIGN KEY (uzytkownik_id) REFERENCES Uzytkownik(uzytkownik_id);

ALTER TABLE lokalizacja_atrakcje ADD CONSTRAINT lokalizacja_atrakcje_fk0 FOREIGN KEY (id_lokalizacja) REFERENCES Lokalizacja(lokalizacja_id);
ALTER TABLE lokalizacja_atrakcje ADD CONSTRAINT lokalizacja_atrakcje_fk1 FOREIGN KEY (id_atrakcje) REFERENCES Atrakcje(id_atrakcje);

ALTER TABLE Atrakcje ADD CONSTRAINT Atrakcje_fk0 FOREIGN KEY (id_koszty) REFERENCES Koszty(id_koszty);

ALTER TABLE Posilki ADD CONSTRAINT posilki_fk0 FOREIGN KEY (id_menu) REFERENCES Menu(menu_id);

ALTER TABLE Menu ADD CONSTRAINT menu_fk0 FOREIGN KEY (danie_id) REFERENCES Jedzenie(jedzenie_id);
ALTER TABLE Menu ADD CONSTRAINT menu_fk1 FOREIGN KEY (przekaski_id) REFERENCES Jedzenie(jedzenie_id);
ALTER TABLE Menu ADD CONSTRAINT menu_fk2 FOREIGN KEY (napoje_id) REFERENCES Jedzenie(jedzenie_id);