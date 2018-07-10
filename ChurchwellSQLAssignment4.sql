/*
Adam Churchwell
SQL Assignment 4
11/28/2017
*/

-- QUESTION 1
SELECT AVG(UnitPrice) AS 'Average Price',
	   MIN(UnitPrice) AS 'Lowest Price',
	   MAX(UnitPrice) AS 'Highest Price'
FROM Products

-- QUESTION 2
SELECT c.CustomerID,
	   AVG(Freight) AS 'Avg Freight Charge'
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID

-- QUESTION 3
SELECT c.CustomerID,
	   AVG(Freight) AS 'Avg Freight Charge'
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING AVG(Freight) > 100

-- QUESTION 4
SELECT e.EmployeeID,
	   FirstName,
	   LastName,
	   MAX(OrderDate) AS 'Recent Order Date'
FROM Employees e JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, FirstName, LastName

-- QUESTION 5
SELECT ProductID,
	   COUNT(ProductID) 'Number of Orders'
FROM OrderDetails
GROUP BY ProductID
HAVING COUNT(ProductID) > 50
	   
-- QUESTION 6
SELECT o.OrderID,
	   SUM(UnitPrice) AS 'Full Retail Price',
	   CONVERT(MONEY, ROUND(SUM(UnitPrice * (1-Discount)), 2)) AS 'Final Price'
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID

-- QUESTION 7
SELECT p.ProductID, 
	   ProductName, 
	   ShipperID, 
	   CompanyName AS 'Shipper Name', 
	   COUNT(o.OrderID) AS 'Shipments Per Product'
FROM Shippers s
	   JOIN Orders o ON o.ShipVia = s.ShipperID
	   JOIN OrderDetails od ON o.OrderID = od.OrderID
	   JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, 
	   ProductName, 
	   ShipperID, 
	   CompanyName