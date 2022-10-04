use ADM2012StateEmployeeSalaries
go
select * from Assignment.[2012StateEmployeePay]

alter table Assignment.[2012StateEmployeePay]
add ModificationDate date

update Assignment.[2012StateEmployeePay]
set ModificationDate = GETDATE()