/*
Validation from Operational Database to DataWarehouse
Many to FactRentalLines
*/

USE RentalDataWarehouse;
GO

-- 1. Missing rental_line_id or different from Operational DB
SELECT f.rentalline_id
FROM FactRentalLine f
FULL JOIN RentalDatabase.dbo.RentalLine rl
    ON f.rentalline_id = rl.rentalline_id
WHERE f.rentalline_id IS NULL or rl.rentalline_id IS NULL;
GO

-- 2. Missing transaction_id from DimRental_transaction
SELECT 
    f.rentalline_id, 
    f.transaction_id as Fact_transaction_id, 
    rt.transaction_id as Dim_transaction_id
FROM FactRentalLine f
FULL JOIN DimRental_transaction rt
    ON f.transaction_id = rt.transaction_id
WHERE f.rentalline_id IS NULL or rt.transaction_id IS NULL;
GO

-- Remove eroneous transactions
BEGIN TRAN;
FROM DimRental_transaction rt
LEFT JOIN FactRentalLine f
    ON rt.transaction_id = f.transaction_id
WHERE f.transaction_id IS NULL;

SELECT 
    f.rentalline_id, 
    f.transaction_id as Fact_transaction_id, 
    rt.transaction_id as Dim_transaction_id
FROM FactRentalLine f
FULL JOIN DimRental_transaction rt
    ON f.transaction_id = rt.transaction_id
WHERE f.rentalline_id IS NULL or rt.transaction_id IS NULL;
GO
COMMIT;


-- 3. Missing station_id from Operational DB
SELECT f.rental_station_id
FROM FactRentalLine f
FULL JOIN DimRental_station rs
    ON f.rental_station_id = rs.station_id
WHERE f.rentalline_id IS NULL or rs.station_id IS NULL;
GO

-- 4. Missing employee_id from Operational DB
SELECT
    f.rentalline_id,
    f.employee_id as Fact_employee_id,
    e.employee_id as Dim_employee_id
FROM FactRentalLine f
FULL JOIN DimEmployee e
    ON f.employee_id = e.employee_id
WHERE f.rentalline_id IS NULL or e.employee_id IS NULL;
GO

-- remove additional employees
BEGIN TRAN;
DELETE de
FROM DimEmployee de
LEFT JOIN FactRentalLine f
    ON de.employee_id = f.employee_id
WHERE f.employee_id IS NULL;

SELECT
    f.rentalline_id,
    f.employee_id as Fact_employee_id,
    e.employee_id as Dim_employee_id
FROM FactRentalLine f
FULL JOIN DimEmployee e
    ON f.employee_id = e.employee_id
WHERE f.rentalline_id IS NULL or e.employee_id IS NULL;
GO
COMMIT;


-- 5. Missing customer_id from Operational DB
SELECT
    f.rentalline_id,
    f.customer_id as Fact_customer_id,
    c.customer_id as Dim_customer_id
FROM FactRentalLine f
FULL JOIN DimCustomer c
    ON f.customer_id = c.customer_id
WHERE f.rentalline_id IS NULL or c.customer_id IS NULL;
GO

-- remove additional customers
BEGIN TRAN;
DELETE dc
FROM DimCustomer dc
LEFT JOIN FactRentalLine f
    ON dc.customer_id = f.customer_id
WHERE f.customer_id IS NULL;

SELECT
    f.rentalline_id,
    f.customer_id as Fact_customer_id,
    c.customer_id as Dim_customer_id
FROM FactRentalLine f
FULL JOIN DimCustomer c
    ON f.customer_id = c.customer_id
WHERE f.rentalline_id IS NULL or c.customer_id IS NULL;
GO
COMMIT;

-- 6. Missing equipment_id from Operational DB
SELECT f.equipment_id
FROM FactRentalLine f
RIGHT OUTER JOIN DimEquipment eq
    ON f.equipment_id = eq.equipment_id
WHERE f.rentalline_id IS NULL or eq.equipment_id IS NULL;
GO

-- 7. Validate start_date key exists in DimDate
SELECT f.start_date
FROM FactRentalLine f
LEFT JOIN DimDate d
    ON f.start_date = d.date_key
WHERE d.date_key IS NULL;
GO

-- 8. Validate end_date key exists in DimDate
SELECT f.end_date
FROM FactRentalLine f
LEFT JOIN DimDate d
    ON f.end_date = d.date_key
WHERE d.date_key IS NULL;
GO

-- 9. Line count per transaction comparision between Operational DB and DataWarehouse
WITH OperationalCounts AS (
    SELECT
        transaction_id,
        COUNT(*) AS operational_line_count
    FROM RentalDatabase.dbo.RentalLine
    GROUP BY transaction_id
),
WarehouseCounts AS (
    SELECT
        transaction_id,
        COUNT(*) AS warehouse_line_count
    FROM FactRentalLine
    GROUP BY transaction_id
)
SELECT
    COALESCE(o.transaction_id, w.transaction_id) AS transaction_id,
    o.operational_line_count,
    w.warehouse_line_count
FROM OperationalCounts o
FULL OUTER JOIN WarehouseCounts w
    ON o.transaction_id = w.transaction_id
WHERE ISNULL(o.operational_line_count, 0)
    <> ISNULL(w.warehouse_line_count, 0);
GO

-- 10. Line + VAT sum per transaction comparision between Operational DB and DataWarehouse
USE RentalDataWarehouse;
GO

WITH OperationalTotals AS (
    SELECT
        transaction_id,
        SUM(line_price + vat) AS operational_total_amount
    FROM RentalDatabase.dbo.RentalLine
    GROUP BY transaction_id
),
WarehouseTotals AS (
    SELECT
        transaction_id,
        SUM(line_price + vat) AS warehouse_total_amount
    FROM FactRentalLine
    GROUP BY transaction_id
)
SELECT
    COALESCE(o.transaction_id, w.transaction_id) AS transaction_id,
    o.operational_total_amount,
    w.warehouse_total_amount,
    ISNULL(o.operational_total_amount, 0)
        - ISNULL(w.warehouse_total_amount, 0) AS difference
FROM OperationalTotals o
FULL OUTER JOIN WarehouseTotals w
    ON o.transaction_id = w.transaction_id
WHERE ISNULL(o.operational_total_amount, 0)
    <> ISNULL(w.warehouse_total_amount, 0);
GO

-- 11. Line + VAT sum per transaction comparision between calculated and stored amount in DimRental_transaction
WITH FactTotals AS (
    SELECT
        transaction_id,
        SUM(COALESCE(line_price,0) + COALESCE(vat,0)) AS fact_total_amount
    FROM FactRentalLine
    GROUP BY transaction_id
)
SELECT
    rt.transaction_id,
    rt.rental_amount,
    ft.fact_total_amount,
    ft.fact_total_amount - rt.rental_amount AS difference
FROM DimRental_transaction rt
LEFT JOIN FactTotals ft
    ON rt.transaction_id = ft.transaction_id
WHERE ISNULL(ft.fact_total_amount, 0) <> ISNULL(rt.rental_amount, 0);
GO