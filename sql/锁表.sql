--plsql因事务未提交造成的锁表的解决办法
--1、执行以下语句可查询被锁的表
select b.owner,b.object_name,a.session_id,a.locked_mode 
from v$locked_object a,dba_objects b
where b.object_id = a.object_id;
--2、执行以下语句可查询被锁的session和serial#
select b.username,b.sid,b.serial#,logon_time
from v$locked_object a,v$session b
where a.session_id = b.sid order by b.logon_time;
--3、删除锁住的session和serial#
alter system kill session 'sid,serial#';
--如果执行第三步的时候没有权限，执行以下语句为数据库增加修改权限后在执行第三步的删除
grant alter system to db_mydb_yt;--（此处写数据库名字）

