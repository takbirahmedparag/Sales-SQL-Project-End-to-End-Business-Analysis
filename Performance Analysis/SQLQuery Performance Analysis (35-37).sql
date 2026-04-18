/*
Performance Analysis
35.Compare each product's sales with avarage product sales
36.Compare each product's current sales with provious year
37.Identify high-performing and low-performing products
*/
--35.Compare each product's sales with avarage product sale
Select p.Product, 
Sum(o.Sales) AS current_product_sales,
Avg(o.Sales) AS Avarage_product_sales,
(Sum(o.Sales)-Avg(o.Sales)) AS diff_current_sales_avarage_sales_product,
Case 
    When (Sum(o.Sales)-Avg(o.Sales)) > 0 then 'Above Avg'
    When (Sum(o.Sales)-Avg(o.Sales)) < 0 then 'Below Avg'
    Else 'Avg'
End As Product_avarage_segment

From dbo.Orders AS o left join
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group By p.Product



--36.Compare each product's current sales with provious month
Select Format(orderDate,'yyyy-MM') AS month,
sum(Sales) as total_current_sales_monthly,
Lag(sum(Sales)) Over (Order By Format(orderDate,'yyyy-MM')) AS privious_month_sales,
(sum(Sales)-Lag(sum(Sales)) Over (Order By Format(orderDate,'yyyy-MM'))) AS dff_current_sales_privious_month_sales,
Case
    When (sum(Sales)-Lag(sum(Sales)) Over (Order By Format(orderDate,'yyyy-MM'))) > 0 then 'Increaseing'
    When (sum(Sales)-Lag(sum(Sales)) Over (Order By Format(orderDate,'yyyy-MM'))) <0 then 'Decreaseing'
    Else 'Not Change'
End AS previous_month_sales_compare
From dbo.Orders
Group By Format(orderDate,'yyyy-MM')
Order By month 



--37.Identify high-performing and low-performing products
Select *,
Case 
    When rank_product_by_sales = 1 then 'High-Performing'
    When rank_product_by_sales >1 and rank_product_by_sales < 4 then 'Mid-Performing'
    Else 'Low_Performing'
End AS segment_performance_product_by_sales
From
(
Select p.Product,Sum(o.Sales)AS total_sales,
ROW_NUMBER() Over (Order By Sum(o.Sales) DESC) AS rank_product_by_sales
From dbo.Orders AS o left join
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group By p.Product
)t 