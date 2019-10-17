-- 1. Respaldar los jars: billing, general, inventory, pgeneral, pinventory, purchases.

-- 2. Ejecutar antes de la instalaci�n
-- drop table fitbank.fo_simpcompras_rollback;
create table fitbank.fo_simpcompras_rollback as
select * from fitbank.tformatoxml where csubsistema||ctransaccion in ('255028',
'254024',
'254014',
'253103',
'253102',
'253094',
'253083',
'253073',
'253072',
'253023',
'253020',
'253016',
'253015',
'253012',
'000107');

-- drop table fitbank.re_simpcompras_rollback;
create table fitbank.re_simpcompras_rollback as
select * from fitbank.tformatoreportejasper where cformatoreporte in ('25_SOLICITUDPAGODIRECTO',
'25_PAGOPROVEEDORES',
'25_COMPROBANTES_AUTOMATICOS',
'25_CHEQUEPROMERICA',
'25_CHEQUEPICHINCHA',
'25_CHEQUEGUAYAQUIL');

-- drop table fitbank.comandos_rollback;
create table fitbank.comandos_rollback as
select * from  fitbank.tcomandosmantenimiento 
where csubsistema||ctransaccion in ('253073','253012','253083');
