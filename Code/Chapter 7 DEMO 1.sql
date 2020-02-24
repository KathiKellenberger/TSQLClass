-- Listing 7-1. Using Aggregate Functions 
--1    
SELECT COUNT(*) AS CountOfRows,        
	MAX(TotalDue) AS MaxTotal,        
	MIN(TotalDue) AS MinTotal,        
	SUM(TotalDue) AS SumOfTotal,        
	AVG(TotalDue) AS AvgTotal    
FROM Sales.SalesOrderHeader;       
--2    
SELECT MIN(Name) AS MinName,        
	MAX(Name) AS MaxName,        
	MIN(SellStartDate) AS MinSellStartDate    
FROM Production.Product;       
--3    
SELECT COUNT(*) AS CountOfRows,        
	COUNT(Color) AS CountOfColor,            
	COUNT(DISTINCT Color) AS CountOfDistinctColor    
FROM Production.Product; 