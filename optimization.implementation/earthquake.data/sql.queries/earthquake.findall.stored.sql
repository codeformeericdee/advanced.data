--use EarthquakeTracker

--exec InsertImport;

--select distinct t.name
--from sys.partitions p
--inner join sys.tables t
--on p.object_id = t.object_id
--where p.partition_number <> 1

create procedure Earthquakes.FindAllData @Area int
as

select

Date, Time Lat, Long, Dist, Depth, Direction, Xm, Md, Richter, Mw, Ms, Mb, AreaId, earthquakeTable.ModifiedDate as EarthquakeModified,

	areaTable.Name as AreaName, CityId, areaTable.ModifiedDate as AreaModified,
	cityTable.Name as CityName, CountryId, cityTable.ModifiedDate as CityModified,
	countryTable.Name as CountryName, countryTable.ModifiedDate as CountryModified

from Earthquakes.Earthquake earthquakeTable

	join Locations.Area areaTable on areaTable.Id = earthquakeTable.AreaId
	join Locations.City cityTable on cityTable.Id = areaTable.CityId
	join Locations.Country countryTable on countryTable.Id = cityTable.CountryId

	where AreaId = @Area

go