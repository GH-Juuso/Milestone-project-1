# Validation Documentation

## Overview

Validation was performed after each transfer to ensure that the data warehouse contains complete and accurate data from the operational database.

The validation process verifies:

* Record completeness
* Referential integrity
* Fact-to-dimension consistency
* Aggregated value consistency
* Transaction totals

---

# DimEquipment Validation

The validation compares equipment records between the operational database and the data warehouse.

Purpose:

* Verify that all equipment records have been transferred.
* Detect missing equipment IDs in `DimEquipment`.

Validation query:

* Compare `equipment_id` from `Equipment` and `DimEquipment`.
* Return any records that exist in the operational database but not in the data warehouse.

Expected result:

* No rows returned.

---

# DimRental_station Validation

Two validation checks are performed.

### Row Count Validation

The total number of rental stations in the operational database is compared with the total number of records in `DimRental_station`.

Purpose:

* Verify that all stations have been transferred.

Expected result:

* Both counts should be identical.

### Missing Station Validation

An `EXCEPT` query compares station IDs between source and destination.

Purpose:

* Detect any station IDs missing from the dimension table.

Expected result:

* No rows returned.

---

# DimRental_transaction Validation

Two validation checks are performed.

### Row Count Validation

The total number of transactions in the operational database is compared with the total number of records in `DimRental_transaction`.

Expected result:

* Both counts should match.

### Missing Transaction Validation

An `EXCEPT` query compares transaction IDs between source and destination.

Purpose:

* Identify missing transactions in the data warehouse.

Expected result:

* No rows returned.

---

# FactRentalLine Validation

The fact table contains the most important business data and therefore requires extensive validation.

---

## Validation 1 – Rental Line Completeness

A full join is performed between:

* RentalLine
* FactRentalLine

Purpose:

* Verify that every rental line from the operational database exists in the fact table.

Expected result:

* No rows returned.

---

## Validation 2 – Transaction Integrity

The fact table is compared with `DimRental_transaction`.

Purpose:

* Verify that every transaction referenced by the fact table exists in the transaction dimension.

Expected result:

* No rows returned.

---

## Validation 3 – Rental Station Integrity

The fact table is compared with `DimRental_station`.

Purpose:

* Verify that every station referenced by the fact table exists in the station dimension.

Expected result:

* No rows returned.

---

## Validation 4 – Employee Integrity

The fact table is compared with `DimEmployee`.

Purpose:

* Verify that every employee referenced by the fact table exists in the employee dimension.

Expected result:

* No rows returned.

---

## Validation 5 – Customer Integrity

The fact table is compared with `DimCustomer`.

Purpose:

* Verify that every customer referenced by the fact table exists in the customer dimension.

Expected result:

* No rows returned.

---

## Validation 6 – Equipment Integrity

The fact table is compared with `DimEquipment`.

Purpose:

* Verify that every equipment item referenced by the fact table exists in the equipment dimension.

Expected result:

* No rows returned.

---

## Validation 7 – Start Date Validation

The start date key in the fact table is compared with `DimDate`.

Purpose:

* Verify that all start dates exist in the date dimension.

Expected result:

* No rows returned.

---

## Validation 8 – End Date Validation

The end date key in the fact table is compared with `DimDate`.

Purpose:

* Verify that all end dates exist in the date dimension.

Expected result:

* No rows returned.

---

## Validation 9 – Transaction Line Count Comparison

The number of rental lines per transaction is calculated in:

* Operational Database
* Data Warehouse

Purpose:

* Verify that every transaction contains the same number of rental lines after loading.

Expected result:

* No differences found.

---

## Validation 10 – Transaction Total Comparison

The sum of:

Line Price + VAT

is calculated for every transaction in both systems.

Purpose:

* Verify that transaction totals remain unchanged during the ETL process.

Expected result:

* No differences found.

---

## Validation 11 – Rental Amount Validation

The calculated total amount from the fact table is compared with the stored rental amount in `DimRental_transaction`.

Purpose:

* Verify that transaction totals stored in the transaction dimension match the detailed transaction data.

Expected result:

* No differences found.

---

# Validation Summary

The validation process confirms that:

* All records were successfully transferred.
* No dimension records are missing.
* All foreign key relationships are valid.
* Date keys exist in the date dimension.
* Transaction totals are preserved.
* Rental line counts remain consistent between systems.

These validation checks ensure that the data warehouse is complete, accurate, and ready for reporting and analytical workloads.
