use ADMEDEarthquakeTracking
go
;
truncate table [Transform].Country
truncate table [Transform].City
truncate table [Transform].Area
truncate table [Transform].Earthquake
select * from [Transform].Country
select * from [Transform].City
select * from [Transform].Area
select * from [Transform].Earthquake