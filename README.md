# Pre-Assignment :globe_with_meridians:

#### Introduction :page_with_curl:

This Repo contains all public work and revision completed during pre-assignment period at Sparta.


## Project 1 - SQL Adventure Works

### Introduction

The following project explores the sample AdventureWorks database provided by Microsoft.
Original material this project was based on uses MSSQL Server and SQL Management Studio, however the project was completed using Azure Data Studio using an SQL Server hosted on a Docker container.

### Set Up

The container was started using official container images for MSSQL Server on Linux provided by docker documentation [here](https://hub.docker.com/_/microsoft-mssql-server)
* docker pull mcr.microsoft.com/mssql/server:2022-latest
The database was generated using the .bak file provided by Microsoft found [here](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms) (AdventureWorks2019.bak)
The file was then copyied onto the Docker container using bash commands:
* $ docker cp localfilepath ContainerID: /var/backups 

## Section 1: Window Functions

### OVER

* Window functions allow you to include aggregate calculations in your queries, WITHOUT otherwise changing the output in any way.
* The aggregate calculations is simply added on to the query as an additional column.
* It is also possible to *group* these calculations, just like we can with aggregate queries, using PARTITION. 

#### Exercize 1
Create a query with the following columns:
* FirstName and LastName, from the Person.Person table
* JobTitle, from the HumanResources.Employee table
* Rate, from the HumanResources.EmployeePayHistory table
* A derived column called "AverageRate" that returns the average of all values in the "Rate" column, in each row

#### Exercize 2
Enhance query from Exercize 1 by adding a derived column called:
"MaximumRate" that returns the largest of all values in the "Rate" column in each row.

#### Exercize 3
Enhance query from Exercize 2 by adding a derived column called:
"DiffFromAvgRate" that returns the results of the following calculations:
* An employee's pay rate, MINUS the average of all values in the "Rate" column.

#### Exercize 4
Enhance query from Exercise 3 by adding a derived column called:
"PercentofMaxRate" that returns the result of the following calculation:
* An employees's pay rate, DIVIDED BY the maximum of all values in the "Rate" column, times 100.

### PARTITION BY

* PARTITION BY allows us ot compute aggregate totals for groups within our data, while still retaining row-level detail
* PARTITION BY assigns each row of your query output to a group, without collapsing your data into fewer rows as with GROUP BY
* Instead of groups being assinged based on the distinct values of A:: the non-aggregated columns of our data, we need to specify the columns these groups will be based on

#### Exercize 1 
Create a query with the following columns:
* "Name" From the Production.Product Table which can be aliased as "Product Name"
* "ListPrice" From the Production.Product Table
* "Name" From the Production.ProductSubcategory Table which can be aliased as "ProductSubcategory"
* "Name From the Production.ProductCategory Table which can be aliased as "ProductCategory"

#### Exercize 2
Enhance query from Exercize 1 by adding a derived column called 
* "AvgPriceByCategory" that returns the average ListPrice __for the product category in each given row__


#### Exercize 3
Enhance query from Exercize 2 by adding a derived column called:
* "AvgPriceByCategoryAndSubcategory" that returns the average ListPrice __for the product category ***AND*** subcategory in each given row__

#### Exercize 4
Enhance query from Exercize 3 by adding a derived column called:
"ProductVsCategoryDelta" that returns the result of the following calculation:
* A product's list price, MINUS the average ListPrice for that product's category

### ROW_NUMBER

* Thus far, Window Functions have been utilized as a more advanced alternative to aggregate Queries.
* However, they also give something entirely new: the ability to rank records within the data.
* These rankings can either be applied across the entire query output, or to partitioned groups within it

#### Exercize 1
Create a query with the following columns:
* "Name" from the Production.Product Table which can be aliased as "Product Name"
* "ListPrice" from the Production.Product Table
* "Name" from the Production.ProductSubcategory Table which can be aliased as "ProductSubcategory"
* "Name" from the Production.ProductSubcategory Table which can be aliased as "ProductCategory"

#### Exercize 2
Enhance your query from Exercize 1 by adding a derived column called:
* "Price Rank" that ranks all records in the dataset by ListPrice, in descending order. That is to say the product with the most expensive price should have a rank of 1, and the product with the least expensive price should have a rank equal to the number of records in the dataset

#### Exercize 3
Enhance your query from Exercize 2 by adding a derived column called:
* "CategoryPriceRank" that ranks all products by ListPrice __within each category__ in descending order.

#### Exercize 4
Enhance your query from Exercize 3 by addind a derived column called:
* "Top 5 Price In Category" that returns the string "Yes" if a product has one of the top 5 list prices in its product category, and "No" if it does not.

### RANK / DENSE_RANK

* If you are trying to pick exactly one record from each partition group - either the first or the last - use ROW_NUMBER.
* This is probably the most common scenario
* RANK and DENSE_RANK are helpful in rarer, more specialized cases.
* It ultimately depends on whate you're trying to get out of your data. 

#### Exercize 1 
Using the query from ROW_NUMBER Exercize 4, add a derived column called:
* "Category Price Rank With Rank" that uses the RANK function to rank all products by ListPrice __within each category__ in descending order. 

#### Exercize 2
Modify the query from Exercize 1 by adding a derived column called:
* "Category Price Rank With Dense Rank" that uses the DENSE_RANK function to rank all products by ListPrice __within each category__ 
