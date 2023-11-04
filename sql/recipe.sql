--有recipe的表：posmachinerecipe+recipe
--B5S149E1F1502是sensorno，S17MP01是flow，C300-00是operation
select * from posmachinerecipe where conditionid like '%B5S149E1F1502_S17MP01_C300-00%' for update
--表recipe维护machine和recipe的关系，149是sensor中的第3个字符往后的一串数字，17是lot type
select * from recipe where recipenamespacename like '5SEES03%' and recipename like '%149%17%' for update
