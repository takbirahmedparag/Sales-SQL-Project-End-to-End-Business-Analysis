/*
Customer Segmentation
44.Segment customers into 3 group
  VIP:lifespand 50 days and total_revenue > 110
  Regular:lifespend 50 days and total revenue < 110
  New :
45.Count coustomer in each segment 
46.Find total revenue from each segment
*/
/*
44.Segment customers into 3 group
  VIP:lifespand 50 days and total_revenue > 110
  Regular:lifespend 50 days and total revenue < 110
  New :*/
Select c.CustomerID,
Min(o.OrderDate) AS first_order,
Max(o.OrderDate) AS last_order,
Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) AS lifespend,
Sum(o.Sales) AS total_amount,
Case 
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) > 110  then 'VIP'
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) < 110  then 'Regular'
    Else 'New'
End AS Customer_segment 
From dbo.Orders AS o  left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By  c.CustomerID



--45.Count coustomer in each segment 
With CTE_customer_segment AS
(
Select c.CustomerID,
Min(o.OrderDate) AS first_order,
Max(o.OrderDate) AS last_order,
Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) AS lifespend,
Sum(o.Sales) AS total_amount,
Case 
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) > 110  then 'VIP'
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) < 110  then 'Regular'
    Else 'New'
End AS Customer_segment 
From dbo.Orders AS o  left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By  c.CustomerID
)

Select Customer_segment,Count(Customer_segment)
From CTE_customer_segment
Group By Customer_segment



--46.Find total revenue from each segment
With CTE_customer_segment2 AS
(
Select c.CustomerID,
Min(o.OrderDate) AS first_order,
Max(o.OrderDate) AS last_order,
Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) AS lifespend,
Sum(o.Sales) AS total_amount,
Case 
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) > 110  then 'VIP'
    When Datediff(Day,Min(o.OrderDate),Max(o.OrderDate)) > 50 and Sum(o.Sales) < 110  then 'Regular'
    Else 'New'
End AS Customer_segment 
From dbo.Orders AS o  left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By  c.CustomerID
)

Select Customer_segment,Sum(total_amount) AS total_sales
From CTE_customer_segment2
Group By Customer_segment
Order by Sum(total_amount)