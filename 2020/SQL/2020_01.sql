drop table if exists dbo.#inputRecords
;
drop table if exists dbo.#inputRecordsCombos2
;
drop table if exists dbo.#inputRecordsCombos3
;

-- Create temp table to store the input
create table #inputRecords
(
	inputValue int
)
;
go

bulk insert #inputRecords
--Update to the folder and name of your input file
from 'C:\Files\2020_01_input.txt'
with
(
	--fieldterminator = '\t', -- No additional fields in this input.
	rowterminator = '0x0a' -- Input files have the Linux LF line end. Use the hex notation '0x0A' to signify line end.
	--, keepnulls
)
;
go

select
	ir1.inputValue as inputValue1
	, ir2.inputValue as inputValue2
	into #inputRecordsCombos2
from
	#inputRecords ir1
	cross join #inputRecords ir2 -- Join every record to every record
;
go

select
	irc.inputValue1
	, irc.inputValue2
	, ir.inputValue as inputValue3
	into #inputRecordsCombos3
from
	#inputRecords ir
	cross join #inputRecordsCombos2 irc -- Join every record to every record
;
go

select distinct
	'Part I' as partName
	, irc.inputValue1 * irc.inputValue2 as multipliedValue
from
	#inputRecordsCombos2 irc
where
	irc.inputValue1 + irc.inputValue2 = 2020
;
go

select distinct
	'Part II' as partName
	, irc.inputValue1 * irc.inputValue2 * irc.inputValue3 as multipliedValue
from
	#inputRecordsCombos3 irc
where
	irc.inputValue1 + irc.inputValue2 + irc.inputValue3 = 2020
;
go
