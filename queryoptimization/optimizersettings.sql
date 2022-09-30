set SHOWPLAN_TEXT on;
go

use AdventureWorks2017
select * from HumanResources.Employee e join Person.Address a
on e.BusinessEntityID = a.AddressID and e.BusinessEntityID = 10;
go

set SHOWPLAN_TEXT off;