-- Dependencies:

create table [EarthquakeTracker].[Maintenance].IndexData
(
	Id int identity(1,1) not null primary key,
	TableSchema nvarchar(100) not null,
	IndexName nvarchar(100) not null unique,
	IndexCreation Date null,
	IndexType nvarchar(12) not null
)

go

create type IndexTableType as table
(
	Id int identity(1,1) not null primary key,
	TableSchema nvarchar(100) not null,
	IndexName nvarchar(100) not null,
	IndexCreation Date null,
	IndexType nvarchar(12) not null
)

go

create procedure usp_Index as

-- Author: Eric Dee
-- Date: 10/1/2022
-- Description: A query to insert index data into a specific schema using a system based stored procedure

declare @tempInfo as IndexTableType
insert into @tempInfo exec [dbo].QueryForIndexes

insert into [Maintenance].IndexData
(
	TableSchema, IndexName, IndexCreation, IndexType
) select TableSchema, IndexName, IndexCreation, IndexType from @tempInfo tmp
where tmp.IndexName not in (select IndexName from [Maintenance].IndexData)

go




-- Run the procedure:

use EarthquakeTracker 
go
exec [dbo].usp_Index
select * from [Maintenance].IndexData