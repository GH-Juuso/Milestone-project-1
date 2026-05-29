# Operational Data Model Documentation – E-Bike & E-Scooter Rental Company

## Overview

This operational database model supports the day-to-day activities of an e-bike and e-scooter rental company. It manages equipment inventory, customer rentals, rental stations, and employee assignments. The model is designed to track the complete lifecycle of rental assets, from procurement and inventory management to rental transactions and returns.

---

## Equipment Management

The **Equipment** table contains the master data for all rentable assets, including e-bikes and e-scooters.

Each equipment record stores:

* Equipment name
* Category and subcategory
* Equipment type
* Rental price
* Available quantity
* Procurement cost

This table represents the catalog of products offered to customers.

---

## Inventory Management

The **Inventory** table tracks individual physical units of equipment.

For each inventory item, the company can monitor:

* Current condition (new, good, damaged, under maintenance, etc.)
* Availability status
* Associated equipment model

The inventory system enables the company to:

* Track the operational condition of every vehicle
* Monitor asset availability in real time
* Manage maintenance and repairs
* Follow the lifecycle of each rented asset

Each inventory item belongs to one equipment type, while a single equipment type can have multiple inventory units.

---

## Customer Management

The **Customer** table stores customer information required for rental operations.

Customer details include:

* First name
* Last name
* Address
* Email address
* Phone number

A customer can create multiple rental transactions over time.

---

## Rental Transactions

The **Rental_Transaction** table represents a rental agreement between a customer and the company.

Each transaction records:

* Rental start date
* Rental end date
* Total rental amount
* Customer who made the rental
* Pickup station
* Return station

This structure allows the company to track when and where rentals begin and end.

A customer can have many rental transactions, but each transaction belongs to a single customer.

---

## Rental Lines

The **RentalLines** table contains the detailed items included in a rental transaction.

This design allows:

* Multiple e-bikes and/or e-scooters to be rented within a single transaction
* Individual pricing for each rented asset
* VAT calculation at line level

For example, a customer may rent:

* 2 e-bikes
* 1 e-scooter

within the same rental transaction.

Each rental line links:

* One rental transaction
* One inventory item

This creates a flexible many-item rental structure.

---

## Rental Stations

The **Rental_Station** table stores information about company rental locations.

Each station contains:

* Station name
* Address
* City
* Country
* Postal code

Stations are used as:

* Pickup locations
* Return locations

A rental transaction may start and end at different stations, supporting one-way rentals.

---

## Employee Management

The **Employee** table stores information about company staff.

Employee records include:

* First name
* Last name
* Hiring date
* Salary

Each rental station is managed by an employee, allowing the company to identify operational responsibility for each location.

---

## Business Rules

### Equipment and Inventory

* One equipment type can have multiple inventory units.
* Each inventory unit belongs to one equipment type.
* Inventory items have their own condition and status.

### Customers and Rentals

* A customer can create multiple rental transactions.
* Each rental transaction belongs to one customer.

### Rentals and Rental Lines

* A rental transaction can contain multiple rental lines.
* Each rental line references a single inventory item.
* Multiple equipment items can be rented within one transaction.

### Stations

* Every rental transaction has a pickup station.
* Every rental transaction has a return station.
* Pickup and return stations may be different.

### Employees

* Each rental station is managed by an employee.
* An employee may be responsible for one or more rental stations.

---

## Benefits of the Model

This operational model provides the company with the ability to:

* Track all e-bikes and e-scooters individually
* Monitor inventory condition and availability
* Manage customer information
* Support rentals involving multiple vehicles
* Track pickup and return locations
* Monitor station operations and employee assignments
* Generate operational and financial reports from rental activities

The model serves as the foundation for rental operations, inventory control, customer management, and business performance analysis.
