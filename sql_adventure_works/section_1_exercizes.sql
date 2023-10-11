-- OVER()
-- Exercize 1 
SELECT P.FirstName, 
P.LastName, 
E.JobTitle, 
EPH.Rate, 
AverageRate = AVG(EPH.Rate)OVER()
FROM AdventureWorks2019.Person.Person as P
JOIN AdventureWorks2019.HumanResources.Employee as E
ON P.BusinessEntityID = E.BusinessEntityID
JOIN AdventureWorks2019.HumanResources.EmployeePayHistory as EPH
ON E.BusinessEntityID = EPH.BusinessEntityID

-- Exercize 2
SELECT P.FirstName, 
P.LastName, 
E.JobTitle, 
EPH.Rate, 
AverageRate = AVG(EPH.Rate)OVER(),
MaximumRate = MAX(EPH.RATE)OVER()
FROM AdventureWorks2019.Person.Person as P
JOIN AdventureWorks2019.HumanResources.Employee as E
ON P.BusinessEntityID = E.BusinessEntityID
JOIN AdventureWorks2019.HumanResources.EmployeePayHistory as EPH
ON E.BusinessEntityID = EPH.BusinessEntityID

-- Exercize 3
SELECT P.FirstName, 
P.LastName, 
E.JobTitle, 
EPH.Rate, 
AverageRate = AVG(EPH.Rate)OVER(),
MaximumRate = MAX(EPH.RATE)OVER(),
DiffFromAvgRate = EPH.Rate-AVG(EPH.Rate)OVER()
FROM AdventureWorks2019.Person.Person as P
JOIN AdventureWorks2019.HumanResources.Employee as E
ON P.BusinessEntityID = E.BusinessEntityID
JOIN AdventureWorks2019.HumanResources.EmployeePayHistory as EPH
ON E.BusinessEntityID = EPH.BusinessEntityID

-- Exercize 4
SELECT P.FirstName, 
P.LastName, 
E.JobTitle, 
EPH.Rate, 
AverageRate = AVG(EPH.Rate)OVER(),
MaximumRate = MAX(EPH.Rate)OVER(),
DiffFromAvgRate = EPH.Rate-AVG(EPH.Rate)OVER(),
PercentOfMaxRate = (EPH.Rate/MAX(EPH.Rate)OVER())*100 
FROM AdventureWorks2019.Person.Person as P
JOIN AdventureWorks2019.HumanResources.Employee as E
ON P.BusinessEntityID = E.BusinessEntityID
JOIN AdventureWorks2019.HumanResources.EmployeePayHistory as EPH
ON E.BusinessEntityID = EPH.BusinessEntityID

--PARTITION BY
--Exercize 1 
SELECT P.Name AS "ProductName",
P.ListPrice,
PS.Name AS "ProductSubcategory",
PC.Name AS "ProductCategory"
FROM AdventureWorks2019.Production.Product AS P
JOIN AdventureWorks2019.Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

-- Excersize 2
SELECT P.Name AS ProductName,
P.ListPrice,
PS.Name AS ProductSubcategory,
PC.Name AS ProductCategory,
AvgPriceByCategory = AVG(P.ListPrice)OVER(PARTITION BY PC.Name)
FROM AdventureWorks2019.Production.Product AS P
JOIN AdventureWorks2019.Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

-- Exercize 3
SELECT P.Name AS ProductName,
P.ListPrice,
PS.Name AS ProductSubcategory,
PC.Name AS ProductCategory,
AvgPriceByCategory = AVG(P.ListPrice)OVER(PARTITION BY PC.Name),
AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice)OVER(PARTITION BY PS.Name, PC.Name)
FROM AdventureWorks2019.Production.Product AS P
JOIN AdventureWorks2019.Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID

-- Exercize 4
SELECT P.Name AS ProductName,
P.ListPrice,
PS.Name AS ProductSubcategory,
PC.Name AS ProductCategory,
AvgPriceByCategory = AVG(P.ListPrice)OVER(PARTITION BY PC.Name),
AvgPriceByCategoryAndSubcategory = AVG(P.ListPrice)OVER(PARTITION BY PS.Name, PC.Name),
ProductVsCategoryDelta = P.ListPrice - AVG(P.ListPrice) OVER(PARTITION BY PC.Name)
FROM AdventureWorks2019.Production.Product AS P
JOIN AdventureWorks2019.Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID