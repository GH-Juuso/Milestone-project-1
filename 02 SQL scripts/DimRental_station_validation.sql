SELECT COUNT(*) AS OperationalCount
FROM RentalDatabase.dbo.Rental_station;

SELECT COUNT(*) AS DimCount
FROM DimRental_station;



SELECT station_id
FROM RentalDatabase.dbo.Rental_station

EXCEPT

SELECT station_id
FROM DimRental_station;
