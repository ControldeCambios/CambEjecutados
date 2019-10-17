
--Oficina 10
insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '08/02/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='08/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '08/02/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'08/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=17
AND '26/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='20/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'20/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=19
AND '20/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '20/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001911'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '24/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002106'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=20
AND '09/05/2019' BETWEEN FDESDE AND FHASTA;

-- Oficina 19
insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta='31/01/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'31/01/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
and '08/02/2019' between fdesde and fhasta
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002474'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA=14
and '21/02/2019' between fdesde and fhasta;


--Oficina 26


insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=16
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17,18)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=18
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '28/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '01/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '28/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004145'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '13/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '04/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='04/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '04/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'04/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '27/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002012'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (20)
AND '02/05/2019' BETWEEN FDESDE AND FHASTA;


--Oficina 27


insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=16
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16,17)
AND '21/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23,24)
AND '22/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=23
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23,24)
AND '22/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=24
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17,18)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=17
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17,18)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
and subcuenta=18
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '10/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002054'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '11/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='14/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'14/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000497'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001871'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (18)
AND '26/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 35

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002127'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='09/02/2019' 
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002127'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (17)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'09/02/2019' 
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206891774'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '27/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206891774'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '30/03/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 44

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '29/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta='29/01/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '29/01/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'29/01/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (24)
AND '08/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta='01/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/03/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'01/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '25/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (26)
AND '01/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000506'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (26)
AND '18/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina30
insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (27)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='19/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '19/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'19/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='6206843893'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (28)
AND '08/03/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 31
insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (15)
AND '15/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (15)
AND '14/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16)
AND '15/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090002257'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (16)
AND '25/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23)
AND '27/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (23)
AND '29/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '25/05/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000910'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '31/05/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004792'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '12/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004792'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '20/04/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090005704'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
AND '17/05/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090005704'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
AND '31/05/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 36

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '31/01/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta='09/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '09/02/2019' BETWEEN FDESDE AND FHASTA
and fhasta<>'09/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090001115'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (21)
AND '28/02/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 38


insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000454'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '13/03/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090000454'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (25)
AND '01/04/2019' BETWEEN FDESDE AND FHASTA;

--Oficina 41

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='04/03/2019'
and fhasta='04/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='04/03/2019'
and fhasta<>'04/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (12)
and fdesde='06/03/2019'
and fhasta='31/12/2999'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (13)
and fdesde='04/04/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090003282'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (13)
and fdesde='16/04/2019';

--Oficina 42

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090005438'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
and fdesde='14/04/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090005438'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (3)
and fdesde='18/04/2019'
union
select * 
from fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090005142'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
and fdesde='16/05/2019';


--Oficina 45

insert into fitbank.tmp_51042002
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '04/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '05/02/2019' BETWEEN FDESDE AND FHASTA
union
select *
from tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '04/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '07/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '14/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (5)
AND '11/02/2019' BETWEEN FDESDE AND FHASTA
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='15/02/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '07/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA='07/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND '07/03/2019' BETWEEN FDESDE AND FHASTA
AND FHASTA<>'07/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='11/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='18/03/2019'
union
select * 
from  fitbank.tsaldos
where codigocontable='51042002'
and ccuenta='604090004237'
and categoria='INTPRO'
AND CGRUPOBALANCE=05
AND SUBCUENTA in (6)
AND FDESDE='20/03/2019';

commit;