DELETE
from fitbank.tsaldos ts
WHERE (ts.CCUENTA, TS.SUBCUENTA, TS.CATEGORIA, ts.cgrupobalance, ts.csucursal, TS.CUSUARIO, ts.fcontabledesde) 
IN 
(SELECT tmp.CCUENTA, tmp.SUBCUENTA, tmp.CATEGORIA,tmp.cgrupobalance , tmp.csucursal, tmp.cusuario, tmp.fcontabledesde from fitbank.tmp_sal tmp);


INSERT INTO fitbank.TSALDOS
SELECT * from fitbank.tmp_sal; 