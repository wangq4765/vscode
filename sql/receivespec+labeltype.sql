--FactoryModeler中是下拉框选择，很麻烦，不如直接在plsql修改
--FactoryModeler→Porcess→Policy→TPPolicy→POSLabelType/POSReceiveProductSpec
SELECT * FROM poslabeltype where CONDITIONID like '%B5Q123E782501%' for update
SELECT * FROM posreceiveproductspec where CONDITIONID like '%B5Q123E782501%' for update



