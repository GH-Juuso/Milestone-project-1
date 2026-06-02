# Transfer Documentation

## Overview

The purpose of the transfer scripts is to move data from the operational database (`RentalDatabase`) into the data warehouse (`RentalDataWarehouse`). The operational database stores transactional rental data, while the data warehouse is optimized for reporting, analytics, and business intelligence.

The transfer process populates the following tables:

### Dimension Tables

* DimCustomer
* DimEmployee
* DimEquipment
* DimRental_station
* DimRental_transaction
* DimDate

### Fact Table

* FactRentalLines

Each transfer script extracts data from the operational database and loads it into the corresponding dimension or fact table.

---

# Dimension Transfers

## DimCustomer Transfer

Customer information is transferred from the `Customer` table in the operational database into the `DimCustomer` dimension.

Transferred attributes:

* customer_id
* firstname
* lastname
* address
* email
* phone_number

Duplicate records are prevented using a validation check before insertion.

---

## DimEmployee Transfer

Employee information is transferred from the `Employee` table into the `DimEmployee` dimension.

Transferred attributes:

* employee_id
* firstname
* lastname
* hiring_date
* salary

Only employees that do not already exist in the data warehouse are inserted.

---

## DimEquipment Transfer

Equipment data is transferred from the `Equipment` table into the `DimEquipment` dimension.

Transferred attributes:

* equipment_id
* name
* category
* subcategory
* type
* rental_price
* procurement_cost

This dimension enables analysis of rental activity by equipment category and type.

---

## DimRental_station Transfer

Rental station information is transferred into the `DimRental_station` dimension.

Transferred attributes:

* station_id
* name
* address
* city
* country
* postal_code
* staffed

The dimension supports geographical and operational reporting.

---

## DimRental_transaction Transfer

Transaction information is transferred into the `DimRental_transaction` dimension.

Transferred attributes:

* transaction_id
* rental_amount

This dimension stores transaction-level information used for analysis of rental revenue.

---

# DimDate Transfer

The `DimDate` table is generated using dates found in the rental transactions.

Both:

* startdate
* enddate

are used as source values.

The date dimension contains:

* date_key
* dayname
* week
* monthname
* year
* date

The date key is generated using the format:

YYYYMMDD

Example:

2026-05-20 → 20260520

Duplicate dates are removed before insertion to ensure each date only exists once in the dimension.

---

# FactRentalLines Transfer

The `FactRentalLines` table is the central fact table in the data warehouse.

Its grain is:

> One row per rental line.

The fact table combines data from multiple operational tables, including:

* RentalLine
* Rental_transaction
* Inventory
* Equipment
* Rental_station

Stored measures and attributes include:

* rental_line_id
* transaction_id
* station_id
* employee_id
* customer_id
* equipment_id
* condition
* status
* line_price
* vat
* start_date
* end_date

The fact table links all major dimensions together and enables reporting on rental activity, revenue, equipment usage, customers, stations, and employees.

Duplicate records are prevented by checking whether the rental line already exists before insertion.

---

# Data Quality and Validation

Basic validation is performed during the transfer process.

Validation includes:

* Comparing row counts between source and destination tables.
* Checking sample records before and after transfer.
* Preventing duplicate inserts using `NOT EXISTS` conditions.
* Verifying foreign key relationships between fact and dimension tables.

Additional validation scripts will be documented separately when completed.

---

# Star Schema Summary

The data warehouse follows a star schema design.

### Fact Table

* FactRentalLines

### Dimension Tables

* DimCustomer
* DimEmployee
* DimEquipment
* DimRental_station
* DimRental_transaction
* DimDate

This structure provides efficient querying and supports analytical reporting in Power BI.
