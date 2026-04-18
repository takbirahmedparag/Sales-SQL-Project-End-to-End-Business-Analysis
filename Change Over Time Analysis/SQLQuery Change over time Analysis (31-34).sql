/*
Change over time Analysis
31.Monthly total sales
32.Yearly total sales
33.Running total sales over time
34.Monthly order count trend
*/
--31.Monthly total sales
Select dateName(MONTH,OrderDate) AS Month,Sum(Sales) AS total_sales
From dbo.Orders
Group By dateName(MONTH,OrderDate)


--32.Yearly total sales
Select Datepart(YEAR,OrderDate) AS order_date,Sum(Sales) AS total_sales
From dbo.Orders
Group By Datepart(YEAR,OrderDate)


--33.Running total sales over time
Select OrderDate,
Sum(Sales) Over(Partition by OrderDate order by OrderDate) AS running_toal_sales
From dbo.Orders


--34 34.Monthly order count trend
Select dateName(MONTH,OrderDate) AS Month,Count(OrderDate) Over(Order By dateName(MONTH,OrderDate)) AS total_sales
From dbo.Orders