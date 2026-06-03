USE RentalDatabase;
GO
SELECT* FROM Rental_transaction;

BEGIN TRAN;
ALTER TABLE Rental_transaction
ALTER COLUMN startdate datetime;

ALTER TABLE Rental_transaction
ALTER COLUMN enddate datetime;
COMMIT

SELECT * FROM Rental_transaction

-- Create staging table
DROP TABLE IF EXISTS Rental_transaction_dates_staging
CREATE TABLE Rental_transaction_dates_staging (
    transaction_id INT PRIMARY KEY,
    startdate DATETIME NOT NULL,
    enddate DATETIME NOT NULL
);

-- Import CSV
BULK INSERT Rental_transaction_dates_staging
FROM 'C:\Users\sBTvR\Documents\Brights\Week 4 - DataWarehouse Miniproject\Github\Milestone-project-1\05 Big data samples\Rental_transaction_datetime.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

-- Update existing records
UPDATE rt
SET
    rt.startdate = s.startdate,
    rt.enddate = s.enddate
FROM Rental_transaction rt
INNER JOIN Rental_transaction_dates_staging s
    ON rt.transaction_id = s.transaction_id;

-- Validation
SELECT
    COUNT(*) AS UpdatedRows
FROM Rental_transaction rt
INNER JOIN Rental_transaction_dates_staging s
    ON rt.transaction_id = s.transaction_id;

-- Optional: inspect a sample
SELECT TOP 10
    transaction_id,
    startdate,
    enddate
FROM Rental_transaction
ORDER BY transaction_id;

-- Cleanup
DROP TABLE Rental_transaction_dates_staging;

SELECT * FROM Rental_transaction
