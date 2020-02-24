--Derived Table
SELECT C.CustomerID, C.PersonID, Prods.SalesOrderID, Prods.ProductID 
FROM Sales.Customer AS C
INNER JOIN 
    (SELECT SOH.CustomerID, SOH.SalesOrderID, ProductID 
    FROM Sales.SalesOrderHeader AS SOH 
    INNER JOIN Sales.SalesOrderDetail  
    ON SOH.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID) AS Prods 
ON C.CustomerID = Prods.CustomerID;

--Common Table Expression or CTE
WITH Prods AS (
    SELECT SOH.CustomerID, SOH.SalesOrderID, ProductID 
    FROM Sales.SalesOrderHeader AS SOH 
    INNER JOIN Sales.SalesOrderDetail  
    ON SOH.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
)
SELECT C.CustomerID, C.PersonID, Prods.SalesOrderID, Prods.ProductID 
FROM Sales.Customer AS C
INNER JOIN Prods ON C.CustomerID = Prods.CustomerID;

--Nested subquery, plus using subquery for all logic
SELECT * FROM 
(   SELECT C.CustomerID, C.PersonID, Prods.SalesOrderID, Prods.ProductID 
    FROM Sales.Customer AS C
    INNER JOIN 
        (SELECT SOH.CustomerID, SOH.SalesOrderID, ProductID 
        FROM Sales.SalesOrderHeader AS SOH 
        INNER JOIN Sales.SalesOrderDetail  
        ON SOH.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID) AS Prods 
    ON C.CustomerID = Prods.CustomerID) AS Subquery ;