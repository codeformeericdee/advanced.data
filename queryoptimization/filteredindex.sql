use AdventureWorks2017;

create index i_unitprice
on Sales.SalesOrderDetail(UnitPrice)
where UnitPrice > 1000;
	select SalesOrderDetailID, UnitPrice
	from Sales.SalesOrderDetail
	where UnitPrice > 2000;