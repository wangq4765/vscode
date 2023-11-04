--rework flow流程对应的是processflowseq
--先判断原rework flow是否正确，如果不正确再执行下面的sql
select * from processflowseq where processflowname = 'SGTRW09' order by position
--processflowname全部粘贴后4位，operationname按position次序一一复制粘贴，总有一次查询只有一行记录
select * from processflowseq where processflowname like '%RW11' and PROCESSOPERATIONNAME = '5800-2R' and position = '1'
select * from processflowseq where processflowname like '%RW11' and PROCESSOPERATIONNAME = '5800-1R' and position = '2'
select * from processflowseq where processflowname like '%RW11' and PROCESSOPERATIONNAME = '5810-00' and position = '3'
select * from processflowseq where processflowname like '%RW11' and PROCESSOPERATIONNAME = '58M1-0R' and position = '4'
select * from processflowseq where processflowname like '%RW11' and PROCESSOPERATIONNAME = '58M2-0R' and position = '5'
