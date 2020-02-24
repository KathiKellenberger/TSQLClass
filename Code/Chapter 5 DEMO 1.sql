SELECT *
FROM Sales.SalesOrderHeader
SELECT *
FROM Sales.SalesOrderDetail


-- Listing 5-1. Joining Two Tables 
SELECT s.SalesOrderID, OrderDate, s.TotalDue, d.SalesOrderDetailID,
	d.ProductID, d.OrderQty
FROM Sales.SalesOrderHeader AS s
	INNER JOIN Sales.SalesOrderDetail AS d ON s.SalesOrderID = d.SalesOrderID;
/*
FROM 
WHERE 
SELECT 
ORDER BY
*/



--Note using an alias, have to use entire table name
SELECT Sales.SalesOrderHeader.SalesOrderID, OrderDate, TotalDue, SalesOrderDetailID,
	ProductID, OrderQty
FROM Sales.SalesOrderHeader
	INNER JOIN Sales.SalesOrderDetail
	ON Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID;

-- Listing 5-2. Writing an Incorrect Query 
SELECT s.SalesOrderID, OrderDate, TotalDue, SalesOrderDetailID,
	d.ProductID, d.OrderQty
FROM Sales.SalesOrderHeader AS s
	INNER JOIN Sales.SalesOrderDetail d ON 1 = 1;

--Incorrect join
SELECT s.SalesOrderID, OrderDate, TotalDue, d.SalesOrderID, SalesOrderDetailID,
	d.ProductID, d.OrderQty
FROM Sales.SalesOrderHeader AS s
	INNER JOIN Sales.SalesOrderDetail AS d ON S.SalesOrderID = D.SalesOrderDetailID;

select count(*)
from Sales.SalesOrderDetail

select cast(31465 as bigint) * cast(121317 as bigint)

SELECT Soh.SalesOrderID, Soh.OrderDate, Cust.CustomerID, Cust.AccountNumber
FROM Sales.SalesOrderHeader AS SOH
	INNER JOIN Sales.Customer AS Cust ON SOH.CustomerID = Cust.CustomerID


-- Listing 5-3. Joining Two Tables with Different Column Names 
SELECT c.CustomerID, c.PersonID, p.BusinessEntityID, p.LastName
FROM Sales.Customer AS c
	INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID;


-- Listing 5-4. Joining Two Columns 
SELECT sod.SalesOrderID, sod.SalesOrderDetailID,
	so.ProductID, so.SpecialOfferID, so.ModifiedDate
FROM Sales.SalesOrderDetail AS sod
	INNER JOIN Sales.SpecialOfferProduct AS so
	ON so.ProductID = sod.ProductID AND
		so.SpecialOfferID = sod.SpecialOfferID
WHERE sod.SalesOrderID IN (51116,51112);

SELECT *
FROM Sales.SpecialOfferProduct


-- Listing 5-5. Joining Three Tables 
SELECT soh.SalesOrderID
	, soh.OrderDate
	, p.ProductID
	, p.Name
	, sod.OrderQty
FROM Sales.SalesOrderHeader as soh
	INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
	INNER JOIN Production.Product AS p ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID;   

