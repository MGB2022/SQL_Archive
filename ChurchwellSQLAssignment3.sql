/* Adam Churchwell
*  SQL Assignment 3
*  11/27/17
*/

--Question 1
SELECT c.CustomerID,
	   ContactName,
	   Address,
	   City,
	   Region,
	   PostalCode,
	   OrderID,
	   OrderDate
FROM Customers c JOIN Orders o on c.CustomerID = o.CustomerID
WHERE OrderDate >= '2014-07-01' and OrderDate <= '2014-07-31'
	   
-- Question 2
SELECT c.CustomerID,
	   ContactName,
	   Address,
	   City,
	   Region,
	   PostalCode,
	   OrderID,
	   OrderDate
FROM Customers c, Orders o
WHERE c.CustomerID = o.CustomerID AND OrderDate >= '2014-07-01' and OrderDate <= '2014-07-31'

-- Question 3
SELECT c.CustomerID,
	   CompanyName,
	   OrderID
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY OrderID ASC

-- Question 4
SELECT FirstName,
	   LastName,
	   c.CompanyName,
	   OrderDate,
	   RequiredDate,
	   ShippedDate,
	   p.ProductID,
	   ProductName,
	   s.SupplierID,
	   s.CompanyName,
	   ShipperID,
	   sh.CompanyName
FROM  Customers c 
JOIN  Orders o on c.CustomerID = o.CustomerID
JOIN  Employees e on o.EmployeeID = e.EmployeeID
JOIN  OrderDetails od on o.OrderID = od.OrderID
JOIN  Products p on od.ProductID = p.ProductID
JOIN  Suppliers s on p.SupplierID = s.SupplierID
JOIN  Shippers sh on sh.ShipperID = o.ShipVia
WHERE s.SupplierID = '12' AND e.EmployeeID = '2'
ORDER BY o.OrderDate, c.CustomerID


-- QUESTION 5
SELECT o.OrderID,
	   CustomerID,
	   OrderDate,
	   UnitPrice,
	   Quantity
FROM Orders o
LEFT OUTER JOIN OrderDetails od ON o.OrderId = od.OrderID
WHERE Quantity < 12
	   
-- QUESTION 6
SELECT CompanyName,
	   'Inside USA' as 'Country' 
FROM Customers
WHERE Country = 'USA'
UNION
SELECT CompanyName,
	   'Outside USA' as 'Country' 
FROM Customers

-- QUESTION 7
SELECT e.FirstName + ' ' + e.LastName AS 'Name',
	   JobDescription AS 'Job Description'
FROM Employees e JOIN Jobs j ON e.JobID = j.JobID

-- QUESTION 8
SELECT DISTINCT OrderID,
	   EmployeeID,
	   CustomerID
FROM Orders
WHERE ShippedDate < '2014-01-01'
