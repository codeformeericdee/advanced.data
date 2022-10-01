use sample;
select * into new_addresses from AdventureWorks2017.Person.Address
go

create index i_stateprov on new_addresses(StateProvinceID)

-- Uses a new table to remove indices that would be too optimal, in order to show the function of the optimization process