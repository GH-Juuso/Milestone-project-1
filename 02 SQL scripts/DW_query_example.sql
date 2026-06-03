USE RentalDataWarehouse;


WITH FactTotals AS
(
    SELECT
        equipment_id,
        SUM(COALESCE(line_price, 0) + COALESCE(vat, 0)) AS fact_total_amount
    FROM FactRentalLine
    GROUP BY equipment_id
),
CategoryTotals AS
(
    SELECT
        de.category,
        de.subcategory,
        SUM(ft.fact_total_amount) AS total_amount

    FROM DimEquipment de
    JOIN FactTotals ft ON de.equipment_id = ft.equipment_id
    GROUP BY ROLLUP(de.category, de.subcategory)
)
SELECT
    ISNULL(category, 'All Sales') AScategory,
    ISNULL(subcategory, 'All Subcategories') AS subcategory,
    FORMAT(total_amount, 'C', 'en-us') AS sales_amount,
    FORMAT(total_amount / SUM(CASE WHEN subcategory IS NOT NULL THEN total_amount END) OVER (),'P2') AS amount_ratio

FROM CategoryTotals
ORDER BY
    category,
    total_amount DESC;