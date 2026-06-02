-- Transfer Employee data from the operational database to the data warehouses dimensional table

INSERT INTO RentalDataWarehouse.dbo.DimEmployee
(
    employee_id,
    firstname,
    lastname,
    hiring_date,
    salary
)
SELECT
    employee_id,
    firstname,
    lastname,
    hiring_date,
    salary
FROM RentalDatabase.dbo.Employee

-- Blocking duplicates from being transferred
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM RentalDataWarehouse.dbo.DimEmployee
);