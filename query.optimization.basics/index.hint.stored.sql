use sample;

select* from new_addresses a with (index(i_stateprov))
where a.StateProvinceID = 9;