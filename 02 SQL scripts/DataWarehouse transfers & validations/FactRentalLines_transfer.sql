/*
Transfer from Operational Database to DataWarehouse
Many to FactRentalLines
*/

USE RentalDataWarehouse;
SELECT * FROM FactRentalLine;

USE RentalDatabase;
SELECT * FROM RentalLine;
GO

USE RentalDataWarehouse;
GO

BEGIN TRAN;
INSERT INTO FactRentalLine (
    [rentalline_id],
    [transaction_id],
    [rental_station_id],
    [employee_id],
    [customer_id],
    [inventory_id],
    [equipment_id],
    [condition],
    [status],
    [line_price],
    [vat],
    [start_date],
    [end_date],
    [start_time],
    [end_time]
)
SELECT
    rl.rentalline_id,
    rt.transaction_id,
    rt.rental_station_id,
    rs.employee_id,
    rt.customer_id,
    i.inventory_id,
    i.equipment_id,
    i.[condition],
    i.[status],
    rl.line_price,
    rl.vat,
    CAST(CONVERT(char(8), rt.startdate, 112) AS int),
    CAST(CONVERT(char(8), rt.enddate, 112) AS int),
    rt.startdate,
    rt.enddate

FROM RentalDatabase.dbo.RentalLine rl
INNER JOIN RentalDatabase.dbo.Rental_transaction rt
    ON rl.transaction_id = rt.transaction_id
INNER JOIN RentalDatabase.dbo.Rental_station rs
    ON rt.rental_station_id = rs.station_id
INNER JOIN RentalDatabase.dbo.Inventory i
    ON rl.inventory_id = i.inventory_id
INNER JOIN RentalDatabase.dbo.Equipment e
    ON i.equipment_id = e.equipment_id

-- Blocking duplicates from being transferred
WHERE rentalline_id NOT IN (
    SELECT rentalline_id
    FROM RentalDataWarehouse.dbo.FactRentalLine
);
GO

USE RentalDataWarehouse;
SELECT * FROM FactRentalLine;

COMMIT;