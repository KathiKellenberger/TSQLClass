-- Listing 6-1. Using a Subquery in the IN List 
SELECT CustomerID, AccountNumber    
FROM Sales.Customer    
WHERE CustomerID IN (SELECT CustomerID FROM Sales.SalesOrderHeader);   

SET STATISTICS IO ON ;

-- Listing 6-2. A Subquery with NOT IN 
SELECT CustomerID, AccountNumber    
FROM Sales.Customer    
WHERE CustomerID NOT IN        
	(SELECT CustomerID FROM Sales.SalesOrderHeader); 

SELECT C.CustomerID, c.AccountNumber 
FROM Sales.Customer AS C
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH
	ON C.CustomerID = SOH.CustomerID
WHERE SOH.SalesOrderID IS NULL; 

SELECT CustomerID, AccountNumber    
FROM Sales.Customer  AS C
WHERE NOT EXISTS        
	(SELECT CustomerID 
	FROM Sales.SalesOrderHeader AS SOH 
	WHERE SOH.CustomerID = C.CustomerID); 



-- Listing 6-3. A Subquery with NOT IN 
--1    
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode    
FROM Sales.CurrencyRate    
WHERE CurrencyRateID NOT IN        
	(SELECT CurrencyRateID         
	FROM Sales.SalesOrderHeader);       
--2    
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode    
FROM Sales.CurrencyRate    
WHERE CurrencyRateID NOT IN        
	(SELECT CurrencyRateID         
	FROM Sales.SalesOrderHeader         
	WHERE CurrencyRateID IS NOT NULL);  
