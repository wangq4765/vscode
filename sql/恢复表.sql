delete误删除后进行退回数据操作
一:根据时间来恢复:
1、查询数据库当前时间()
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;
2、查询删除数据时间点之前的数据
select * from 表名 as of timestamp to_timestamp('2020-08-06 10:12:11','yyyy-mm-dd hh24:mi:ss'):
（若没有数据 ,将时间继续提前）
3、恢复数据
flashback table 表名 to timestamp to_timestamp('2020-08-06 10:12:11','yyyy-mm-dd hh24:mi:ss');
数据恢复成功；
但是也可能会出现问题,比如报错:ORA-08189:未启用行移动功能,不能闪回表；
执行下面操作；
alter table 表名 enable row movement;
然后再次执行上面SQL即可:
二:根据数据库SCN恢复数据
1、查询当前数据库SCN号
select current_scn from v$database;(若不能执行,切换到sys用户或system用户查询)
查询到的当前值为:91792986
2、缩小SCN号查询被删除表数据(若无数据继续缩小SCN,由于数据库操作不止一人,SCN号变化比较多,可以多缩小几个号)
select * from 表名 as of scn 91792986;
3、恢复数据
flashback table 表名 to scn 91792986;
恢复完成。若报错:ORA-08189:未启用行移动功能,不能闪回表；结果方案同上。


