--查找站点的WIP数量
SELECT PROCESSOPERATIONNAME,
COUNT(*) AS LOTQTY,
SUM(PRODUCTQUANTITY) AS PRODUCTQUANTITY,
SUM(SUBPRODUCTQUANTITY) AS SUBPRODUCTQUANTITY
FROM LOT
WHERE PRODUCTSPECNAME = 'B5S174E171601'--输入SensorNo就可以了
AND LOTSTATE = 'Released'
AND REWORKSTATE = 'NotInRework'
GROUP BY PROCESSOPERATIONNAME
