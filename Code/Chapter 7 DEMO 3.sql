-- Listing 7-5. Using the WHERE Clause       
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
WHERE TerritoryID in (5,6)    
GROUP BY CustomerID; 

-- Listing 7-6. Using the HAVING Clause    
--1    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING SUM(TotalDue) > 5000;       
--2    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING COUNT(*) = 10 AND SUM(TotalDue) > 5000;       
--3    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING CustomerID > 27858;   

--Doesn't run
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader 
WHERE SUM(TotalDue) > 1000
GROUP BY CustomerID  ;  
