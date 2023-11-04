--修改step id和sequenceid这两个字段，machine不需要修改
select lotname,processoperationname,sequenceid,l.* from lot l where lotname like '5SAB47B0002%' for update
select productname,processoperationname,sequenceid,p.* from product p where lotname like '5SAB47B0002%' for update
