USE RentalDataWarehouse;
SELECT * FROM DimRental_station;

USE RentalDatabase;
SELECT * FROM Rental_station;
GO


USE RentalDataWarehouse;


INSERT INTO DimRental_station
(
    station_id,
    address,
    city,
    country,
    postal_code,
    staffed
)
SELECT
    station_id,
    address,
    city,
    country,
    postal_code,
    staffed
FROM RentalDatabase.dbo.Rental_station;
GO



USE RentalDataWarehouse;
SELECT * FROM DimRental_station;
