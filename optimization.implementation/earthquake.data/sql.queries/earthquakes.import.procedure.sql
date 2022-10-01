--- Stored procedure for
--- inserting data from an unorganized flat file
--- by sorting it into tables
--- copyright Eric Dee
--- 9/28/2022
use EarthquakeTracker
go

alter procedure InsertImport
as

insert into Locations.Country
(
	Name, ModifiedDate
) select distinct country, getdate() from Import.earthquakeall sTable
where sTable.country not in (select Name from Locations.Country);

insert into Locations.City
(
	Name, CountryId, ModifiedDate
) select distinct city, 1, getdate() from Import.earthquakeall sTable
where sTable.area not in (select Name from Locations.City);

insert into Locations.Area
(
	Name, CityId, ModifiedDate
) select distinct area, 1, getdate() from Import.earthquakeall sTable
where sTable.area not in (select Name from Locations.Area);

insert into Earthquakes.Earthquake
(
	Date, Time, Lat, Long, Dist, Depth, Direction, Xm, Md, Richter, Mw, Ms, Mb, AreaId, ModifiedDate
) select date, time, lat, long, dist, depth, direction, xm, md, richter, mw, ms, mb, NULL, getdate() from Import.earthquakeall sTable
where sTable.date not in (select Date from Earthquakes.Earthquake);

go