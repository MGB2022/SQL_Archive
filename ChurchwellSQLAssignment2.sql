/*
Adam Churchwell
SQL Assignment 2
11/20/2017
*/

-- Question 1
Select *
From Customers

-- Question 2
Select *
From Products
Order By UnitPrice, ProductName

-- Question 3
Select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
From Products
Where Discontinued = 1

-- Question 4
Select CustomerID, LEFT(CompanyName, 8) AS CompanyName
From Customers

-- Question 5
SELECT CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
Offset 0 ROWS
FETCH NEXT 8 ROWS Only;

-- Question 6
SELECT CustomerID, CompanyName
FROM Customers
WHERE CompanyName LIKE '%Market%'

-- Question 7
SELECT FirstName, LastName, LOWER(LEFT(FirstName, 1)) + '.' + LOWER(LastName) + '@northwind.com' AS 'Email Address'
FROM Employees
ORDER BY LastName ASC

-- Question 8
SELECT *
FROM Customers
WHERE Country IN ('Germany', 'France', 'USA', 'UK');

-- Question 9
SELECT TOP 5 PERCENT Freight
FROM Orders
ORDER BY Freight DESC

-- Question 10
SELECT LastName, HomePhone, Notes
FROM Employees
WHERE Notes LIKE '%German%'

-- Question 11
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2014-07-01' AND '2014-07-31'

-- Question 12
SELECT *
FROM Orders
WHERE OrderDate >= '2014-07-01' AND OrderDate <= '2014-07-31'

-- 12 (Additional Method)
SELECT *
FROM Orders
WHERE MONTH(OrderDate) = '7' AND YEAR(OrderDate) = '2014'

-- Question 13
SELECT *
FROM Orders
WHERE ShippedDate IS NULL

-- Question 14
SELECT CustomerID
FROM Orders
GROUP BY CustomerID

-- Question 15
SELECT CustomerID, City, Region, PostalCode
FROM Customers
ORDER BY City, CustomerID