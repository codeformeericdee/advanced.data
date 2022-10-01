-- Run the procedure:

use EarthquakeTracker 
go
exec [dbo].usp_Index
select * from [Maintenance].IndexData