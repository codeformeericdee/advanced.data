set SHOWPLAN_TEXT on;
go

use AdventureWorks2017;

select * from Person.Address a with (INDEX(0))
where a.StateProvinceID = 32;
go

set SHOWPLAN_TEXT off;