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
