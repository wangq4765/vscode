
/*
Sampling Plan中的SPEC字段
修改datacollectspec中的字段target,upperspeclimit,lowerspeclimit,upperscreenlimit,lowerscreenlimit
*/
select target,upperscreenlimit,lowerscreenlimit,upperspeclimit,lowerspeclimit,s.*
from spccontrolspecitem s 
where spccontrolspecname like '%270E672202_MT1MSK_CD%' and itemname like '%CD1%'
--270E672202_MT1MSK_CD是SPC&EDC的excel中的字段DC Spec Name，CD1是excel中的字段DC Item Details
for update

/*
Sampling Plan中的Samples字段
修改datacollectspec中的字段samplecount
*/
select samplecount,d.* 
from datacollectspec d 
where dcspecname like '%140L172607_MT1ETC_CD%' 
for update

/*
Sampling Plan中的point字段
修改datacollectspecitem中的字段sitecount和sitename
*/
select sitecount,sitenames,d.* 
from datacollectspecitem d 
where dcspecname like '%140L172607_MT1ETC_CD%' and itemname like '%CD1%' 
for update

/*
Sampling Plan中的Frequency字段
在processflow中改，在这里改没用(忽略)
*/
select * from 



