/*
Ranking Analysis
26.Top 1 products by highest sales
27.Bottom 5 products by lowest sales
28.Top 3 customers by revenue
29.Top 5 employees by sales performance
30.3 customers with lowest number of orders
*/
--26.Top 1 products by highest sales
Select top 1 *
From
(
Select p.Product,Sum(o.Sales) AS total_sales,
ROW_NUMBER()over(Order By Sum(o.Sales) DESC) AS ranking_hight_products_by_sales
From dbo.Orders AS o left join
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group by p.Product
)t


--27.Bottom 5 products by lowest sales
Select top 1 *
From
(
Select p.Product,Sum(o.Sales) AS total_sales,
ROW_NUMBER()over(Order By Sum(o.Sales) ) AS ranking_hight_products_by_sales
From dbo.Orders AS o left join
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group by p.Product
)t


--28.Top 3 customers by revenue
Select top 3 *
From
(
Select c.CustomerID,c.FirstName,c.LastName,Sum(o.Sales) AS total_sales,
ROW_NUMBER()Over(Order By Sum(o.Sales) DESC ) AS ranking_top_customer_revenue
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.CustomerID,c.FirstName,c.LastName
)t


--Top 2 employees by sales performance
Select  top 2 *
From
(
Select e.EmployeeID,e.FirstName,e.LastName,e.Gender,Sum(o.Sales) AS total_sales,
ROW_NUMBER()Over(Order By Sum(o.Sales) DESC ) AS ranking_employee_performance
From dbo.Orders AS o left join 
     dbo.Employees AS e
ON o.SalesPersonID = e.EmployeeID
Group By e.EmployeeID,e.FirstName,e.LastName,e.Gender
)t


--30.top 1 customers with lowest number of orders
Select top 1 *
From
(
Select c.CustomerID,c.FirstName,c.LastName,Count(o.OrderDate) AS total_number_order,
ROW_NUMBER() Over (Order By Count(o.OrderDate) ) AS ranking_order_number
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.CustomerID,c.FirstName,c.LastName
)t