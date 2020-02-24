-- Listing 5-6. Using LEFT OUTER JOIN 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE c.CustomerID IN (11028,11029,1,2,3,4); 

--NULL rows drop out.
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate, s.TotalDue    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE c.CustomerID IN (11028,11029,1,2,3,4)
	AND TotalDue < 1000; 

--Filter right side table in the ON clause
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate, s.TotalDue    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s 
 ON c.CustomerID = s.CustomerID   AND TotalDue < 1000 
WHERE c.CustomerID IN (11028,11029,1,2,3,4)
	;


-- Listing 5-7. Using RIGHT OUTER JOIN 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.SalesOrderHeader AS s    
RIGHT OUTER JOIN Sales.Customer AS c ON c.CustomerID = s.CustomerID    
WHERE c.CustomerID IN (11028,11029,1,2,3,4);   

-- Listing 5-8. Using LEFT OUTER JOIN to Find the Rows with No Matches 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE s.SalesOrderID IS NULL;  


--  Listing 5-9. Joining Three Tables with LEFT OUTER JOIN 
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID    
FROM Sales.Customer AS C    
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID    
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID    
WHERE C.CustomerID IN (11028,11029,1,2,3,4); 

--The NULL rows drop out
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID    
FROM Sales.Customer AS C    
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID    
INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID    
WHERE C.CustomerID IN (11028,11029,1,2,3,4); 

-- Listing 5-10. Adding Another Table to the Left Side of the Join 
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID,        
	SOD.ProductID, T.Name    
FROM Sales.Customer AS C    
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID    
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID    
LEFT OUTER JOIN Sales.SalesTerritory AS T ON C.TerritoryID = T.TerritoryID    
WHERE C.CustomerID IN (11028,11029,1,2,3,4); 


-- Listing 5-11. FULL OUTER JOIN Demonstration 
IF OBJECT_ID('Production.ProductColor') IS NOT NULL BEGIN        
	DROP TABLE Production.ProductColor;    
END    
CREATE table Production.ProductColor        
	(Color nvarchar(15) NOT NULL PRIMARY KEY);    
GO    
--Insert most of the existing colors    
INSERT INTO Production.ProductColor    
SELECT DISTINCT Color    
FROM Production.Product    
WHERE Color IS NOT NULL and Color <> 'Silver';
 
--Insert some additional colors    
INSERT INTO Production.ProductColor    
VALUES ('Green'),('Orange'),('Purple'); 

SELECT Color 
FROM Production.ProductColor 

--Here is the query:    
SELECT c.Color AS "Color from list", p.Color, p.ProductID    
FROM Production.Product AS p    
FULL OUTER JOIN Production.ProductColor AS c ON p.Color = c.Color    
ORDER BY p.ProductID;  

-- Listing 5-12. A CROSS JOIN 
--1    
SELECT p.ProductID, l.LocationID    
FROM Production.Product AS p    
CROSS JOIN Production.Location AS l    
ORDER BY ProductID;       
--2    
SELECT p.ProductID, l.LocationID    
FROM Production.Product AS p    
CROSS JOIN Production.Location AS l    
ORDER BY LocationID; 

--Listing 5-13. Using Self-Join 
CREATE TABLE #Employee (    
	EmployeeID  int,    
	ManagerID int,    
	Title nvarchar(50));       
INSERT INTO #Employee    
VALUES (1, NULL, 'Chief Executive Officer');    
INSERT INTO #Employee    
VALUES (2, 1, 'Engineering Manager') ;   
INSERT INTO #Employee    
VALUES (3, 2, 'Senior Tool Designer');    
INSERT INTO #Employee    
VALUES (4, 2, 'Design Engineer');    
INSERT INTO #Employee    
VALUES (5, 2, 'Research and Development') ;   
INSERT INTO #Employee    
VALUES (6, 1, 'Marketing Manager');    
INSERT INTO #Employee    
VALUES (7, 6, 'Marketing Specialist');       
SELECT a.EmployeeID AS Employee,              
	a.Title AS EmployeeTitle,        
	b.EmployeeID AS ManagerID,        
	b.Title AS ManagerTitle    
FROM #Employee AS a    
LEFT OUTER JOIN #Employee AS b ON a.ManagerID = b.EmployeeID;       
DROP TABLE #Employee;  


 
   