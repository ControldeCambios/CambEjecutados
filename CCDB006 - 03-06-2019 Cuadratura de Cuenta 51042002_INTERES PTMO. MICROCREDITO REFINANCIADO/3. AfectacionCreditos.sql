/*
Alcance oficina 38 de la cuenta 51041003
INTERES PTMO. DE CONSUMO PRIORITARIO REESTRUCTURADO
Favor revisarlo
*/

UPDATE fitbank.TSALDOS
SET FHASTA='27/05/2019', FCONTABLEHASTA='27/05/2019' 
WHERE CCUENTA='602020020190'
AND SUBCUENTA=3
AND CATEGORIA='INTPRO'
AND CGRUPOBALANCE=5
AND FDESDE='20/05/2019';

UPDATE fitbank.TSALDOS
SET  SALDOMONEDACUENTA=20+47.14, SALDOMONEDAOFICIAL=20+47.14
WHERE CCUENTA='602020020190'
AND SUBCUENTA=3
AND CATEGORIA='INTPRO'
AND CGRUPOBALANCE=5
AND FDESDE='28/05/2019';

/*
Fin 
*/

--Oficina 10,        afectados 9 registros
UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '08/02/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='08/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=5.04, SALDOMONEDAOFICIAL=5.04
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '08/02/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'08/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=5.04, SALDOMONEDAOFICIAL=5.04
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '26/03/2019' BETWEEN FDESDE AND FHASTA;


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='20/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=35.01+11.14, SALDOMONEDAOFICIAL=35.01+11.14,  MONTODESCARGAPROVISION=23.87, MONTODESCARGAPROVISIONOFICIAL=23.87
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'20/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=35.01+11.14, SALDOMONEDAOFICIAL=35.01+11.14
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/04/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='23/04/2019', fcontablehasta='23/04/2019'
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '20/04/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set saldomonedacuenta=22.63, saldomonedaoficial=22.63
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '24/04/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='31/12/2999', particion='299912', fcontablehasta='31/12/2999'
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '09/05/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 19

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta='31/01/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=44.6+4.26, SALDOMONEDAOFICIAL=44.6+4.26,  MONTODESCARGAPROVISION=22.3, MONTODESCARGAPROVISIONOFICIAL=22.3
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'31/01/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=8.52+22.3, SALDOMONEDAOFICIAL=8.52+22.3
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
and '08/02/2019' between fdesde and fhasta;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=4.26+22.3, SALDOMONEDAOFICIAL=4.26+22.3
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
and '21/02/2019' between fdesde and fhasta;

--Oficina 26

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=237.76-118.88, SALDOMONEDAOFICIAL=237.76-118.88
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=16;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=228.58-114.29, SALDOMONEDAOFICIAL=228.58-114.29
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=91.89-15.01, SALDOMONEDAOFICIAL=91.89-15.01
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=18;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=118.16-15.01, SALDOMONEDAOFICIAL=118.16-15.01
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '28/01/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=73.77+(188.06-114.29), SALDOMONEDAOFICIAL=73.77+(188.06-114.29),  MONTODESCARGAPROVISION=73.77, MONTODESCARGAPROVISIONOFICIAL=73.77
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=11.63+(118.16-15.01), SALDOMONEDAOFICIAL=11.63+(118.16-15.01),  MONTODESCARGAPROVISION=116.28, MONTODESCARGAPROVISIONOFICIAL=116.28
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/02/2019';

--127.91
UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=49.77+66.51-1.5, SALDOMONEDAOFICIAL=49.77+66.51-1.5
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '28/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=244.71, SALDOMONEDAOFICIAL=244.71
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/03/2019';


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=244.71, SALDOMONEDAOFICIAL=244.71
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '13/03/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '04/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='04/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=6.65+(122.93-13.13), SALDOMONEDAOFICIAL=6.65+(122.93-13.13),  MONTODESCARGAPROVISION=66.51, MONTODESCARGAPROVISIONOFICIAL=66.51
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '04/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'04/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=66.51+49.94, SALDOMONEDAOFICIAL=66.51+49.94
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '27/04/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='31/12/2999', particion='299912', fcontablehasta='31/12/2999'
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (20)
AND '02/05/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 27

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=120.04-60.02, SALDOMONEDAOFICIAL=120.04-60.02
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=16;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=111.3-50.92, SALDOMONEDAOFICIAL=111.3-50.92
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=204.86-102.43, SALDOMONEDAOFICIAL=204.86-102.43
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23,24)
AND '22/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=23;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=157.52-56.34, SALDOMONEDAOFICIAL=157.52-56.34
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23,24)
AND '22/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=24;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=26.86-13.43, SALDOMONEDAOFICIAL=26.86-13.43
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17,18)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=41.56-17.35, SALDOMONEDAOFICIAL=41.56-17.35
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17,18)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=18;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=50.59-0.33, SALDOMONEDAOFICIAL=50.59-0.33
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '10/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=111.3-0.33, SALDOMONEDAOFICIAL=111.3-0.33
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '11/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='14/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=13.76+(41.56-17.35), SALDOMONEDAOFICIAL=13.76+(41.56-17.35),  MONTODESCARGAPROVISION=19.66, MONTODESCARGAPROVISIONOFICIAL=19.66
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'14/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=157.52-56.34, SALDOMONEDAOFICIAL=157.52-56.34
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=18.31+19.66, SALDOMONEDAOFICIAL=18.31+19.66
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '26/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 35

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090002127'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='09/02/2019' ;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=1.08, SALDOMONEDAOFICIAL=1.08
where codigocontable='51042002'
and ccuenta='604090002127'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'09/02/2019'; 

