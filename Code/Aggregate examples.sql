--This one doesn't work!
SELECT SalesORderID, OrderDate, CustomerID, TotalDue, 
    TotalDue/Sum(TotalDue)
FROM Sales.SalesOrderHeader;

--Common table expression
WITH SubTotals AS (
        SELECT CustomerID, Sum(TotalDue) AS TotalPerCust
        FROM Sales.SalesOrderHeader
        GROUP BY CUstomerID
)
SELECT SalesOrderID, ORderDate, SOH.CustomerID, TotalDue, 
    FORMAT(TotalDue/TotalPerCust,'P') AS PercentOfTotal
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN SubTotals 
ON SubTotals.CustomerID = SOH.CustomerID
ORDER BY SOH.CustomerID;

--Derived table
SELECT SalesOrderID, ORderDate, SOH.CustomerID, TotalDue, 
    FORMAT(TotalDue/TotalPerCust,'P') AS PercentOfTotal
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN  
(
        SELECT CustomerID, Sum(TotalDue) AS TotalPerCust
        FROM Sales.SalesOrderHeader
        GROUP BY CUstomerID
) AS SubTotals
ON SubTotals.CustomerID = SOH.CustomerID
ORDER BY SOH.CustomerID;

--Correlated subquery
SELECT SalesOrderID, ORderDate, SOH.CustomerID, TotalDue, 
    FORMAT(TotalDue/(SELECT SUM(TotalDue) AS CUstomerTotal 
    FROM Sales.SalesOrderHeader 
    WHERE CustomerID = SOH.CUSTOMERID),'P') As PercentOfTotal
FROM Sales.SalesOrderHeader AS SOH
ORDER BY SOH.CustomerID;

--Windowing Function
SELECT SalesOrderID, ORderDate, SOH.CustomerID, TotalDue, 
    FORMAT(TotalDue/SUM(TotalDue) OVER(PARTITION BY CUSTOMERID),'P') As PercentOfTotal
FROM Sales.SalesOrderHeader AS SOH
ORDER BY SOH.CustomerID;
