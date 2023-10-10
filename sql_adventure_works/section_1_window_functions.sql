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
