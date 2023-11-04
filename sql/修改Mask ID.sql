--从processflow中查看Metal1对应的Step ID(5500-00)
--修改这个Step ID对应的Mask ID(也就是表bsproductmaskinfo的字段durablename)
select DURABLENAME,b.* from bsproductmaskinfo b where productspecname='B5S140L5D2601' for update


