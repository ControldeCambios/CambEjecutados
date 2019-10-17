/*
Rollback
*/
/*
select *
from tmp_pruebas_update;

select *
from tsaldos ts,  tmp_pruebas_update tu
where ts.CCUENTA=TU.CCUENTA 
and ts.subcuenta=tu.subcuenta and ts.fhasta=tu.fhasta
and TS.CATEGORIA=tu.categoria and ts.fdesde=tu.fdesde and ts.cgrupobalance=tu.cgrupobalance
and ts.csucursal=tu.csucursal and ts.coficina=tu.coficina;
*/

delete
from fitbank.tsaldos ts
WHERE (ts.CCUENTA, TS.SUBCUENTA, TS.CATEGORIA, TS.FDESDE, TS.FHASTA, ts.cgrupobalance) 
IN 
(SELECT tmp.CCUENTA, tmp.SUBCUENTA, tmp.CATEGORIA, tmp.FDESDE, tmp.FHASTA, tmp.cgrupobalance from fitbank.tmp_pruebas_update tmp);

INSERT INTO fitbank.TSALDOS
SELECT * from fitbank.tmp_pruebas_update;

--select ccuenta, count(*)
--from FITBANK.tmp_51042003
--group by ccuenta
--order by ccuenta;
--
--select *
--from FITBANK.tmp_51042003
--where ccuenta='604090000688'
--and subcuenta=24
--order by subcuenta, fhasta;
/*
select T.ccuenta, count(*)
FROM
(
select *
from tsaldos ts
WHERE (ts.CCUENTA, TS.SUBCUENTA, TS.CATEGORIA, ts.cgrupobalance, ts.csucursal, TS.CUSUARIO, ts.fcontabledesde) 
IN 
(SELECT tmp.CCUENTA, tmp.SUBCUENTA, tmp.CATEGORIA,tmp.cgrupobalance , tmp.csucursal, tmp.cusuario, tmp.fcontabledesde from FITBANK.tmp_51042003 tmp) 
) T
group by T.ccuenta
order by T.ccuenta;

*/
DELETE
from fitbank.tsaldos ts
WHERE (ts.CCUENTA, TS.SUBCUENTA, TS.CATEGORIA, ts.cgrupobalance, ts.csucursal, TS.CUSUARIO, ts.fcontabledesde) 
IN 
(SELECT tmp.CCUENTA, tmp.SUBCUENTA, tmp.CATEGORIA,tmp.cgrupobalance , tmp.csucursal, tmp.cusuario, tmp.fcontabledesde from FITBANK.tmp_51042002  tmp);
   -- WHERE COFICINA NOT IN (36));

INSERT INTO fitbank.TSALDOS
SELECT * from FITBANK.tmp_51042002; --WHERE COFICINA NOT IN (36);

--Se insertan 94 registros por que se habian eliminado 2 

select *
from FITBANK.tmp_51042002