use ADM2012StateEmployeeSalaries
go

--alter table Assignment.[2012StateEmployeePay]
--add ModificationDate date
--go

--alter table Assignment.[2012StateEmployeePay]
--add PersonId int identity(1,1) primary key
--go

--update Assignment.[2012StateEmployeePay]
--set ModificationDate = GETDATE()
--go

--- Author: Eric Dee
-- 10/3/2022
-- Searches for a string to find different position information in a company.

alter PROCEDURE [dbo].usp_PositionEvaluation @searchable nvarchar(50)
as

-- Local

declare @fullCount int = 
						( 	  
							select 
						COUNT(*) as NumberOfEmployeeRecords
						from Assignment.[2012StateEmployeePay] 
						);

-- Query

	select 
@fullCount as NumberOfEmployeeRecords,
MAX(ModificationDate) as LatestUpdate,
@searchable as SearchTerm,
CASE
	WHEN Position_Title LIKE @searchable THEN 'Found: ' + Position_Title
	ELSE NULL END AS Title,
	COUNT(*) AS Count,
'The sum of ' + @searchable + ' historical persons' as TitlesEvaluated

from Assignment.[2012StateEmployeePay]
where Position_Title like @searchable
group by Position_Title

go



EXEC [dbo].usp_PositionEvaluation @searchable = 'ACCOUNTANT I%'

	select*
from Assignment.[2012StateEmployeePay]