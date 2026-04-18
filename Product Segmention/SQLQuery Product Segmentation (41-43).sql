/*
Product Segmentation 
41.Segment products into price range
  Low:price<20
  Medium:price between 20-50
  High:price>50
42.Count products in each segment
43.Find total sales for each segment
*/
/*
41.Segment products into price range
  Low:price<10
  Medium:price between 20-25
  High:price>30
*/
Select ProductID,price,
Case 
    When price >=30 then 'High'
    When price between 20 and 25 then 'Medium'
    Else 'Low'
End AS product_price_segment
From dbo.Products
Order by price DESC



--42.Count products in each segment
With CTE_product_segment AS 
(
Select ProductID,price,
Case 
    When price >=30 then 'High'
    When price between 20 and 25 then 'Medium'
    Else 'Low'
End AS product_price_segment
From dbo.Products
)

select product_price_segment,Count(product_price_segment) AS number_of_segment
From CTE_product_segment
Group By product_price_segment



--43.Find total sales for each segment
With CTE_product_Segment AS
(
Select p.ProductID,p.price,o.Sales,
Case 
    When p.price >=30 then 'High'
    When p.price between 20 and 25 then 'Medium'
    Else 'Low'
End AS product_price_segment
From dbo.Orders AS o left join 
     dbo.Products AS p
ON o.ProductID = p.ProductID
)

Select product_price_segment,Sum(Sales)
From CTE_product_Segment
Group By product_price_segment