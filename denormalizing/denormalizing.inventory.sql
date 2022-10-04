--- Author: Eric Dee
-- 10/4/2022
-- Procedure to denormalize sets that can have various parts of the same type for different sets

use LEGO
go

--create table DenormalizedSets
--(
--	Id int identity(1,1) primary key not null,
--	SetId int not null,
--	SetNumber varchar(50) not null,
--	SetQuantity int not null,
--	PartNumber varchar(50) not null,
--	InventoryVersion int not null,
--	InventoryId int not null,
--	PartColor int not null,
--	PartQuantity int not null,
--	PartIsSpare varchar(50) not null
--)
--go

alter procedure [Procedure].usp_DenormalizeSets
as

select 
inventory_sets.id as SetID, 
inventory_sets.set_num as SetNumber, 
inventory_sets.quantity as SetQuantity,
part_num as PartNumber,
inventories.version as InventoryVersion,
inventory_parts.inventory_id as InventoryId,
inventory_parts.color_id as PartColor,
inventory_parts.quantity as PartQuantity,
inventory_parts.is_spare as PartIsSpare
from inventory_sets

join inventories on inventories.set_num = inventory_sets.set_num
join inventory_parts on inventory_parts.inventory_id = inventories.id
group by 
part_num, 
inventory_sets.id, 
inventory_sets.set_num,
inventory_sets.quantity,
part_num,
inventories.version,
inventory_parts.inventory_id,
inventory_parts.color_id,
inventory_parts.quantity,
inventory_parts.is_spare
go

alter procedure [Procedure].usp_InsertDenormalizedSets
as

truncate table DenormalizedSets
insert into DenormalizedSets
(
	SetId, SetNumber, SetQuantity, PartNumber, InventoryVersion, InventoryId, PartColor, PartQuantity, PartIsSpare
) exec [Procedure].usp_DenormalizeSets
go

exec [Procedure].usp_DenormalizeSets
exec [Procedure].usp_InsertDenormalizedSets
select top 1000* from DenormalizedSets