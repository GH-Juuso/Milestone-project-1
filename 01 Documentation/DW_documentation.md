# Data Warehouse Documentation – Rental Operations

## Overview

This Data Warehouse has been designed to support reporting and analytical activities for the rental operations business. Unlike the operational database, which is optimized for daily transactions, the Data Warehouse is structured to provide efficient reporting and business insights.

The model follows a star schema design where rental events are stored in a central fact table and descriptive information is stored in dimension tables. This structure allows analysis of rental activity by customer, employee, equipment, rental station, transaction, and time.

---

## FactRentalLines

The FactRentalLines table is the central fact table of the Data Warehouse.

Each record represents one rental line within a rental transaction. The table stores the measurable values used for reporting and analysis, such as rental prices and VAT values.

The table is connected to all dimension tables through foreign keys, allowing users to analyze rental operations from multiple business perspectives.

### Key Columns

- rental_line_id (Primary Key)
- transaction_id
- station_id
- employee_id
- customer_id
- equipment_id
- start_date
- end_date

### Measures

- line_price
- vat

---

## Customer Dimension

The DimCustomer table stores descriptive information about customers.

This dimension allows business users to analyze rental activity by customer and identify rental patterns among different customers.

### Attributes

- customer_id
- firstname
- lastname
- address
- email
- phonenumber

---

## Equipment Dimension

The DimEquipment table contains information about rental equipment.

This dimension supports analysis of rental activity by equipment category, type, and individual asset.

### Attributes

- equipment_id
- name
- category
- subcategory
- type
- rental_price
- procurement_cost

---

## Employee Dimension

The DimEmployee table stores employee information.

This dimension allows analysis of rental performance and activity by employee.

### Attributes

- employee_id
- firstname
- lastname
- hiring_date
- salary

---

## Rental Station Dimension

The DimRental_station table stores information about rental locations.

This dimension enables geographical and operational analysis of rental stations.

### Attributes

- station_id
- name
- address
- city
- country
- postal_code
- staffed

---

## Date Dimension

The DimDate table provides calendar information for time-based reporting.

Using this dimension, business users can analyze rental activity by day, week, month, and year.

### Attributes

- date_key
- date
- dayname
- week
- monthname
- year

---

## Rental Transaction Dimension

The DimRental_transaction table stores transaction-level information.

This dimension provides access to rental transaction details and rental amount information.

### Attributes

- transaction_id
- rental_amount

---

## Relationships

The Data Warehouse uses a star schema structure.

FactRentalLines serves as the central fact table and is connected to all dimension tables. This design simplifies reporting and improves query performance in analytical tools such as Power BI.

The model supports analysis of rental operations by:

- Customer
- Employee
- Equipment
- Rental Station
- Transaction
- Time
