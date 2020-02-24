--Will fail
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader;    

-- Listing 7-2. Using the GROUP BY Clause       
--1    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID;      
--2    
SELECT TerritoryID,AVG(TotalDue) AS AveragePerTerritory    
FROM Sales.SalesOrderHeader    
GROUP BY TerritoryID;   

SELECT CustomerID, TerritoryID,AVG(TotalDue) AS AveragePerTerritory    
FROM Sales.SalesOrderHeader    
GROUP BY TerritoryID, CustomerID;   

--Listing 7-3. How to Group on an Expression 
--1    
SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrderYear    
FROM Sales.SalesOrderHeader    
GROUP BY OrderDate;       
--2    
SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrderYear    
FROM Sales.SalesOrderHeader    
GROUP BY YEAR(OrderDate); 

-- Listing 7-4. Using ORDER BY 
--1    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer          
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID   
ORDER BY CustomerID;       
--2    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
ORDER BY MAX(TotalDue) DESC;
--3    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
ORDER BY TotalPerCustomer DESC;  