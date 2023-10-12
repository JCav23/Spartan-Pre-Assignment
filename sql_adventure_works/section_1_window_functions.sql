-- 1) All Rows
SELECT *
FROM [AdventureWorks2019].[HumanResources].[Employee]

-- 2) Count of all rows

SELECT SUM([TotalDue])
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

-- 3) Adding new fields to aggregate query

SELECT TotalSales = SUM([TotalDue]), SalesPersonID
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
GROUP BY SalesPersonID;

-- 4) Sales Person YTD sales

SELECT [BusinessEntityID], 
[TerritoryID],
[SalesQuota],
[Bonus],
[CommissionPct],
[SalesYTD],
[SalesLastYear],
[Total YTD Sales] = SUM([SalesYTD])OVER(),
[Max YTD Sales] = MAX([SalesYTD])OVER(),
[% of Best Performer] = [SalesYTD]/MAX([SalesYTD])OVER()
FROM [AdventureWorks2019].[Sales].[SalesPerson]

-- 5) YTD Sales Via Aggregate Query

SELECT MAX([SalesYTD])
FROM [AdventureWorks2019].[Sales].[SalesPerson]

-- Sum of line totals, grouped by ProductID AND OrderQty, in an aggregate query

SELECT
ProductID,
OrderQty,
LineTotal = SUM(LineTotal)
FROM AdventureWorks2019.Sales.SalesOrderDetail
GROUP BY
ProductID,
OrderQty
ORDER BY 1, 2 DESC;

-- Sum of Line Totals via OVER

SELECT
ProductID,
SalesOrderID,
SalesOrderDetailID,
OrderQty,
UnitPrice,
UnitPriceDiscount,
LineTotal,
ProductID_LineTotal = SUM(LineTotal)OVER(PARTITION BY ProductID, OrderQty)
FROM AdventureWorks2019.Sales.SalesOrderDetail
ORDER BY ProductID, OrderQty DESC

-- Sum of Line Totals by Sales Order ID

-- Via Window Function
SELECT 
SalesOrderID,
SalesOrderDetailID,
LineTotal,
SalesOrderID_LineTotal = Sum(LineTotal) OVER(PARTITION BY SalesOrderID)
FROM AdventureWorks2019.Sales.SalesOrderDetail
ORDER BY SalesOrderID

-- Via Aggregate Query
SELECT
SalesOrderID,
LineTotal = SUM(LineTotal)
FROM AdventureWorks2019.Sales.SalesOrderDetail
ORDER BY SalesOrderID

-- Ranking all records within each group of Sales Order IDs
SELECT 
SalesOrderID,
SalesOrderDetailID,
LineTotal,
ProductID_LineTotal = SUM(LineTotal) OVER(PARTITION BY SalesOrderID),
Ranking = ROW_NUMBER() OVER(ORDER BY LineTotal DESC)
FROM AdventureWorks2019.Sales.SalesOrderDetail
ORDER BY 5

-- Ranking ALL records by line total - no groups! 

SELECT 
SalesOrderID,
SalesOrderDetailID,
LineTotal,
"Ranking" = ROW_NUMBER()OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
"RankingWithRank" = RANK()OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC),
"RankingWithDense_Rank" = DENSE_RANK() OVER(PARTITION BY SalesOrderID ORDER BY LineTotal DESC)
FROM AdventureWorks2019.Sales.SalesOrderDetail
ORDER BY SalesOrderID, LineTotal DESC