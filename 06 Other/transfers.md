# List of transfers from Operational DB To DataWarehouse DB

## DimEquipment
 * Equipment (everything) unless quantity
 
 ### Validation :
	* Match Equipment_id with Operational DB Equipment(equipment_id)

## DimCustomer
 * Customer copy
 
 ### Validation :
	* Match customer_id with Operational DB Customer(customer_id)

## DimEmployee
 * Employee copy

### Validation :
	* Match employee_id with Operational DB Customer(employee_id)

## DimRental_Station
 * Rental_Station copy unless employee_id

 ### Validation :
	* Match station_id with Operational DB Rental_Station(station_id)

## DimDate
 * Creation from scratch

## DimRental_transaction
 * copy rental_amount, transaction_id from Rental_transaction

 ### Validation :
	* Match transaction_id with Operational DB Rental_transaction(transaction_id )

## FactRentalLines
 * RentalLines : rentalline_id, transaction_id, line_price, vat
 * Rental_Station : station_id
 * Rental_transaction : start_date(transform in FK), end_date(transform in FK), start_time, end_time
 * Employee : employee_id
 * Customer : customer_id
 * Equipment : equipment_id
 * Inventory : consition, status

 ### Validation :
	* Match rental_line_id with Operational DB RentalLines(rental_line_id)
	* Match transaction_id with Operational DB Rental_transaction(transaction_id)
	* Match station_id with Operational DB Rental_station(station_id)
	* Match employee_id with Operational DB Employee(employee_id)
	* Match customer_id with Operational DB Customer(transaction_id)
	* Match equipment_id with Operational DB Equipment(equipment_id)
	* Match start_date, end_date keys in DimDate (date_key)
	* Verify total lines per transaction_id for Operational DB and Data Warehouse
