# Operational Rental Database
## Overview
The goal of this sprint was to create the first version of the operational rental database for 
the Rental Operations Database and Data Warehouse project.
The team focused on designing a normalized database structure capable of supporting rental 
operations, equipment management, customers, employees, and rental stations.

## Work Completed
### Initial Database Design
The team designed the first version of the operational database using SQLDBM.
The following entities were created:
* Customer
* Employee
* Rental_Station
* Equipment
* Inventory
* Rental_Transaction
* RentalLines 
Primary keys and foreign keys were defined to establish relationships between the entities.

### Relationship Design
The following relationships were implemented:
* One customer can have multiple rental transactions.
* One rental station can process multiple rentals.
* One equipment type can have multiple inventory items.
* One rental transaction can contain multiple rental lines.
* Employees are connected to rental stations.

### Normalization Review
The database structure was reviewed to reduce data redundancy and improve data integrity.
Particular attention was given to:
* Separation of equipment definitions and inventory items.
* Proper use of primary keys and foreign keys.
* Consistent storage of customer, employee, and station information. 
