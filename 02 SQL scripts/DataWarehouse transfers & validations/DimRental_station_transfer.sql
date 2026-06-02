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
FROM RentalDatabase.dbo.Rental_station AS rs
    WHERE NOT EXISTS (
    SELECT 1
    FROM DimRental_station AS drs
    WHERE drs.station_id = rs.station_id
);
