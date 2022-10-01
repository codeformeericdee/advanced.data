use EarthquakeTracker
go

select Date, Richter, cityTable.Name as City, countryTable.Name as Country from Earthquakes.Earthquake earthquakeTable
join Locations.Area areaTable on earthquakeTable.AreaId = areaTable.Id
join Locations.City cityTable on areaTable.CityId = cityTable.Id
join Locations.Country countryTable on cityTable.CountryId = countryTable.Id
where AreaId = 4 and Richter > 2.5
group by Date, Richter, cityTable.Name, countryTable.Name
order by Date desc

SELECT * FROM sys.dm_db_missing_index_details
SELECT * FROM sys.dm_db_missing_index_group_stats
SELECT * FROM sys.dm_db_missing_index_groups
SELECT * FROM sys.dm_db_missing_index_columns(27)

-- Shortcut:
--SELECT mig.*, statement AS table_name, column_id, column_name, column_usage
--FROM sys.dm_db_missing_index_details AS mid
--CROSS APPLY sys.dm_db_missing_index_columns (mid.index_handle)
--INNER JOIN sys.dm_db_missing_index_groups AS mig ON mig.index_handle = mid.index_handle
--ORDER BY mig.index_group_handle, mig.index_handle, column_id; 

