--- Author: Eric Dee
-- 10/3/2022
-- Inserts data from a stored procedure.

	use ADM2012StateEmployeeSalaries
go

--	create table [ProceduralTable].proc_EmployeeTitleInfoSearches
--(
--	Id int identity(1,1) primary key,
--	NumberOfEmployeeRecords int not null,
--	LatestUpdate date not null,
--	SearchTerm nvarchar(50) not null,
--	Title nvarchar(100) not null,
--	HistoricalCount int not null,
--	TitlesEvaluated nvarchar(200) not null
--);

--	create type t_EmployeeTitleInfoSearches as table
--(
--	Id int identity(1,1) primary key,
--	NumberOfEmployeeRecords int not null,
--	LatestUpdate date not null,
--	SearchTerm nvarchar(50) not null,
--	Title nvarchar(100) not null,
--	HistoricalCount int not null,
--	TitlesEvaluated nvarchar(200) not null
--)

--go

	alter procedure [dbo].usp_PositionEvaluationWithStore @storedSearch nvarchar(50)
as

declare @tempInfo as t_EmployeeTitleInfoSearches
insert into @tempInfo exec [dbo].usp_PositionEvaluation @searchable = @storedSearch

	insert into [ProceduralTable].proc_EmployeeTitleInfoSearches
(
	NumberOfEmployeeRecords, LatestUpdate, SearchTerm, Title, HistoricalCount, TitlesEvaluated
) select NumberOfEmployeeRecords, LatestUpdate, SearchTerm, Title, HistoricalCount, TitlesEvaluated from @tempInfo tempTable
where tempTable.LatestUpdate not in (select LatestUpdate from [ProceduralTable].proc_EmployeeTitleInfoSearches)

go



exec [dbo].usp_PositionEvaluationWithStore @storedSearch = 'ACCOUNTANT I%'
select * from [ProceduralTable].proc_EmployeeTitleInfoSearches