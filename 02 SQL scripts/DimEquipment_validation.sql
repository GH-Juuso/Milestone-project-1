/*
Validation from Operational Database to DataWarehouse
Equipment to DimEquipment
no quantity needed because we don't want that for market analysis
*/

USE RentalDataWarehouse;

SELECT
    e.equipment_id AS SourceEquipmentID,
    de.equipment_id AS DWEquipmentID
FROM DimEquipment as de
RIGHT OUTER JOIN RentalDatabase.dbo.Equipment as e
    ON de.equipment_id = e.equipment_id
WHERE de.equipment_id IS NULL;