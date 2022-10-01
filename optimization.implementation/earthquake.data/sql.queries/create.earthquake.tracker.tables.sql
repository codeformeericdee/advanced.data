drop table [EarthquakeTracker].[Earthquakes].Earthquake
drop table [EarthquakeTracker].[Locations].Area
drop table [EarthquakeTracker].[Locations].City
drop table [EarthquakeTracker].[Locations].Country
go

create table [EarthquakeTracker].[Earthquakes].Earthquake
(
	Id int identity (1,1) primary key,
	Date date,
	Time time(7),
	Lat float,
	Long float,
	Dist float,
	Depth nvarchar(50),
	Direction nvarchar(50),
	Xm float,
	Md float,
	Richter float,
	Mw float,
	Ms float,
	Mb float,
	AreaId int,
	ModifiedDate date
);
go

create table [EarthquakeTracker].[Locations].Area
(
	Id int identity(1,1) primary key,
	Name nvarchar(50),
	CityId int,
	ModifiedDate date
);
go

create table [EarthquakeTracker].[Locations].City
(
	Id int identity(1,1) primary key,
	Name nvarchar(50),
	CountryId int,
	ModifiedDate date
);
go

create table [EarthquakeTracker].[Locations].Country
(
	Id int identity(1,1) primary key,
	Name nvarchar(50),
	ModifiedDate date
);
go