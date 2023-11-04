--找到参考账号的usergroupname，也就是FactoryModel→Menu→User→userGroupName，在该userGroupName中创建账号
select * from userinfo where userid='10153101'
--ORA-00001：违反唯一约束条件(LAMMESADM.USERINFO_PK)，也就是主键(userid)冲突，userid后面加-2就可以了
select * from userinfo where username like '%吴乐祥%'
/*
GY0003598：吴乐祥
GY0012026-1：吴乐祥
*/
