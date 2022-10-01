use AdventureWorks2017

select* from Person.Address a join Person.StateProvince s
on a.StateProvinceID = s.StateProvinceId;