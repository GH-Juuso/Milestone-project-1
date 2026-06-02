USE RentalDatabase;
SELECT TOP 10 *
FROM Rental_transaction;

USE RentalDataWarehouse;
SELECT TOP 10 *
FROM DimRental_transaction;


INSERT INTO DimRental_transaction
(
    transaction_id,
    rental_amount
)
SELECT
    rt.transaction_id,
    rt.rental_amount
FROM RentalDatabase.dbo.Rental_transaction;
