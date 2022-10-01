use sample;

create table state
(State_ID int identity primary key, State_Name varchar(120) not null);

insert state (State_Name) values ('Idaho'), ('Iowa'), ('Indiana'), ('Texas');
go

create statistics State_Statistics on State(State_Name);
go

select object_id, stats_id, range_high_key, range_rows, equal_rows
from sys.dm_db_stats_histogram(OBJECT_ID('State'), 2);