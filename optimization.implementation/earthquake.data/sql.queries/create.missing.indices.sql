use EarthquakeTracker

--create index iRichterDate
--on Earthquakes.Earthquake(AreaId, Richter, Date)

create index iGPSCoordinates
on Earthquakes.Earthquake(AreaId, Lat, Long)