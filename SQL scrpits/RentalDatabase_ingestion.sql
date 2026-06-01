USE RentalDatabase;
GO

/* 
Ingestion script for generated rental CSVs.

Expected files in the same folder:
- Customer.csv
- Equipment.csv
- Employee.csv
- Rental_station.csv
- Inventory.csv
- Rental_transaction.csv
- RentalLine.csv

Edit @CsvFolder before running.
*/

DECLARE @CsvFolder NVARCHAR(4000) = N'C:\path\to\csv\folder\';

-- Load order respects foreign keys:
-- 1 Employee
-- 2 Customer
-- 3 Equipment
-- 4 Rental_station
-- 5 Inventory
-- 6 Rental_transaction
-- 7 RentalLine

BULK INSERT Employee
FROM 'C:\path\to\csv\folder\Employee.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT Customer
FROM 'C:\path\to\csv\folder\Customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT Equipment
FROM 'C:\path\to\csv\folder\Equipment.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT Rental_station
FROM 'C:\path\to\csv\folder\Rental_station.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT Inventory
FROM 'C:\path\to\csv\folder\Inventory.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT Rental_transaction
FROM 'C:\path\to\csv\folder\Rental_transaction.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

BULK INSERT RentalLine
FROM 'C:\path\to\csv\folder\RentalLine.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

-- Basic validation
SELECT 'Employee' AS table_name, COUNT(*) AS row_count FROM Employee
UNION ALL SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL SELECT 'Equipment', COUNT(*) FROM Equipment
UNION ALL SELECT 'Rental_station', COUNT(*) FROM Rental_station
UNION ALL SELECT 'Inventory', COUNT(*) FROM Inventory
UNION ALL SELECT 'Rental_transaction', COUNT(*) FROM Rental_transaction
UNION ALL SELECT 'RentalLine', COUNT(*) FROM RentalLine;
GO
