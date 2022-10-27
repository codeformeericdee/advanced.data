use ADMEDEarthquakeTracking
truncate table [Extract].Earthquake;
insert into [Extract].Earthquake
(
		id, date, time, lat, long, country, city, area, dist, depth, direction, xm, md, richter, mw, ms, mb
) select id, date, time, lat, long, country, city, area, dist, depth, direction, xm, md, richter, mw, ms, mb from Import.Earthquake;