update fitbank.tsaldos
set fhasta='29/03/2019', fcontablehasta='29/03/2019'
where codigocontable='51042002'
and ccuenta='6206891774'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '27/03/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=16.36+4.17, SALDOMONEDAOFICIAL=16.36+4.17
where codigocontable='51042002'
and ccuenta='6206891774'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '30/03/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 44

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '29/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta='29/01/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=31.64+45.45, SALDOMONEDAOFICIAL=31.64+45.45,  MONTODESCARGAPROVISION=31.64, MONTODESCARGAPROVISIONOFICIAL=31.64
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '29/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'29/01/2019';


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=63.28+13.81, SALDOMONEDAOFICIAL=63.28+13.81
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '08/02/2019' BETWEEN FDESDE AND FHASTA;


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=8.43+52.16, SALDOMONEDAOFICIAL=8.43+52.16,  MONTODESCARGAPROVISION=42.15, MONTODESCARGAPROVISIONOFICIAL=42.15
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=50.58+10.01, SALDOMONEDAOFICIAL=50.58+10.01
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '25/03/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET FHASTA='17/04/2019', FCONTABLEHASTA='17/04/2019'
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (26)
AND '01/04/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=29.4+11.17, SALDOMONEDAOFICIAL=29.4+11.17
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (26)
AND '18/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 30

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=234.64-117.32, SALDOMONEDAOFICIAL=234.64-117.32
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (27)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=190.12-68, SALDOMONEDAOFICIAL=190.12-68
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA;


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='19/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=64.42+(190.12-68), SALDOMONEDAOFICIAL=64.42+(190.12-68),  MONTODESCARGAPROVISION=120.78, MONTODESCARGAPROVISIONOFICIAL=120.78
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'19/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=185.2+1.34, SALDOMONEDAOFICIAL=185.2+1.34
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '08/03/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 31
delete
from fitbank.tsaldos 
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (15)
AND '15/01/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=89.86-44.93, SALDOMONEDAOFICIAL=89.86-44.93, fhasta='31/12/2999', particion='299912', fcontablehasta='31/12/2999'
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (15)
AND '14/01/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=117.81-54.97, SALDOMONEDAOFICIAL=117.81-54.97
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16)
AND '15/01/2019' BETWEEN FDESDE AND FHASTA;


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=113.82-54.97, SALDOMONEDAOFICIAL=113.82-54.97
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16)
AND '25/01/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='28/03/2019', fcontablehasta='28/03/2019' 
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23)
AND '27/03/2019' BETWEEN FDESDE AND FHASTA;


UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=69.36, SALDOMONEDAOFICIAL=69.36
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23)
AND '29/03/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='19/04/2019', fcontablehasta='19/04/2019' 
where codigocontable='51042002'
and ccuenta='604090004792'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '12/04/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=123.01, SALDOMONEDAOFICIAL=123.01
where codigocontable='51042002'
and ccuenta='604090004792'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '20/04/2019' BETWEEN FDESDE AND FHASTA;

--update fitbank.tsaldos
-- set fhasta='31/12/2999', particion='299912', fcontablehasta='31/12/2999'
--where codigocontable='51042002'
--and ccuenta='604090005704'
--and categoria='INTPRO'
--AND CGRUPOBALANCE=05
--AND SUBCUENTA in (3)
--AND '17/05/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='29/05/2019', fcontablehasta='29/05/2019'
where codigocontable='51042002'
and ccuenta='604090005704'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
AND '17/05/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set saldomonedacuenta=0.02+204.90, saldomonedaoficial=0.02+204.90
where codigocontable='51042002'
and ccuenta='604090005704'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
AND '31/05/2019' BETWEEN FDESDE AND FHASTA;

