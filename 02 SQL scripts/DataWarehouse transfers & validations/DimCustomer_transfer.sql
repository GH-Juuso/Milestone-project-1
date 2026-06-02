-- Transfer Customer data from the operational database to the data warehouses dimensional table

INSERT INTO RentalDataWarehouse.dbo.DimCustomer
(
    customer_id,
    firstname,
    lastname,
    email,
    phone_number
)
SELECT
    customer_id,
    firstname,
    lastname,
    email,
    phone_number
FROM RentalDatabase.dbo.Customer

-- Blocking duplicates from being transferred
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM RentalDataWarehouse.dbo.DimCustomer
);

-- With every column in the table defined as NOT NULL no further validation should be necessary.