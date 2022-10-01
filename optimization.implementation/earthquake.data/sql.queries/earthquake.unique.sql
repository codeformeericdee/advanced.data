use EarthquakeTracker
go

alter table Earthquakes.Earthquake
drop constraint UCDate;
go

alter table Locations.Area
add constraint UCAreaName unique (Name);
go

alter table Locations.City
add constraint UCCityName unique (Name);
go

alter table Locations.Country
add constraint UCCountryName unique (Name);
go