SELECT COUNT(*) AS OperationalCount
FROM RentalDatabase.dbo.Rental_transaction;

SELECT COUNT(*) AS DimCount
FROM DimRental_transaction;


SELECT transaction_id
FROM RentalDatabase.dbo.Rental_transaction

EXCEPT

SELECT transaction_id
FROM DimRental_transaction;
