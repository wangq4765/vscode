--查看下面比上面少了哪些权限(界面/包含界面的标签都会被开通权限)
SELECT * FROM usermenu where userid ='50107059'
minus
SELECT * FROM usermenu where userid ='10591168'
--右击plsql中的数据→Copy to Excel→Copy as xlsx，
--然后复制数据到excel(OIC权限开通完全同杜彪.xlsx)，再把userid替换成“下面的”
--将数据insert进plsql

