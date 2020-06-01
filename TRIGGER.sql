/* Za kazdym razem kiedy dodawana jest nowa rezerwacja data rezerwacji ustawiana jest na dzien dzisiejszy */

CREATE TRIGGER data_rezerwacji
BEFORE INSERT ON Rezerwacja
FOR EACH ROW
SET NEW.data_rezerwacji = now();