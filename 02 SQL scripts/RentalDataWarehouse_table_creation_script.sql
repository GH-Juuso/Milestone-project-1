-- Create an empty database
CREATE DATABASE RentalDataWarehouse;

GO
USE RentalDataWarehouse;

GO
-- Create Dim table for customer information
CREATE TABLE DimCustomer (
	customer_id int PRIMARY KEY,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone_number int NOT NULL
)

-- Create Dim table for equipment with every item of the inventory
CREATE TABLE DimEquipment (
	equipment_id int PRIMARY KEY,
	name varchar(50) NOT NULL,  
	category varchar(50) NOT NULL,  
	subcategory varchar(50) NOT NULL,
	type varchar(50) NOT NULL,  
	rental_price decimal(10,2) NOT NULL,  
	procurement_cost decimal(10,2) NOT NULL
)
	
--Create Dim table for employee information
CREATE TABLE DimEmployee (	
    employee_id int PRIMARY KEY,	
    firstname nvarchar(50) NOT NULL,	
    lastname nvarchar(50) NOT NULL,	
    hiring_date date NOT NULL,	
    salary decimal(10,2) NOT NULL
)

-- Create Dim table for rental transactions
CREATE TABLE DimRental_transaction (
	transaction_id int PRIMARY KEY,
	rental_amount decimal (10 ,2) NOT NULL)


-- Create Dim table for information about rental stations
CREATE TABLE DimRental_station (
	station_id int PRIMARY KEY,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	country varchar(50) NOT NULL,
	postal_code int NOT NULL,
	staffed int NOT NULL
	)

-- Create Dim table for date
CREATE TABLE DimDate (
    date_key int PRIMARY KEY,	
    dayname varchar(50) NOT NULL,
	week int NOT NULL,
	monthname varchar(50) NOT NULL,
	year int NOT NULL,
	date date NOT NULL
	)

-- Create the Fact rental line table
CREATE TABLE FactRentalLine (	
    rentalline_id int PRIMARY KEY,	
    transaction_id int NOT NULL,
	rental_station_id int NOT NULL,
	employee_id int NOT NULL,
	customer_id int NOT NULL,
    inventory_id int NOT NULL,
	equipment_id int NOT NULL,
	condition varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	line_price decimal (10,2) NOT NULL,	
    vat decimal (10,2) NOT NULL,
	start_date int NOT NULL,
	end_date int NOT NULL
	)

----------------------------------------------------------------------------------------------

--Fact Table connections
ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_DimTransaction FOREIGN KEY(transaction_id)
REFERENCES DimRental_transaction(transaction_id)

ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_rental_station FOREIGN KEY(rental_station_id)
REFERENCES DimRental_station(station_id)

ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_customer FOREIGN KEY(customer_id)
REFERENCES DimCustomer(customer_id)

ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_equipment FOREIGN KEY(equipment_id)
REFERENCES DimEquipment(equipment_id)

ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_start_date FOREIGN KEY(start_date)
REFERENCES DimDate(date_key)

ALTER TABLE FactRentalLine
ADD CONSTRAINT FK_end_date FOREIGN KEY(end_date)
REFERENCES DimDate(date_key)
