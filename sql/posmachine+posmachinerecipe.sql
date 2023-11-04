--在FactoryModeler中posmachine+posmachinerecipe中删除比一个表一个表删除更快
--通过conditionid连表无法删除记录，只能一个表一个表删除(一个表中有1条记录，另一个表有4条记录)

--把下面的字段全部粘贴到in中直接清除数据
select * from posmachine where conditionid in() for update
select * from tpfopolicy where conditionid in() for update

--把下面的字段一一粘贴到2个表中再清除数据(因为字段conditionid中有machine信息所以无法像上面那样直接全部删除)
select * from posmachinerecipe where conditionid like '%%' for update
select * from tpfompolicy where conditionid like '%%' for update


'SENSOR_B5S140P3D2606_S5QMP01_1700-40',
'SENSOR_B5S140P3D2606_S5QMP01_1700-22',
'SENSOR_B5S140P3D2606_S5QMP01_1700-00',
'SENSOR_B5S140P3D2606_S5QMP01_17M1-00',
'SENSOR_B5S140P3D2606_S5QMP01_17M2-00',






