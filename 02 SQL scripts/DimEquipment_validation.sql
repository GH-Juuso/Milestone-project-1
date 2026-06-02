/*
Validation from Operational Database to DataWarehouse
Equipment to DimEquipment
no quantity needed because we don't want that for market analysis
*/

USE RentalDataWarehouse;

SELECT
    e.EquipmentID AS SourceEquipmentID,
    de.EquipmentID AS DWEquipmentID
FROM DimEquipment de
RIGHT OUTER JOIN RentalDatabase.dbo.Equipment e
    ON de.EquipmentID = e.EquipmentID
WHERE de.EquipmentID IS NULL;