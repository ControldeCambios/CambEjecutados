/*
Tabla Respaldo de lo Actualizado en Calculo 1 dia de gasto
*/

CREATE TABLE FITBANK.TMP_AF_18062019
(
  CCUENTA                        VARCHAR2(19 BYTE) NOT NULL,
  SUBCUENTA                      NUMBER(4)      NOT NULL,
  SSUBCUENTA                     NUMBER(4)      NOT NULL,
  CPERSONA_COMPANIA              NUMBER(8)      NOT NULL,
  FHASTA                         DATE           NOT NULL,
  PARTICION                      VARCHAR2(6 BYTE) NOT NULL,
  CATEGORIA                      VARCHAR2(6 BYTE) NOT NULL,
  CGRUPOBALANCE                  VARCHAR2(2 BYTE) NOT NULL,
  FDESDE                         DATE           NOT NULL,
  PRINCIPAL                      VARCHAR2(1 BYTE),
  CSUCURSAL                      NUMBER(4),
  COFICINA                       NUMBER(4),
  CUSUARIO                       VARCHAR2(12 BYTE),
  CSUBSISTEMA                    VARCHAR2(2 BYTE) NOT NULL,
  CGRUPOPRODUCTO                 VARCHAR2(2 BYTE),
  CPRODUCTO                      VARCHAR2(3 BYTE),
  CESTATUSCUENTA                 VARCHAR2(3 BYTE),
  CCLASIFICACIONCONTABLE         VARCHAR2(2 BYTE),
  CODIGOCONTABLE                 VARCHAR2(20 BYTE) NOT NULL,
  CPERSONA_CLIENTE               NUMBER(8),
  CCALIFICACIONRIESGO            VARCHAR2(4 BYTE),
  FCONTABLEHASTA                 DATE           NOT NULL,
  FCONTABLEDESDE                 DATE           NOT NULL,
  CIERREDIACONTABLE              VARCHAR2(1 BYTE) NOT NULL,
  CMONEDA_CUENTA                 VARCHAR2(3 BYTE) NOT NULL,
  SALDOMONEDACUENTA              NUMBER(19,6),
  CMONEDA_OFICIAL                VARCHAR2(3 BYTE),
  SALDOMONEDAOFICIAL             NUMBER(19,6),
  CTIPOSALDOCATEGORIA            VARCHAR2(3 BYTE),
  AJUSTEINTERES                  NUMBER(19,6),
  AJUSTEINTERESOFICIAL           NUMBER(19,6),
  PROVISIONA                     VARCHAR2(1 BYTE) NOT NULL,
  TASADIA                        NUMBER(16,12),
  PROVISIONDIA                   NUMBER(19,6),
  PROVISIONDIAOFICIAL            NUMBER(19,6),
  MONTODESCARGAPROVISION         NUMBER(19,6),
  FINICIO                        DATE,
  CODIGOPLAZO                    VARCHAR2(2 BYTE),
  FVENCIMIENTO                   DATE,
  SALDOPLANILLA                  NUMBER(19,6),
  CAGRUPACIONCONTABLE            VARCHAR2(4 BYTE),
  SALDOCIERREMONEDACUENTA        NUMBER(19,6),
  SALDOCIERREMONEDAOFICIAL       NUMBER(19,6),
  CESTADOOPERACION               VARCHAR2(2 BYTE),
  CAPITALREDUCIDO                NUMBER(19,6),
  DISMINUYESALDO                 VARCHAR2(1 BYTE),
  CODIGOCONTABLE_CONTRAPARTE     VARCHAR2(20 BYTE),
  CTIPOBANCA                     VARCHAR2(3 BYTE),
  CAREA                          VARCHAR2(4 BYTE),
  MONTODESCARGAPROVISIONOFICIAL  NUMBER(19,6),
  CMONEDADENOMINACION            NUMBER(4)
)
TABLESPACE TBS_FITBANKDATA
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


/*
	Incidente 14258
	Los 18 Centavos de Diferencia
*/
update fitbank.tsaldos
set ajusteinteres=-0.06, ajusteinteresoficial=-0.06
where ccuenta in ('116049', '116050', '116051')
and codigocontable='1899050101'
and fdesde='07/06/2019';
commit;

/*
	Incidente 14394
*/
declare
cursor activosdepreciados is
select ccuenta,fcontable,valormonedamovimiento,debitocredito
from fitbank.tmovimientos where 
fcontable between to_Date('2019/01/01','yyyy/mm/dd')and to_date(sysdate-1)--to_Date('2019/06/17','yyyy/mm/dd') --ojo, fecha del dia anterior al que se ejecuta el proceso
and csubsistema='14'
and valormonedamovimiento<>0
and codigocontable like '45%'  
and csubsistema_origen='01' 
and ctransaccion_origen='2000' 
--and ccuenta in ('116049', '116050', '116051')
--and coficina_cuenta=1
--group by fcontable
order by fcontable;

    vnuevo number(16,2);
    vanterior number(16,2);
    
begin
    
    for reg in  activosdepreciados loop
    
    vnuevo:=0;
    vanterior:=0;
    
        select round((trunc(fhasta)-to_date('2019/01/01','yyyy/mm/dd')+2)*PROVISIONDIAOFICIAL+SALDOMONEDACUENTA-MONTODESCARGAPROVISION+AJUSTEINTERES,2) 
        into vnuevo
        from fitbank.tsaldos where ccuenta=REG.CCUENTA and cgrupobalance='4' and codigocontable like '4%' and (fhasta=reg.fcontable-1);
        
        select SALDOMONEDACUENTA 
        into vanterior
        from fitbank.tsaldos where ccuenta=REG.CCUENTA and cgrupobalance='4' and codigocontable like '4%' and fdesde=REG.fcontable and fhasta=fncfhasta;
                       
            if vnuevo<>vanterior and (vnuevo<>0 and vanterior<>0) then
                
                --Respaldos 
                insert into FITBANK.TMP_AF_18062019
                select * from fitbank.tsaldos
                where ccuenta=REG.CCUENTA and cgrupobalance='4' and codigocontable like '4%' and fdesde=REG.FCONTABLE and fhasta=fncfhasta;
                
                update fitbank.tsaldos set SALDOMONEDACUENTA= vnuevo, SALDOMONEDAOFICIAL=vnuevo
                where ccuenta=REG.CCUENTA and cgrupobalance='4' and codigocontable like '4%' and fdesde=REG.FCONTABLE and fhasta=fncfhasta;
                commit;
                dbms_output.put_line('SE CORRIGIO EL REGISTRO DEL ACTIVO: '||REG.ccuenta||' valor anterior '||vanterior||'valor nuevo'||vnuevo);
            
            end if;
        
    end loop;
    
end;

/*
Alcance Incidente 14394 Contracuenta
*/

update fitbank.tsaldos
set ajusteinteres=-45.65, ajusteinteresoficial=-45.65
where coficina=13
and ccuenta in ('14239723') 
and fdesde='13/06/2019'
and ctiposaldocategoria='ACC'
and codigocontable='18990601';
commit;