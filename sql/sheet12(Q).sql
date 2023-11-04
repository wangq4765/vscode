/*
sheet1/2是Q段的
posproductsampling和posproductsamplingeqpbyslot判断条件一样
*/
SELECT * FROM posproductsampling where conditionid like '%B5Q140L172607_Q3PMP01_7P70-00%' for update;
select * from posproductsamplingeqpbyslot where conditionid like '%B5Q140L172607_Q3PMP01_7P70-00%' for update;



