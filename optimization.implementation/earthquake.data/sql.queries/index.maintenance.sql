create procedure QueryForIndexes as

-- Author: Eric Dee
-- Date: 10/1/2022
-- Description: A query to scan basic index data from all databases

select
schema_name(sysTables.schema_id) + '.' + sysTables.name as 'Schema.Table',
sysIndexes.name as IndexName,
STATS_DATE(sysTables.object_id, sysIndexes.index_id) as IndexCreation,

-- This is an example, but the type_desc column can be used for this.
case
	when sysIndexes.type = 0 then 'Heap'
	when sysIndexes.type = 1 then 'Clustered'
	when sysIndexes.type = 2 then 'Nonclustered'
	when sysIndexes.type = 3 then 'XML'
	else 'unknown'
end as IndexType

from sys.indexes sysIndexes
join sys.tables sysTables on sysIndexes.object_id = sysTables.object_id

where sysIndexes.name is not null

go

--select * from sys.indexes sysIndexes
--join sys.tables sysTables on sysIndexes.object_id = sysTables.object_id

--sys.indexes
--0 = Heap
--1 = Clustered
--2 = Nonclustered
--3 = XML

--sp_indexes
--0 = Statistics for a table 
--1 = Clustered 
--2 = Hashed 
--3 = Other