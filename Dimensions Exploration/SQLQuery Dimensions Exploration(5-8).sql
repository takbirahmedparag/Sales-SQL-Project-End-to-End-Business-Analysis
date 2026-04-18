/*
Dimensions Exploration
5.List all unique countries from customer table
6.List all unique  product category
7.List all department from employee table
8.List all order statuses
*/
--5.List all unique countries from customer table
Select Distinct Country
From dbo.Customers


--6.List all unique  product category
Select Distinct Category
From dbo.Products


--7.List all department from employee table
Select Distinct Department
From dbo.Employees


--8.List all order statuses
Select Distinct OrderStatus
From dbo.Orders