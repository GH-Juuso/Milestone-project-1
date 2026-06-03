INSERT INTO RentalDataWarehouse.dbo.DimDate
(
  date_key,
  dayname,
  day_number,
  week,
  monthname,
  month_number,
  year,
  date
)
SELECT
    CAST(CONVERT(char(8), startdate, 112) AS int) AS date_key,
    DATENAME(WEEKDAY, startdate) AS dayname,
    DATEPART(DAY, startdate) AS day_number,
    DATEPART(WEEK, startdate) AS week,
    DATENAME(MONTH, startdate) AS monthname,
    DATEPART(MONTH, startdate) AS month_number,
    YEAR(startdate) AS year,
    CAST(startdate AS date) AS date
FROM (
    SELECT DISTINCT CAST(startdate AS date) AS startdate
    FROM RentalDatabase.dbo.Rental_transaction
)d

-- Blocking duplicates from being transferred
WHERE startdate NOT IN (
    SELECT date
    FROM RentalDataWarehouse.dbo.DimDate
);

-- end date insertion :
INSERT INTO RentalDataWarehouse.dbo.DimDate
(
  date_key,
  dayname,
  day_number,
  week,
  monthname,
  month_number,
  year,
  date
)
SELECT
    CAST(CONVERT(char(8), enddate, 112) AS int) AS date_key,
    DATENAME(WEEKDAY, enddate) AS dayname,
    DATEPART(DAY, enddate) AS day_number,
    DATEPART(WEEK, enddate) AS week,
    DATENAME(MONTH, enddate) AS monthname,
    DATEPART(MONTH, enddate) AS month_number,
    YEAR(enddate) AS year,
    CAST(enddate AS date) AS date
FROM (
    SELECT DISTINCT CAST(enddate AS date) AS enddate
    FROM RentalDatabase.dbo.Rental_transaction
) d

-- Blocking duplicates from being transferred
WHERE enddate NOT IN (
    SELECT date
    FROM RentalDataWarehouse.dbo.DimDate
);

USE RentalDataWarehouse
SELECT * FROM DimDate;
