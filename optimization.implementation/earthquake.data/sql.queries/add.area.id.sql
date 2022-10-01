use EarthquakeTracker

update Earthquakes.Earthquake
set AreaId = 1 where Id < 6000

update Earthquakes.Earthquake
set AreaId = 2 where Id > 6000 and Id < 12001

update Earthquakes.Earthquake
set AreaId = 3 where Id > 12000 and Id < 18001

update Earthquakes.Earthquake
set AreaId = 4 where Id > 18000 and Id < 24007

select * from Earthquakes.Earthquake
where Id < 12003