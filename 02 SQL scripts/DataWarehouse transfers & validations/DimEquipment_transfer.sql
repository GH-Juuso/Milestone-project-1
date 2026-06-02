/*
Transfer from Operational Database to DataWarehouse
Equipment to DimEquipment
no quantity needed because we don't want that for market analysis
*/

USE RentalDataWarehouse;
SELECT * FROM DimEquipment;

USE RentalDatabase;
SELECT * FROM Equipment;
GO

USE RentalDataWarehouse;

INSERT INTO DimEquipment (
    equipment_id,
    name,
    category,
    subcategory,
    type,
    rental_price,
    procurement_cost
)
SELECT
    equipment_id,
    name,
    category,
    subcategory,
    type,
    rental_price,
    procurement_cost
FROM RentalDatabase.dbo.Equipment

-- Blocking duplicates from being transferred
WHERE equipment_id NOT IN (
    SELECT equipment_id
    FROM RentalDataWarehouse.dbo.DimEquipment
);
GO

USE RentalDataWarehouse;
SELECT * FROM DimEquipment;