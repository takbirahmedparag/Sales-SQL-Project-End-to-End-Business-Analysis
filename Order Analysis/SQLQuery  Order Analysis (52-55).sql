/*
Order Analysis
52.Find delayed orders(ShipDate>orderDate+5)
53.Count orders by status
54.Avarage delivary time 
55.Order per customer
*/
--52.Find delayed orders(ShipDate>orderDate+5)
Select OrderID,OrderDate,DATEADD(DAY,5,OrderDate) AS last_day_of_delevary,ShipDate,
Datediff(Day,ShipDate,DATEADD(DAY,5,OrderDate)) AS find_due_date,
Case
    When ShipDate Is Null then 'Not Shipped'
    When Datediff(Day,ShipDate,DATEADD(DAY,5,OrderDate)) = 0 then 'On Time'
    When Datediff(Day,ShipDate,DATEADD(DAY,5,OrderDate)) < 0 then 'Early Delivery'
    Else '  late delivery'
End AS delevery_segment
From dbo.Orders


--53.Count orders by status
Select OrderStatus,Count(OrderID) AS number_of_oreders
From dbo.Orders
Group By OrderStatus


--54.Avarage delivary time 
Select  Avg(Datediff(Day,OrderDate,ShipDate)) AS avarage_delevary_time
From dbo.Orders


--55.Order per customer
Select c.CustomerID,c.FirstName,c.LastName,Count(o.OrderDate) AS order_per_customer
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.CustomerID,c.FirstName,c.LastName