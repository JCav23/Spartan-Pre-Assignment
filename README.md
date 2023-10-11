# Pre-Assignment :globe_with_miridians:

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

#### Exercisze 2
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


