use ADMEDEarthquakeTracking
go
;



create procedure sp_ExtractTransformQuakesImport as


truncate table [Transform].Country
insert into [Transform].Country(
	Name, ModifiedDate
) select distinct country, GETDATE() from [Extract].Earthquake
;


truncate table [Transform].City
insert into [Transform].City(
	Name, CountryId, ModifiedDate
) select distinct city, NULL, GETDATE() from [Extract].Earthquake
; 


truncate table [Transform].Area
insert into [Transform].Area(
	Name, CityId, ModifiedDate
) select distinct area, NULL,  GETDATE() from [Extract].Earthquake
; 


truncate table [Transform].Earthquake
insert into [Transform].Earthquake(
	Date, Time, Lat, Long, Dist, Depth, Direction, Xm, Md, Richter, Mw, Ms, Mb, AreaId, ModifiedDate
) select date, time, lat, long, dist, depth, direction, xm, md, richter, mw, ms, mb, NULL, GETDATE() from [Extract].Earthquake
; 


go
;



exec sp_ExtractTransformQuakesImport
select * from [Transform].Country
select * from [Transform].City
select * from [Transform].Area
select * from [Transform].Earthquake
;