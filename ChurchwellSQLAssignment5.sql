/*
Adam Churchwell
SQL Assignment 5
Date:
*/

-- QUESTION 1
SELECT COUNT(OrderID) AS 'Shipped Late'
FROM Orders
WHERE ShippedDate > RequiredDate;

-- QUESTION 2
SELECT ProductID, ProductName, UnitsInStock, CategoryID
FROM Products
WHERE CategoryID = 2
AND UnitsInStock > (SELECT AVG(UnitsInStock) FROM Products);

-- QUESTION 3
SELECT ProductID, ProductName, UnitsInStock, CategoryID
FROM Products
WHERE UnitsInStock > (SELECT AVG(UnitsInStock) FROM Products WHERE CategoryID = 2);

-- QUESTION 4
SELECT CustomerID, 
       ContactName, 
	   Country
FROM Customers
WHERE Country NOT IN ('UK', 'USA', 'Australia', 'Canada');


--QUESTION 5
SELECT *
FROM   Customers c
WHERE NOT EXISTS (SELECT * FROM Orders o WHERE c.CustomerID = o.CustomerID);


--QUESTION 6
SELECT EmployeeID, 
	   FirstName + ' ' + LastName AS EmployeeName
FROM Employees
WHERE ReportsTo = 2
ORDER BY LastName;


-- QUESTION 7
SELECT CustomerID, 
	   CompanyName, 
	   ContactName
FROM Customers
WHERE LEN(CompanyName) < 13;