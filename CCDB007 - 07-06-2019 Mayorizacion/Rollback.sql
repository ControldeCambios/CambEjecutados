delete
from FITBANK.tsaldoscontablesdiario
where fcontable between '25/04/2019' and '09/05/2019'
and fcontable not in ('29/04/2019');

insert into FITBANK.tsaldoscontablesdiario
select * 
from FITBANK.tmp_mayor08062019;