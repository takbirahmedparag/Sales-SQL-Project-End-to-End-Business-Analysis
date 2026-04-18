/*
Employee Analysis
47.Find total salary expense
48.Avarage salary by department
49.Highest paid employee
50.Employees under each manager
51.Salary performance by employee
*/
--47.Find total salary expense
Select Sum(Salary) AS total_salary_expense
From dbo.Employees


--48.Avarage salary by department
Select Department,AVG(Salary) AS avarage_salary_expense
From dbo.Employees
Group By Department 


--49.Highest paid employee
Select top 1 *
From dbo.Employees
Order By Salary DESC


--50.Employees under each manager
Select ManagerID,Count(EmployeeID) AS number_of_employee
From dbo.Employees
Group By ManagerID


--51.Salary performance by employee
Select e.EmployeeID,e.FirstName,e.LastName,e.Salary,Sum(o.Sales) AS total_Sales,Count(o.Quantity) AS total_quantity_sold
From dbo.Orders AS o left join
     dbo.Employees AS e
ON o.SalesPersonID = e.EmployeeID
Group By e.EmployeeID,e.FirstName,e.LastName,e.Salary