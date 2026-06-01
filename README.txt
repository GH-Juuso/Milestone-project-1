Generated rental ingestion package.

Row counts:
- Employee.csv: 151 rows, including dummy employee_id 0
- Customer.csv: 10,000 rows
- Equipment.csv: 80 rows
- Rental_station.csv: 200 rows
- Inventory.csv: 15,000 rows
- Rental_transaction.csv: 40,000 rows
- RentalLine.csv: 100,000 rows

Notes:
- Equipment is intentionally limited to fewer than 100 rows.
- About 25% of stations are unstaffed and use employee_id 0.
- RentalLine.transaction_id references Rental_transaction.transaction_id.
- RentalLine.inventory_id references Inventory.inventory_id.
- Inventory.equipment_id references Equipment.equipment_id.
- Rental_transaction station and customer references are valid.
- The SQL file uses SQL Server BULK INSERT. Update the folder path before running.