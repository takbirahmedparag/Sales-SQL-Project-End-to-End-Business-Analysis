/*
Database Exploration
1.Explore all the object in the Database
2.Explpre all the column in the Dataabase
3.Explore all the countries our customer come form
4.Exprore all the  product category the major division 
*/
--1.Explore all the object in the Database
Select *
From INFORMATION_SCHEMA.TABLES



--2.Explpre all the column in the Dataabase
Select *
From INFORMATION_SCHEMA.COLUMNS



--3.Explore all the countries our customer come form
Select distinct Country
From dbo.Customers



--4.Exprore all the  product category the major division 
Select Category,Product
From dbo.Products



/*
Database Exploration
1.Sahow all record from each table
2.Chack total rows in customer ,order ,product ,employe table
3.Show all columns from each table
4.Identify primary and forgien key
*/
--1.Sahow all record from each table
Select *
From dbo.Orders

Select *
From dbo.Customers

Select *
From dbo.Employees

Select *
From dbo.Products

Select *
From dbo.OrdersArchive
--2.Chack total rows in customer ,order ,product ,employe table
Select Count(*) AS number_of_row
From dbo.Customers

Select Count(*) AS number_of_row
From dbo.Employees

Select Count(*) AS number_of_row
From dbo.Orders

Select Count(*) AS number_of_row
From dbo.OrdersArchive

Select Count(*) AS number_of_row
From dbo.Products
--3.Show all columns from each table
Select Count(*) AS number_of_columns
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Orders'

Select Count(*) AS number_of_columns
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Customers'

Select Count(*) AS number_of_columns
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Employees'

Select Count(*) AS number_of_columns
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'OrdersArchive'

Select Count(*) AS number_of_columns
From INFORMATION_SCHEMA.COLUMNS
Where TABLE_NAME = 'Products'