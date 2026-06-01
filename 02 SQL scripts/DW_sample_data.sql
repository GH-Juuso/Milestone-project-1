-- DimCustomer
INSERT INTO DimCustomer VALUES
(1,'Anna','Andersson','anna@gmail.com',123456789),
(2,'Erik','Johansson','erik@gmail.com',234567891),
(3,'Sara','Nilsson','sara@gmail.com',345678912);

-- DimEquipment
INSERT INTO DimEquipment VALUES
(1,'E-Bike X1','Bike','Electric','E-Bike',25.00,1200.00),
(2,'E-Scooter S1','Scooter','Electric','E-Scooter',15.00,800.00),
(3,'Helmet H1','Safety','Protection','Helmet',5.00,50.00);

-- DimEmployee
INSERT INTO DimEmployee VALUES
(1,'John','Smith','2022-01-15',35000),
(2,'Emma','Brown','2023-03-10',32000);

-- DimRental_transaction
INSERT INTO DimRental_transaction VALUES
(1001,50.00),
(1002,30.00),
(1003,75.00);

-- DimRental_station
INSERT INTO DimRental_station VALUES
(1,'Main Street 1','Stockholm','Sweden',11122,1),
(2,'Central Square','Gothenburg','Sweden',22233,1);

-- DimDate
INSERT INTO DimDate VALUES
(20260101,'Thursday',1,'January',2026,'2026-01-01'),
(20260102,'Friday',1,'January',2026,'2026-01-02'),
(20260103,'Saturday',1,'January',2026,'2026-01-03');

-- FactRentalLine
INSERT INTO FactRentalLine VALUES
(1,1001,1,1,1,101,1,'Good','Returned',50.00,12.50,20260101,20260102),
(2,1002,1,2,2,102,2,'Good','Active',30.00,7.50,20260102,20260103),
(3,1003,2,1,3,103,1,'Excellent','Returned',75.00,18.75,20260101,20260103);
