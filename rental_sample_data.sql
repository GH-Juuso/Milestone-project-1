USE RentalDatabase;

INSERT INTO Customer VALUES
(1,'Emma','Smith','emma.smith@example.com',111111111),
(2,'Liam','Johnson','liam.j@example.com',222222222),
(3,'Noah','Brown','noah.b@example.com',333333333),
(4,'Olivia','Davis','olivia.d@example.com',444444444),
(5,'Ava','Wilson','ava.w@example.com',555555555),
(6,'Sophia','Taylor','sophia.t@example.com',666666666),
(7,'Mason','Anderson','mason.a@example.com',777777777),
(8,'Isabella','Thomas','isabella.t@example.com',888888888),
(9,'Lucas','Martin','lucas.m@example.com',999999999),
(10,'Mia','Garcia','mia.g@example.com',123456789);

INSERT INTO Equipment VALUES
(1,'City E-Bike','Vehicle','Bike','Electric Bike',18.00,20,850.00),
(2,'Mountain E-Bike','Vehicle','Bike','Electric Bike',25.00,12,1200.00),
(3,'Cargo E-Bike','Vehicle','Bike','Electric Bike',30.00,8,1800.00),
(4,'Standard E-Scooter','Vehicle','Scooter','Electric Scooter',15.00,25,500.00),
(5,'Long Range E-Scooter','Vehicle','Scooter','Electric Scooter',22.00,15,750.00),
(6,'Kids Helmet','Safety','Helmet','Protective Gear',5.00,40,25.00),
(7,'Adult Helmet','Safety','Helmet','Protective Gear',6.00,60,35.00),
(8,'Reflective Vest','Safety','Vest','Protective Gear',4.00,50,15.00),
(9,'Knee Pads','Safety','Pads','Protective Gear',4.50,35,20.00),
(10,'Phone Holder','Accessory','Mount','Bike Accessory',3.00,30,12.00);

INSERT INTO Employee VALUES
(0,'Dummy','Employee','2000-01-01',0.00),
(1,'John','Miller','2021-03-15',32000.00),
(2,'Sarah','Clark','2020-06-20',35000.00),
(3,'David','Lopez','2022-01-10',31000.00),
(4,'Anna','Lee','2019-09-05',38000.00),
(5,'James','Walker','2023-02-18',30000.00),
(6,'Laura','Hall','2021-11-25',34000.00),
(7,'Daniel','Young','2020-04-30',36000.00),
(8,'Nina','King','2022-07-12',31500.00),
(9,'Oscar','Scott','2023-05-01',29500.00);

INSERT INTO Rental_station VALUES
(1,1,'10 Main St','Paris','France',75001,1),
(2,2,'22 Market Rd','London','UK',10001,1),
(3,3,'5 Ocean Ave','Barcelona','Spain',8001,1),
(4,0,'88 Central Sq','Berlin','Germany',10115,0),
(5,4,'14 King St','Toronto','Canada',12345,1),
(6,5,'7 Harbour Rd','Sydney','Australia',2000,1),
(7,0,'99 Beach Blvd','Dubai','UAE',54321,0),
(8,6,'31 River St','Amsterdam','Netherlands',1000,1),
(9,7,'45 Lake Ave','Tokyo','Japan',1600022,1),
(10,0,'12 Hill Road','Cape Town','South Africa',8001,0);

INSERT INTO Inventory VALUES
(1,'Good','Available',1),
(2,'Excellent','Available',2),
(3,'Good','Rented',3),
(4,'Fair','Maintenance',4),
(5,'Excellent','Available',5),
(6,'Good','Available',6),
(7,'Good','Rented',7),
(8,'Excellent','Available',8),
(9,'Fair','Available',9),
(10,'Good','Maintenance',10);

INSERT INTO Rental_transaction VALUES
(1,1,2,1,'2026-01-05','2026-01-05',24.00),
(2,2,2,2,'2026-01-06','2026-01-06',18.00),
(3,3,4,3,'2026-01-07','2026-01-08',45.00),
(4,4,1,4,'2026-01-08','2026-01-08',15.00),
(5,5,6,5,'2026-01-09','2026-01-10',60.00),
(6,6,6,6,'2026-01-10','2026-01-10',10.00),
(7,7,8,7,'2026-01-11','2026-01-11',28.00),
(8,8,9,8,'2026-01-12','2026-01-12',22.00),
(9,9,10,9,'2026-01-13','2026-01-14',50.00),
(10,10,1,10,'2026-01-14','2026-01-14',12.00);

INSERT INTO RentalLine VALUES
(1,1,1,18.00,3.60),
(2,2,2,25.00,5.00),
(3,3,3,30.00,6.00),
(4,4,4,15.00,3.00),
(5,5,5,22.00,4.40),
(6,6,6,5.00,1.00),
(7,7,7,6.00,1.20),
(8,8,8,4.00,0.80),
(9,9,9,4.50,0.90),
(10,10,10,3.00,0.60);