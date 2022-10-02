use ADM2012StateEmployeeSalaries
go

alter procedure ExtractEmployeePay
as

insert into Assignment.[2012StateEmployeePay]
(
	Calendar_Year, Agency_Name, Position_Title, Employee_Name, YTD_Gross_Pay
) select * from [Extract].[2012StateEmployeePay] eTable
where eTable.Employee_Name not in (select Employee_Name from Assignment.[2012StateEmployeePay])

go

exec ExtractEmployeePay

select top 100* from Assignment.[2012StateEmployeePay]