/********************************************************************************/
/************************ARREGLO GENERAL*****************************************/
/********************************************************************************/
--no tiene guardado FINICIOPAGOS
update tcuentacolocaciones tcc set FINICIOPAGOS=(select fvencimiento from tcuentacuotas where ccuenta=tcc.ccuenta and subcuenta='1' and fhasta=fncfhasta)
where ccuenta = '602020003451' and fhasta=fncfhasta and FINICIOPAGOS is null;

--actualizar fecha de vencimiento de préstamos que tienen día fijo de pago
UPDATE TCUENTACOLOCACIONES SET 
        FVENCIMIENTO=ADD_MONTHS(FINICIOPAGOS,NUMEROCUOTAS-1), 
        PLAZO=ADD_MONTHS(FINICIOPAGOS,NUMEROCUOTAS-1) - FAPERTURA
WHERE CCUENTA in (
        select ccuenta from (
                select fvencimiento, ADD_MONTHS(FINICIOPAGOS,NUMEROCUOTAS-1) fvencimientoreal, ccuenta from tcuentacolocaciones 
                where ccuenta in (
                        select ccuenta from (
                                select tc.ccuenta,count(tc.ccuenta) contador from tcuenta tc, tcuentacuotas tcc 
                                where  tc.ccuenta=tcc.ccuenta
                                and tc.fhasta=tcc.fhasta
                                and tc.fhasta=fncfhasta
                                and tc.cestatuscuenta in ('003','004','005','007') and tcc.fpago is null
                                group by tc.ccuenta,tcc.fvencimiento
                        ) tc2  where contador>1
                )
                and fhasta=fncfhasta 
                and DIADEPAGO is not null
        ) where fvencimiento<fvencimientoreal
) AND FHASTA=FNCFHASTA();

--actualizar fecha de vencimiento tomando en cuenta la última cuota no pagada
UPDATE TCUENTACOLOCACIONES tcuecol SET 
        FVENCIMIENTO=(select ADD_MONTHS(fvencimiento,(select max(subcuenta)-tcc.subcuenta from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta))
                        from tcuentacuotas tcc
                        where ccuenta =tcuecol.ccuenta
                        and subcuenta=(select min(subcuenta) from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta and fpago is null)
                        and fhasta=fncfhasta), 
        PLAZO=(select ADD_MONTHS(fvencimiento,(select max(subcuenta)-tcc.subcuenta from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta))
                        from tcuentacuotas tcc
                        where ccuenta =tcuecol.ccuenta
                        and subcuenta=(select min(subcuenta) from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta and fpago is null)
                        and fhasta=fncfhasta) - FAPERTURA
WHERE CCUENTA in ('602060009053','6206326075') AND FHASTA=FNCFHASTA();

--actualizar fecha de vencimiento de préstamos que NO tienen día fijo de pago
UPDATE TCUENTACOLOCACIONES tccol SET 
        FVENCIMIENTO=(select
                        fvencimiento+(((select numerocuotas from tcuentacolocaciones where ccuenta=tcc.ccuenta and fhasta=fncfhasta)-subcuenta)*30)
                        from tcuentacuotas tcc
                        where ccuenta = tccol.ccuenta
                        and subcuenta=(select min(subcuenta) from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta and fpago is null)
                        and fhasta=fncfhasta), 
        PLAZO=(select
                fvencimiento+(((select numerocuotas from tcuentacolocaciones where ccuenta=tcc.ccuenta and fhasta=fncfhasta)-subcuenta)*30)
                from tcuentacuotas tcc
                where ccuenta = tccol.ccuenta
                and subcuenta=(select min(subcuenta) from tcuentacuotas where ccuenta=tcc.ccuenta and fhasta=fncfhasta and fpago is null)
                and fhasta=fncfhasta) - FAPERTURA
WHERE CCUENTA in (
        select ccuenta from tcuentacolocaciones
        where ccuenta in (
                select ccuenta from (
                select tc.ccuenta,count(tc.ccuenta) contador from tcuenta tc, tcuentacuotas tcc 
                where  tc.ccuenta=tcc.ccuenta
                and tc.fhasta=tcc.fhasta
                and tc.fhasta=fncfhasta
                and tc.cestatuscuenta in ('003','004','005','007') and tcc.fpago is null
                group by tc.ccuenta,tcc.fvencimiento) tc2  where contador>1
        )
        and DIADEPAGO is null
        and fhasta=fncfhasta
) AND FHASTA=FNCFHASTA();


/******************************* LOTE PARA REGENERAR LA TABLA DE PAGOS ****************************************/

INSERT INTO tcomandosid (COMANDO,TIPOCOMANDO) VALUES ('com.fitbank.loan.maintenance.GeneralRegenerationTableLoan','MAN');
INSERT INTO TCOMANDOS (COMANDO, TIPOCOMANDO, FHASTA, CIDIOMA, FDESDE, DESCRIPCION, VERSIONCONTROL) 
VALUES ('com.fitbank.loan.maintenance.GeneralRegenerationTableLoan', 'MAN', FNCFHASTA, 'ES', FNCSYSDATE, 'REGENERA TABLA DE PAGOS', 0);