--update fitbank.tsaldos
-- set fhasta='31/12/2999', particion='299912', fcontablehasta='31/12/2999'
--where codigocontable='51042002'
--and ccuenta='604090000910'
--and categoria='INTPRO'
--AND CGRUPOBALANCE=05
--AND SUBCUENTA in (25)
--AND '25/05/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set fhasta='30/05/2019', fcontablehasta='30/05/2019'
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '25/05/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
set saldomonedacuenta=57.99+2.57, saldomonedaoficial=57.99+2.57
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '31/05/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 36

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=157.51-73.48, SALDOMONEDAOFICIAL=157.51-73.48
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='09/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=73.13+(157.51-73.48), SALDOMONEDAOFICIAL=73.13+(157.51-73.48),  MONTODESCARGAPROVISION=84.38, MONTODESCARGAPROVISIONOFICIAL=84.38
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'09/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=157.51-0.35, SALDOMONEDAOFICIAL=157.51-0.35
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '28/02/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 38

update fitbank.tsaldos
 set fhasta='31/03/2019', fcontablehasta='31/03/2019'
where codigocontable='51042002'
and ccuenta='604090000454'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '13/03/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=104.64+1.12, SALDOMONEDAOFICIAL=104.64+1.12
where codigocontable='51042002'
and ccuenta='604090000454'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 41

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='04/03/2019'
and fhasta='04/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=34.62, SALDOMONEDAOFICIAL=34.62
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='04/03/2019'
and fhasta<>'04/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=34.62, SALDOMONEDAOFICIAL=34.62
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='06/03/2019'
and fhasta='31/12/2999';

update fitbank.tsaldos
set fhasta='15/04/2019', fcontablehasta='15/04/2019'
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (13)
and fdesde='04/04/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=38.03, SALDOMONEDAOFICIAL=38.03
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (13)
and fdesde='16/04/2019';

--Oficina 42

update fitbank.tsaldos
set fhasta='17/04/2019', fcontablehasta='17/04/2019'
where codigocontable='51042002'
and ccuenta='604090005438'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
and fdesde='14/04/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=91.42, SALDOMONEDAOFICIAL=91.42
where codigocontable='51042002'
and ccuenta='604090005438'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
and fdesde='18/04/2019';

update fitbank.tsaldos
SET  SALDOMONEDACUENTA=7.98+127.49, SALDOMONEDAOFICIAL=7.98+127.49
where codigocontable='51042002'
and ccuenta='604090005142'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
and fdesde='16/05/2019';


--Oficina 45

UPDATE fitbank.tsaldos
SET MONTODESCARGAPROVISION=86.87, MONTODESCARGAPROVISIONOFICIAL=86.87
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '04/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=116.87-86.87, SALDOMONEDAOFICIAL=116.87-86.87
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '05/02/2019' BETWEEN FDESDE AND FHASTA;

update fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '04/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='04/02/2019';

update fitbank.tsaldos
SET  SALDOMONEDACUENTA=153.31+(5.28), SALDOMONEDAOFICIAL=153.31+(5.28),  MONTODESCARGAPROVISION=158.42, MONTODESCARGAPROVISIONOFICIAL=158.42
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '04/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'04/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=116.87-86.87, SALDOMONEDAOFICIAL=116.87-86.87
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '07/02/2019' BETWEEN FDESDE AND FHASTA;

DELETE
FROM fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=113.74-86.87, SALDOMONEDAOFICIAL=113.74-86.87, FHASTA='31/12/2999', PARTICION='299912', FCONTABLEHASTA='31/12/2999'
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '11/02/2019' BETWEEN FDESDE AND FHASTA;

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=163.7-5.11, SALDOMONEDAOFICIAL=163.7-5.11
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='15/02/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=0, SALDOMONEDAOFICIAL=0,  MONTODESCARGAPROVISION=0, MONTODESCARGAPROVISIONOFICIAL=0
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '07/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='07/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=4.25+(163.7-5.11), SALDOMONEDAOFICIAL=4.25+(163.7-5.11),  MONTODESCARGAPROVISION=127.41, MONTODESCARGAPROVISIONOFICIAL=127.41
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '07/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'07/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=35.43+11.43, SALDOMONEDAOFICIAL=35.43+11.43
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='11/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=115.3+31.18, SALDOMONEDAOFICIAL=115.3+31.18
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='18/03/2019';

UPDATE fitbank.tsaldos
SET  SALDOMONEDACUENTA=127.95+31.18, SALDOMONEDAOFICIAL=127.95+31.18
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='20/03/2019';
commit;