use sample;

select counter, occurrence, value
from sys.dm_exec_query_optimizer_info
where value is not null
and counter like 'search 1%';