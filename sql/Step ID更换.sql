--搜索Step ID前4位(一定正确)+Operation Name+mandatoryoperationflag
SELECT DESCRIPTION,PROCESSOPERATIONNAME,MANDATORYOPERATIONFLAG 
FROM processoperationspec 
where description like '%SiOxNy2%'--SiOxNy2不变
and processoperationname like '%C300%' --C300变
and mandatoryoperationflag='N'--Main是Y，其他都是N
--如果mandatoryoperationflag全部不匹配，就不修改Step ID，转而修改Mandatory


