--select ecp.objtype as Object_Type
--from sys.dm_exec_query_stats as qs
--join sys.dm_exec_cached_plans ecp on qs.plan_handle = ecp.plan_handle

select ecp.objtype as Object_Type,
(select t.text from sys.dm_exec_sql_text(qs.sql_handle) as t) as Adhoc_Batch, 
qs.execution_count as Counts,
(qs.total_worker_time/1000) as Total_Worker_Time,
(qs.total_physical_reads/qs.execution_count) as Physical_Reads_To_Execution_Count,
(qs.total_logical_writes/qs.execution_count) as Logical_Writes_To_Execution_Count,
(qs.total_elapsed_time/1000) as Total_Elapsed_Time,
(qs.total_elapsed_time/1000/qs.execution_count) as Elapsed_Time_To_Execution_Count,
qs.last_execution_time as Last_Execution_Time,
qs.creation_time as Creation_Time

from sys.dm_exec_query_stats as qs
join sys.dm_exec_cached_plans ecp on qs.plan_handle = ecp.plan_handle

order by Counts desc;