/*
Date Exploration
9.Find the first and last order date
10.Find total the number of years of sales data
11.Find the total number of months available
12.Calculate deleivary time (ShipDate-OrderDate)
*/
--9.Find the first and last order date
Select 
Min(OrderDate) AS first_order_date,
Max(OrderDate) AS last_order_date
From dbo.Orders


--10.Find total the number of years of sales data
Select  Datetrunc(Year,OrderDate) AS Order_year ,
Count( distinct Datetrunc(Year,OrderDate)) AS total_number_of_year
From dbo.Orders
Group By   Datetrunc(Year,OrderDate)


--11.Find the total number of months available
Select  --distinct Month(OrderDate),
DATENAME(MONTH,OrderDate) AS total_month,
Count(DATENAME(MONTH,OrderDate)) AS total_day_in_each_month
From dbo.Orders
Group By DATENAME(MONTH,OrderDate)


--12.Calculate deleivary time (ShipDate-OrderDate)
Select o.ProductID,p.Product,
Datediff(DAY,o.OrderDate,o.ShipDate) AS delevary_time
From dbo.Orders AS o Left join
     dbo.Products AS p
ON o.ProductID = p.ProductID