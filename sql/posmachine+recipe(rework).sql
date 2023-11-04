--main flow在factory中一个个删比较方便，rework flow用sql删比较方便(用flow搜索到的全部删除就行了)
select * from posmachine where conditionid like '%B5S145L5D2601_SDSRW05%' for update 
select * from tpfopolicy where conditionid like '%B5S145L5D2601_SDSRW05%' for update
select * from posmachinerecipe where conditionid like '%B5S145L5D2601_SDSRW05%' for update
select * from tpfompolicy where conditionid like '%B5S145L5D2601_SDSRW05%' for update
