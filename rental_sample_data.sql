--- Inventory
INSERT INTO Inventory VALUES
(1,'Good','Available',1),
(2,'Good','Rented',2),
(3,'Excellent','Available',3),
(4,'Fair','Maintenance',4),
(5,'Good','Available',5),
(6,'Excellent','Rented',6),
(7,'Good','Available',7),
(8,'Good','Available',8),
(9,'Fair','Available',9),
(10,'Excellent','Rented',10);



--- Customer
INSERT INTO Customer VALUES
(1,'Anna','Karlsson','Stockholm','anna@gmail.com','0701111111'),
(2,'Erik','Andersson','Göteborg','erik@gmail.com','0702222222'),
(3,'Sara','Nilsson','Malmö','sara@gmail.com','0703333333'),
(4,'Johan','Larsson','Uppsala','johan@gmail.com','0704444444'),
(5,'Emma','Svensson','Västerås','emma@gmail.com','0705555555'),
(6,'David','Berg','Örebro','david@gmail.com','0706666666'),
(7,'Maria','Lind','Linköping','maria@gmail.com','0707777777'),
(8,'Oskar','Holm','Lund','oskar@gmail.com','0708888888'),
(9,'Lisa','Persson','Helsingborg','lisa@gmail.com','0709999999'),
(10,'Simon','Ek','Gävle','simon@gmail.com','0701010101');



--- Employee
INSERT INTO Employee VALUES
(1,'Peter','Johansson','2021-03-01',32000,1),
(2,'Linda','Bergman','2020-05-15',35000,2),
(3,'Mikael','Olsson','2019-08-20',36000,3),
(4,'Sofia','Lundgren','2022-01-10',31000,4),
(5,'Andreas','Ekström','2023-02-01',30000,5),
(6,'Julia','Nordin','2021-09-15',34000,6),
(7,'Marcus','Hall','2020-11-01',33000,7),
(8,'Elin','Westin','2018-06-12',37000,8),
(9,'Fredrik','Palm','2022-04-04',31500,9),
(10,'Amanda','Nyberg','2024-01-15',29000,10);



--- Rental_station
INSERT INTO Rental_station VALUES
(1,'Stockholm Central','Sveavägen 1','Stockholm','Sweden','11111',1,1),
(2,'Göteborg City','Avenyn 5','Göteborg','Sweden','22222',1,2),
(3,'Malmö Center','Stortorget 3','Malmö','Sweden','33333',1,3),
(4,'Uppsala Hub','Kungsgatan 8','Uppsala','Sweden','44444',1,4),
(5,'Örebro Rental','Drottninggatan 2','Örebro','Sweden','55555',1,5),
(6,'Västerås Rental','Centralvägen 9','Västerås','Sweden','66666',1,6),
(7,'Linköping Rental','Torggatan 7','Linköping','Sweden','77777',1,7),
(8,'Lund Rental','Universitetsgatan 4','Lund','Sweden','88888',1,8),
(9,'Gävle Rental','Nygatan 12','Gävle','Sweden','99999',1,9),
(10,'Helsingborg Rental','Hamngatan 6','Helsingborg','Sweden','10101',1,10);



--- Rental_transaction
INSERT INTO Rental_transaction VALUES
(1,'2026-01-01','2026-01-05',240,1,1,2),
(2,'2026-01-03','2026-01-07',280,2,2,2),
(3,'2026-01-04','2026-01-08',180,3,3,4),
(4,'2026-01-06','2026-01-10',100,4,4,4),
(5,'2026-01-08','2026-01-12',320,5,5,6),
(6,'2026-01-10','2026-01-14',440,6,6,7),
(7,'2026-01-12','2026-01-16',120,7,7,8),
(8,'2026-01-14','2026-01-18',160,8,8,9),
(9,'2026-01-16','2026-01-20',80,9,9,10),
(10,'2026-01-18','2026-01-22',300,10,10,1);



--- Rental_lines
INSERT INTO RentalLines VALUES
(1,1,1,120,25),
(2,2,2,140,25),
(3,3,3,90,25),
(4,4,4,50,25),
(5,5,5,80,25),
(6,6,6,110,25),
(7,7,7,30,25),
(8,8,8,40,25),
(9,9,9,20,25),
(10,10,10,150,25);