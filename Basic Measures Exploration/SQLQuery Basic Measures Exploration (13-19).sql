/*
Basic Measures Exploration
13.Find total sales
14.Find total quentity
15.Find total number of orders
16.Find total number of customers
17.Find total number of products
18.Find avarage selling price
19.Find total number of employees
*/
--13.Find total sales
Select Sum (Sales) AS total_sales
From dbo.Orders


--14.Find total quentity
Select Sum(Quantity) AS total_quantity
From dbo.Orders


--15.Find total number of orders
Select  Count(Distinct OrderDate) AS total_number_of_order
From dbo.Orders


--16.Find total number of customers
Select count(Distinct CustomerID) AS total_number_of_customer
From dbo.Customers


--17.Find total number of products
Select Count(Distinct Product) AS total_number_of_customer
From dbo.Products


--18.Find avarage selling price
Select AVG(Price) AS avarage_selling_price,
(Sum(Price)/5) AS avarage_selling_price 
From dbo.Products


--19.Find total number of employees
Select Count(Distinct EmployeeID) AS total_number_of_employees
From dbo.Employees