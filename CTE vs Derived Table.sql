

--Nested sub-query
SELECT CustomerId, SalesOrderId, OrderDate, TotalDue, MonthSales.OrderYear, 
	MonthSales.OrderMonth, MonthSales, YearSales
FROM (
	SELECT CustomerID, SalesOrderID, CAST(OrderDate AS DATE) AS OrderDate, 
		TotalDue,
		YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth
	FROM Sales.SalesOrderHeader) AS SOH
JOIN (
	SELECT YEAR(OrderDate) AS OrderYear, 
		MONTH(OrderDate) AS OrderMonth,
		SUM(TotalDue) AS MonthSales, YearSales
	FROM Sales.SalesOrderHeader A
	JOIN (
		SELECT YEAR(OrderDate) AS OrderYear, SUM(TotalDue) AS YearSales
		FROM Sales.SalesOrderHeader 
		GROUP BY Year(OrderDate) 
		) AS YearSales ON YearSales.OrderYear = YEAR(A.OrderDate)
		GROUP BY YEAR(OrderDate), Month(OrderDate), YearSales
		)
	AS MonthSales ON MonthSales.OrderYear = SOH.OrderYear
		AND MonthSales.OrderMonth = SOH.OrderMonth
ORDER BY SalesOrderID;

--CTE

WITH 
Months AS ( 
	SELECT YEAR(OrderDate) AS OrderYear, 
		MONTH(OrderDate) AS OrderMonth,
		SUM(TotalDue) AS MonthSales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate), MONTH(OrderDate)
	),
Years AS (
	SELECT SUM(MonthSales) AS YearSales,
		OrderYear 
	FROM Months 
	GROUP BY OrderYear)
SELECT CustomerID, SalesOrderID, CAST(OrderDate AS Date) AS OrderDate, 
	YEAR(OrderDate) AS OrderYear, 
	MONTH(OrderDate) AS OrderMonth, MonthSales, YearSales
FROM Sales.SalesOrderHeader AS SOH
JOIN Years ON Years.OrderYear = YEAR(OrderDate) 
JOIN Months ON Months.OrderYear = YEAR(OrderDate) 
	AND Months.OrderMonth = MONTH(OrderDate)
ORDER BY SalesOrderID;


