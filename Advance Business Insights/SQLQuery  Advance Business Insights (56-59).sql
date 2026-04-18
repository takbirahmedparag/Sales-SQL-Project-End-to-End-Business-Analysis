/*
Advance Business Insights
56.Identify top country by revenue
57.Find repeat customers (more than 1 order)
58.Find customers who never orderd
59.Find best selling category
*/
--56.Identify top country by revenue
Select top 1 *
From
(
Select c.Country,Sum(o.Sales) AS total_sales
From dbo.Orders AS o left join 
     dbo.Customers AS c 
ON o.CustomerID = c.CustomerID
Group By c.Country
)t


--57.Find repeat customers (more than 1 order)
Select c.CustomerID,c.FirstName,c.LastName,Count(o.OrderDate) AS order_per_customer
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.CustomerID,c.FirstName,c.LastName
Having Count(o.OrderDate) >1


--58.Find customers who never orderd
Select c.CustomerID,c.FirstName,c.LastName,Count(o.OrderDate) AS order_per_customer
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.CustomerID,c.FirstName,c.LastName
Having Count(o.OrderDate) = 0


--59.Find best selling category
Select top 1 *
From
(
Select p.Category , Sum(o.Sales) AS total_sales
From dbo.Orders AS o left join 
     dbo.Products AS p 
ON o.ProductID = p.ProductID
Group By p.Category 
)t