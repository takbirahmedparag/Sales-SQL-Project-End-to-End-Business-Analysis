/*
Part-to-whole-Analysis
38.Percentage contribution of each category to total sales
39.Percentage contribution of each country
40.Which category comtributions the most to revenue
*/
--38.Percentage contribution of each category to total sales
Select p.Category,Sum(o.Sales) AS total_sales,
Sum(Sum(o.Sales)) Over () AS overall_total_sales,
Concat(Round((Cast(Sum(o.Sales)AS float)/(Cast (Sum(Sum(o.Sales)) Over () AS float))*100),2),'%') AS contribution_categor_percentage
From dbo.Orders AS o left join 
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group By p.Category


--39.Percentage contribution of each country
Select c.Country,Sum(o.Sales) AS total_sales,
Sum(Sum(o.Sales)) Over () AS overall_total_sales,
Concat(Round((Cast(Sum(o.Sales)AS float)/(Cast (Sum(Sum(o.Sales)) Over () AS float))*100),2),'%') AS contribution_categor_percentage
From dbo.Orders AS o left join 
     dbo.Customers AS c
ON o.CustomerID = c.CustomerID
Group By c.Country


--40.Which category comtributions the most to revenue
Select top 1 *
From
(
Select p.Category,Sum(o.Sales) AS total_sales,
Sum(Sum(o.Sales)) Over () AS overall_total_sales,
Concat(Round((Cast(Sum(o.Sales)AS float)/(Cast (Sum(Sum(o.Sales)) Over () AS float))*100),2),'%') AS contribution_categor_percentage
From dbo.Orders AS o left join 
     dbo.Products AS p
ON o.ProductID = p.ProductID
Group By p.Category
)t