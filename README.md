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

### Section 1: Window Functions

* Window functions allow you to include aggregate calculations in your queries, WITHOUT otherwise changing the output in any way.
* The aggregate calculations is simply added on to the query as an additional column.
* It is also possible to *group* these calculations, just like we can with aggregate queries, using PARTITION. 

#### Exercize 1
Create a query with the following columns:

* FirstName and LastName, from the Person.Person table
* JobTitle, from the HumanResources.Employee table
* Rate, from the HumanResources.EmployeePayHistory table
* A derived column called "AverageRate" that returns the average of all values in the "Rate" column, in each row

