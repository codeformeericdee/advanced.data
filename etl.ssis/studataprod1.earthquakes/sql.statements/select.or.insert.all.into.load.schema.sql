--- SQL for creating or inserting into load tables meant for SSIS
--- Written by Eric Dee
--- 10/25/2022



IF object_id('[Load].Area') is null
	SELECT* INTO [Load].Area from [Transform].Area
ELSE
	SET IDENTITY_INSERT [Load].Area ON
	;
	INSERT INTO [Load].Area(Id, Name, CityId, ModifiedDate) 
	SELECT Id, Name, CityId, ModifiedDate FROM [Transform].Area
	;
	SET IDENTITY_INSERT [Load].Area OFF
	;



IF object_id('[Load].City') is null
	SELECT* INTO [Load].City from [Transform].City
ELSE
	SET IDENTITY_INSERT [Load].City ON
	;
	INSERT INTO [Load].City(Id, Name, CountryId, ModifiedDate)
	SELECT Id, Name, CountryId, ModifiedDate FROM [Transform].City
	;
	SET IDENTITY_INSERT [Load].City OFF
	;



IF object_id('[Load].Country') is null
	SELECT* INTO [Load].Country from [Transform].Country
ELSE
	SET IDENTITY_INSERT [Load].Country ON
	;
	INSERT INTO [Load].Country(Id, Name, ModifiedDate)
	SELECT Id, Name, ModifiedDate FROM [Transform].Country
	;
	SET IDENTITY_INSERT [Load].Country OFF
	;



IF object_id('[Load].Earthquake') is null
	SELECT* INTO [Load].Earthquake from [Transform].Earthquake
ELSE
	SET IDENTITY_INSERT [Load].Earthquake ON
	;
	INSERT INTO [Load].Earthquake(Id, Date, Time, Lat, Long, Dist, Depth, Direction, Xm, Md, Richter, Mw, Ms, Mb, AreaId, ModifiedDate)
	SELECT Id, Date, Time, Lat, Long, Dist, Depth, Direction, Xm, Md, Richter, Mw, Ms, Mb, AreaId, ModifiedDate FROM [Transform].Earthquake
	;
	SET IDENTITY_INSERT [Load].Earthquake OFF
	;