INSERT INTO TCOMANDOSMANTENIMIENTO (CSUBSISTEMA, CTRANSACCION, VERSIONTRANSACCION, SCOMANDO, EVENTO, COMANDO, ORDEN, USACACHE, TIPOCOMANDO, ACTIVADO, CANALESEXCLUIDOS, PARAMETRO, VERSIONCONTROL, EJECUTADOPOR, CLASSLOADER) 
VALUES ('12', '3026', '01', 2, 'I', 'com.fitbank.loan.maintenance.GeneralRegenerationTableLoan', 1, '0', 'MAN', '1', null, null, 0, 'F', null);

-- lote
insert into TESTRUCTURAMENSAJEID (CESTRUCTURA) values ('REGENERACIONTABLA');
insert into TESTRUCTURAMENSAJE (CESTRUCTURA, FHASTA, FDESDE, DESCRIPCION, MANEJALONGITUD, LONGITUD, CARACTERDEFIN, PARSER, PREPROCESO, EVENTOSLOTE, FORMATOFECHA, FORMATOHORA, VERSIONCONTROL) 
values ('REGENERACIONTABLA', FNCFHASTA, FNCSYSDATE, 'REGENERACIÓN TABLA DE PAGOS', '0', null, 9, 'com.fitbank.uci.core.transform.parser.PlainParser', null, null, null, null, 0);

insert into TESTRUCTURAMENSAJECAMPOSID (CESTRUCTURA, CNOMBRE) values ('REGENERACIONTABLA', 'CCUENTA');
insert into TESTRUCTURAMENSAJECAMPOS (CESTRUCTURA, CNOMBRE, FHASTA, FDESDE, POSICIONDEINICIO, TIPOCABECERA, LONGITUD, CARACTERRELLENO, RELLENOIZQUIERDA, VALORINICIAL, ORDEN, TIPOCAMPO, VERSIONCONTROL) 
values ('REGENERACIONTABLA', 'CCUENTA', TIMESTAMP '2999-12-31 00:00:00', FNCSYSDATE, null, null, null, null, null, null, 1, null, 0);

INSERT INTO TESTRUCTURAMENSAJEMAPEODESTINO (CESTRUCTURA_DESTINO, CNOMBRE_DESTINO, REGISTRO_DESTINO, SECUENCIA, CESTRUCTURA_ORIGEN, OPERACION, VALORCONSTANTE, CLASE, TABLA, CAMPO, DETALLE, VERSIONCONTROL) 
VALUES ('0', 'ctl:{CAMPO}', 1, 1, 'REGENERACIONTABLA', 'C', null, null, null, 'CCUENTA', null, 0);
INSERT INTO TESTRUCTURAMENSAJEMAPEODESTINO (CESTRUCTURA_DESTINO, CNOMBRE_DESTINO, REGISTRO_DESTINO, SECUENCIA, CESTRUCTURA_ORIGEN, OPERACION, VALORCONSTANTE, CLASE, TABLA, CAMPO, DETALLE, VERSIONCONTROL) 
VALUES ('0', 'ctl:{CAMPO}', 1, 2, 'REGENERACIONTABLA', 'K', '1', null, null, 'NOT_FINANCIAL', null, 0);
INSERT INTO TESTRUCTURAMENSAJEMAPEODESTINO (CESTRUCTURA_DESTINO, CNOMBRE_DESTINO, REGISTRO_DESTINO, SECUENCIA, CESTRUCTURA_ORIGEN, OPERACION, VALORCONSTANTE, CLASE, TABLA, CAMPO, DETALLE, VERSIONCONTROL) 
VALUES ('0', 'ctl:{CAMPO}', 1, 3, 'REGENERACIONTABLA', 'K', '1', null, null, 'REGENERATE_TABLE', null, 0);

insert into TESTRUCTURAMENSAJEMAPEO (CESTRUCTURA_DESTINO, CNOMBRE_DESTINO, CESTRUCTURA_ORIGEN, SECUENCIA, CNOMBRE_ORIGEN, REGISTRO_DESTINO, ORDEN, REGISTRO_ORIGEN, TABLA, CAMPO, DETALLE, VERSIONCONTROL) 
values ('0', 'ctl:{CAMPO}', 'REGENERACIONTABLA', 1, 'CCUENTA', 1, 1, 1, null, null, null, 0);

insert into TTIPOSLOTEID (CPERSONA_COMPANIA, CTIPOLOTE, FUNCIONALIDADLOTE) values (2, 'RGTB', null);
insert into TTIPOSLOTE (CIDIOMA, CPERSONA_COMPANIA, CTIPOLOTE, FHASTA, FDESDE, DESCRIPCION, VERSIONCONTROL) 
values ('ES', 2, 'RGTB', TIMESTAMP '2999-12-31 00:00:00', TIMESTAMP '2007-12-22 11:14:19', 'REGENERAR TABLA DE PAGOS', 0);
insert into TTIPOSLOTETRANSACCION (CTIPOLOTE, CPERSONA_COMPANIA, CSUBSISTEMA, CTRANSACCION, VERSIONTRANSACCION, RUBRO, CSUBSISTEMA_PRINCIPAL, CTRANSACCION_PRINCIPAL, VERSIONTRANSACCION_PRINCIPAL, RUBRO_PRINCIPAL, CTIPOLOTE_COMPLEMENTO) 
values ('RGTB', 2, '12', '3026', '01', 1, null, null, null, null, null);