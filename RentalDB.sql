-- Create an empty database
CREATE DATABASE RentalDatabase

-- Create table for customer information
CREATE TABLE Customer (
	customer_id int PRIMARY KEY,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone_number int NOT NULL
)

-- Create table for information about rental stations
CREATE TABLE Rental_station (
	station_id int PRIMARY KEY,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	country varchar(50) NOT NULL,
	postal_code int NOT NULL,
	staffed bit NOT NULL,
	employee_id int FOREIGN KEY
)

-- Create table for rental transactions
CREATE TABLE Rental_transaction (
	transaction_id int PRIMARY KEY,
	startdate date NOT NULL,
	enddate date NOT NULL,
	rental_amount decimal (10 ,2) NOT NULL,
	customer_id int FOREIGN KEY,
	rental_station_id int FOREIGN KEY,
	return_station_id int FOREIGN KEY
)

-- Create table for equipment metadata
CREATE TABLE Equipment (
	equipment_id int PRIMARY KEY,
	name varchar(50) NOT NULL,  
	category varchar(50) NOT NULL,  
	subcategory varchar(50) NOT NULL,
	type varchar(50) NOT NULL,  
	rental_price decimal(10,2) NOT NULL,  
	quantity int NOT NULL,  
	procurement_cost decimal(10,2) NOT NULL
)
	
-- Create table for inventory management
CREATE TABLE Inventory (
	inventory_id int PRIMARY KEY,  
	condition varchar(50) NOT NULL,
	status varchar(50) NOT NULL,  
	equipment_id int NOT NULL);
ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Equipment FOREIGN KEY(equipment_id)
REFERENCES Equipment(equipment_id);


--Create table for employee information
CREATE TABLE Employee (	
    employee_id int PRIMARY KEY,	
    firstname nvarchar(50) NOT NULL,	
    lastname nvarchar(50) NOT NULL,	
    hiring_date date NOT NULL,	
    salary decimal(10,2) NOT NULL
)

-- Create the rental line junction table
CREATE TABLE RentalLine (	
    rentalline_id int PRIMARY KEY,	
    transaction_id int FOREIGN KEY,	
    inventory_id int FOREIGN KEY,
	line_price decimal (10,2) NOT NULL,	
    vat decimal (10,2) NOT NULL
);