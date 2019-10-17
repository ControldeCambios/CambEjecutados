DROP PROCEDURE  FITBANK.SP_TASASP ;
-----generacion de la estructura tasas
CREATE OR REPLACE PROCEDURE FITBANK.SP_TASASP  (fechaDesde IN varchar2, fechaHasta IN varchar2 )
AS
BEGIN
DECLARE
p_fechaDesde date := to_date(fechaDesde,'dd-mm-yyyy');
p_fechaHasta date := to_date(fechaHasta,'dd-mm-yyyy');

---DECLARAMOS LA VARIABLE
VSEGMENTOCREDITO              NUMBER(5);
VCUENTA                       VARCHAR2(10 BYTE);
VOPERACION                    VARCHAR2(6 BYTE);
VFECHA                        TIMESTAMP(6);
VMONEDA                       NUMBER(8);
VPLAZO                         NUMBER(12,2);
VTIR                          NUMBER(12,2);
VTEA                           NUMBER(12,2);
VOPERACIONES                  NUMBER(12,2);
VFRECUENCIAPAGO              NUMBER(12,2);
VPERIODOREAJUSTE             NUMBER(12,2);
VMONTOPRESTAMO               NUMBER(12,2);
VNIVELVENTAS                 NUMBER(12,2);
VSALDOMICROCREDITO           NUMBER(12,2);
VCODIGOACTIVIDAD             VARCHAR2(15 BYTE);
VDESTINOCREDITO              VARCHAR2(15 BYTE);
VDESTINOCREDHIPOT            NUMBER(12,2);
VTIPOCONSUMO                 VARCHAR2(10 BYTE);
VTIPOGARANTIA                VARCHAR2(3 BYTE);
VVALORVIVIENDA               NUMBER(12,2);
VALRMETROCUADRADO           NUMBER(12,2);
VINSTPOR                    VARCHAR2(3 BYTE);
VIDENTIFICACION              VARCHAR2(15 BYTE);
VTIPOIDENTIFICACION         VARCHAR2(3 BYTE);
VCLASEPRESTATARIO           VARCHAR2(1 BYTE);
VTASAREFERENREAJUSTE        VARCHAR2(10 BYTE);
VCUPOTARJETA                   VARCHAR2(3 BYTE);
VDESTINOPROVINCIA            VARCHAR2(5 BYTE);
VDESTINOCANTON              VARCHAR2(5 BYTE);
VANTIGUEDADVIVIENDA         VARCHAR2(6 BYTE);
VVALORENCAJE                 VARCHAR2(3 BYTE);
VEDAD                     VARCHAR2(5 BYTE);
VGENERO                    VARCHAR2(3 BYTE);
VCLIENTE                         NUMBER(8);
VNUMCUENTA                   NUMBER(19);
VCAPITALREDUCIDO           NUMBER(19,7);
VFDESDEREPORTE          DATE;
VFHASTAREPORTE   DATE;

--INGRESAMOS EL CURSOR
                CURSOR TASAS IS
                SELECT 'F' SISTEMA,0 SEGMENTOCREDITO, '2103' CUENTA, '0' OPERACION, FECHAT, MONEDA, PLAZO, TIR, TEA, 1 OPERACIONES,
                CASE WHEN FRECUENCIA_PAGO = 0 THEN PLAZO ELSE FRECUENCIA_PAGO END FRECUENCIA_PAGO,
                0 PERIODO_REAJUSTE, MONTO, 0 NIVEL_VENTAS, 0 SALDO_MICROCREDITO, '0' CODIGO_ACTIVIDAD, '0' DESTINO_CREDITO, '0' DESTINO_CRED_HIPOT, '0' TIPO_CONSUMO,
                '0' TIPO_GARANTIA, 0 VALOR_VIVIENDA, 0 VALOR_METRO_CUADRADO, '0' INST_POR, '0' IDENTIFICACION, '0' TIPO_IDENTIFICACION, '0' CLASE_PRESTATARIO, TASA_REF_REAJUSTE,
                0 CUPO_TARJETA, DESTINO_PROVINCIA, DESTINO_CANTON, 90 ANTIGUEDAD_VIVIENDA, 0  VALOR_ENCAJE,EDAD,GENERO,CPERSONA_CLIENTE,NUMCUENTA,0 CAPITALREDUCIDO,0 CONTAR,0 SUMMONTO,FDESDEREPORTE,FHASTAREPORTE
                FROM (SELECT C.FAPERTURA AS FECHAT,
                          (SELECT MI.CODIGONUMERICO FROM FITBANK.TMONEDASID MI WHERE MI.CMONEDA = C.CMONEDA) MONEDA,
                          CP.PLAZO,
                          (SELECT TASA FROM FITBANK.TCUENTACATEGORIASTASAS WHERE CCUENTA = C.CCUENTA AND FHASTA =FNCFHASTA) TIR,
                 
                          CASE WHEN     (SELECT EFE.TASAEFECTIVAANUAL FROM FITBANK.TCUENTATASAEFECTIVA EFE WHERE EFE.FHASTA =FNCFHASTA AND EFE.CCUENTA = CP.CCUENTA)  IS NULL THEN   
                          (SELECT TASA FROM FITBANK.TCUENTACATEGORIASTASAS WHERE CCUENTA = C.CCUENTA AND FHASTA =FNCFHASTA) ELSE 
                          (SELECT EFE.TASAEFECTIVAANUAL FROM FITBANK.TCUENTATASAEFECTIVA EFE WHERE EFE.FHASTA =FNCFHASTA AND EFE.CCUENTA = CP.CCUENTA) END TEA,
                         -- (SELECT EFE.TASAEFECTIVAANUAL FROM TCUENTATASAEFECTIVA EFE WHERE EFE.FHASTA =FNCFHASTA AND EFE.CCUENTA = CP.CCUENTA) TEA,
                          (SELECT FI.NUMERODIAS FROM FITBANK.TFRECUENCIASID FI WHERE FI.CFRECUENCIA = CP.CFRECUENCIA_INTERES) FRECUENCIA_PAGO,
                          MONTO,
                          CASE WHEN CP.TASAREAJUSTABLE IS NULL OR  CP.TASAREAJUSTABLE = '0' THEN '0' ELSE CASE WHEN CP.PLAZO BETWEEN 0 AND 29 THEN 'P'
                          WHEN CP.PLAZO BETWEEN 30 AND 60 THEN 'P30' WHEN CP.PLAZO BETWEEN 61 AND 90 THEN 'P61' WHEN CP.PLAZO BETWEEN 91 AND 120 THEN 'P91'
                          WHEN CP.PLAZO BETWEEN 121 AND 180 THEN 'P12' WHEN CP.PLAZO BETWEEN 181 AND 360 THEN 'P18' WHEN CP.PLAZO > 360 THEN 'P36' END END TASA_REF_REAJUSTE,

                          (SELECT PD.CPROVINCIA FROM FITBANK.TPERSONADIRECCIONES PD WHERE PD.CPERSONA = C.CPERSONA_CLIENTE AND PD.FHASTA =FNCFHASTA
                           AND PD.CTIPODIRECCION IN ('DO') AND ROWNUM= 1) DESTINO_PROVINCIA,

                           (SELECT PD.CCIUDAD FROM FITBANK.TPERSONADIRECCIONES PD WHERE PD.CPERSONA = C.CPERSONA_CLIENTE AND PD.FHASTA =FNCFHASTA
                           AND PD.CTIPODIRECCION IN ('DO') AND ROWNUM= 1) DESTINO_CANTON
                           
                           , CASE WHEN (SELECT CTIPOIDENTIFICACION FROM FITBANK.TPERSONA PER
                                                        WHERE PER.CPERSONA=C.CPERSONA_CLIENTE 
                                                        AND PER.FHASTA=FNCFHASTA) ='RUC' THEN '0' ELSE (SELECT GENERO FROM FITBANK.TNATURALINFORMACIONBASICA P INNER JOIN FITBANK.TPERSONA PER ON P.CPERSONA=PER.CPERSONA  
                                                        WHERE P.CPERSONA=C.CPERSONA_CLIENTE AND P.FHASTA=FNCFHASTA
                                                        AND PER.FHASTA=FNCFHASTA) END GENERO,
                           
                           CASE WHEN (SELECT CTIPOIDENTIFICACION FROM FITBANK.TPERSONA PER
                                                        WHERE PER.CPERSONA=C.CPERSONA_CLIENTE 
                                                        AND PER.FHASTA=FNCFHASTA) ='RUC' THEN 0 ELSE ( SELECT  (floor(months_between(sysdate, FNACIMIENTO) /12))  FROM FITBANK.TNATURALINFORMACIONBASICA P INNER JOIN FITBANK.TPERSONA PER ON P.CPERSONA=PER.CPERSONA  
                                                        WHERE P.CPERSONA=C.CPERSONA_CLIENTE 
                                                         AND  P.FHASTA=FNCFHASTA
                                                        AND PER.FHASTA=FNCFHASTA) END EDAD      
                                                        
                               
                        
                            

                           ,CPERSONA_CLIENTE
                          , (SELECT IDENTIFICACION FROM FITBANK.TPERSONA P WHERE FHASTA=FNCFHASTA AND P.CPERSONA=C.CPERSONA_CLIENTE ) IDENTIFICACION  
                           ,C.CCUENTA NUMCUENTA
                            ,fechaDesde FDESDEREPORTE,
                            fechaHasta FHASTAREPORTE
                          FROM FITBANK.TCUENTAPLAZO CP, FITBANK.TCUENTA C
                          WHERE CP.CCUENTA = C.CCUENTA
                          AND CP.FHASTA =FNCFHASTA
                          AND C.FHASTA =FNCFHASTA
                          AND C.CESTATUSCUENTA = '002'
                        -- AND CPERSONA_CLIENTE in ('369733', '2698236','2808133')
                         -- AND SEGMENTOCREDITO='14'
                          AND C.FAPERTURA BETWEEN fechaDesde AND fechaHasta);
                          
---SEGUNDO CURSOR       
            CURSOR TASAS_S IS
                        SELECT 'F' SISTEMA,SEGMENTOCREDITO, CUENTA, OPERACION, FECHATA, MONEDA, PLAZO, TIR, TEA, 1 OPERACIONES,CASE WHEN FRECUENCIA_PAGO = 0 THEN PLAZO ELSE FRECUENCIA_PAGO END FRECUENCIA_PAGO,
                    PERIODO_REAJUSTE, MONTOPRESTAMO, NIVEL_VENTAS, SALDO_MICROCREDITO, CODIGO_ACTIVIDAD, DESTINO_CREDITO, DESTINO_CRED_HIPOT, TIPO_CONSUMO, TIPO_GARANTIA,
                    VALOR_VIVIENDA, VALOR_METRO_CUADRADO, INST_POR, IDENTIFICACION, TIPO_IDENTIFICACION, CLASE_PRESTATARIO, TASA_REFERENCIAL_REAJUSTE, 0 CUPO_TARJETA,DESTINO_PROVINCIA, 
                    DESTINO_CANTON, ANTIGUEDAD_VIVIENDA, 0 VALOR_ENCAJE,EDAD, GENERO,CPERSONA_CLIENTE,NUMCUENTA,CAPITALREDUCIDO,FDESDEREPORTE,FHASTAREPORTE
                        FROM (
                        SELECT (SELECT CSC.CSEGMENTOCREDITO FROM FITBANK.TCUENTASEGMENTOCREDITO CSC WHERE CSC.CPERSONA_COMPANIA= C.CPERSONA_COMPANIA
                         AND CSC.CCUENTA= C.CCUENTA AND CSC.FHASTA=FNCFHASTA) SEGMENTOCREDITO,
                        (SELECT DISTINCT'14'||SUBSTR(RC.CODIGOCONTABLE, 1, 2) FROM TRANGOSCLASIFICACION RC WHERE RC.CSUBSISTEMA= '06'
                        AND RC.CCLASIFICACIONCONTABLE= C.CCLASIFICACIONCONTABLE AND RC.CESTATUSCUENTA= '003' AND RC.CESTADOOPERACION= 'O' AND RC.CODIGOPLAZO= '01') CUENTA,
                           (SELECT CSC.CCODIGOOPERACION FROM FITBANK.TCUENTASEGMENTOCREDITO CSC WHERE CSC.CPERSONA_COMPANIA= C.CPERSONA_COMPANIA
                       AND CSC.CCUENTA= C.CCUENTA AND CSC.FHASTA=FNCFHASTA) OPERACION,

                       CP.FDESEMBOLSO AS FECHATA,
                       (SELECT MI.CODIGONUMERICO FROM FITBANK.TMONEDASID MI WHERE MI.CMONEDA = C.CMONEDA) MONEDA,
                       CASE WHEN CP.PLAZO<30 THEN 30 ELSE CP.PLAZO END PLAZO,
                       (SELECT COL.TASAINTERNARETORNO FROM FITBANK.TCUENTATASAEFECTIVA COL WHERE COL.CCUENTA = CP.CCUENTA AND COL.FHASTA =FNCFHASTA) TIR,
                       (SELECT EFE.TASAEFECTIVAANUAL FROM FITBANK.TCUENTATASAEFECTIVA EFE WHERE EFE.CCUENTA = CP.CCUENTA AND EFE.FHASTA =FNCFHASTA) TEA,
                        
                       (SELECT FI.NUMERODIAS FROM FITBANK.TFRECUENCIASID FI WHERE FI.CFRECUENCIA = CP.CFRECUENCIA_INTERES) FRECUENCIA_PAGO,
                       
                       CASE WHEN CP.TASAREAJUSTABLE <> '1' OR  CP.CFRECUENCIA_REAJUSTE IS NULL THEN 0 ELSE (SELECT FI.NUMERODIAS FROM FITBANK.TFRECUENCIASID FI
                       WHERE FI.CFRECUENCIA = CP.CFRECUENCIA_REAJUSTE) END PERIODO_REAJUSTE,

                       CP.MONTOPRESTAMO,
                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('OC', 'CM', 'MI', 'PR') THEN NVL((SELECT JBG.VENTASNETAS FROM FITBANK.TJURIDICOBALANCEGENERAL JBG
                       WHERE JBG.CPERSONA = C.CPERSONA_CLIENTE AND JBG.FBALANCEGENERAL = (SELECT MAX(JBG1.FBALANCEGENERAL) FROM FITBANK.TJURIDICOBALANCEGENERAL JBG1
                       WHERE JBG1.CPERSONA = C.CPERSONA_CLIENTE AND JBG1.CMONEDA = C.CMONEDA AND JBG1.FHASTA =FNCFHASTA) AND JBG.CMONEDA = C.CMONEDA
                       AND JBG.FHASTA =FNCFHASTA), 0) ELSE 0 END NIVEL_VENTAS,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('MI') THEN NVL((SELECT SUM(S.SALDOMONEDACUENTA) FROM FITBANK.TCUENTA C1, FITBANK.TSALDOS S
                       WHERE C1.CCUENTA= S.CCUENTA AND C1.FHASTA=FNCFHASTA AND S.FHASTA=FNCFHASTA AND C1.CPERSONA_CLIENTE= C.CPERSONA_CLIENTE
                       AND C1.CSUBSISTEMA= '06' AND C1.CCLASIFICACIONCONTABLE= 'MI' AND S.CATEGORIA= 'CAPPRO'), 0) ELSE 0 END SALDO_MICROCREDITO,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('CM', 'MI', 'PR') THEN (SELECT CAI.CODIGOACTIVIDAD_HOMOLOGA FROM FITBANK.TPERSONA P, FITBANK.TCODIGOSACTIVIDADID CAI
                       WHERE P.CPERSONA = C.CPERSONA_CLIENTE AND P.FHASTA =FNCFHASTA AND P.CODIGOACTIVIDAD= CAI.CODIGOACTIVIDAD) ELSE '0' END CODIGO_ACTIVIDAD,

                       CP.CDESTINOFONDOS DESTINO_CREDITO,
                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('VI', 'VP') THEN (SELECT TSC.CDESTINOCREDITO FROM FITBANK.TSOLICITUDCOLOCACIONES TSC
                       WHERE TSC.CSOLICITUD=C.CSOLICITUD AND TSC.FHASTA=FNCFHASTA) ELSE '0' END DESTINO_CRED_HIPOT,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('ON', 'CN', 'ED') THEN (SELECT CASE WHEN TSC.CDESTINOCREDITO IN ('1', '2', '21', '22', '24', '26', '3', '4', '5') THEN 'HG'
                       WHEN TSC.CDESTINOCREDITO= '30' THEN 'RP' ELSE TSC.CDESTINOCREDITO END FROM FITBANK.TSOLICITUDCOLOCACIONES TSC
                       WHERE TSC.CSOLICITUD=C.CSOLICITUD AND TSC.FHASTA=FNCFHASTA) ELSE '0' END TIPO_CONSUMO,

                       NVL((SELECT DISTINCT CG.CTIPOGARANTIA FROM FITBANK.TCUENTAGARANTIAS CG WHERE CG.FHASTA =FNCFHASTA AND CG.CCUENTA IN
                       (SELECT CGO.CCUENTA_GARANTIA FROM FITBANK.TCUENTAGARANTIASOPERACION CGO WHERE CGO.CCUENTA = C.CCUENTA AND CGO.FHASTA =FNCFHASTA)), 'A11')
                       TIPO_GARANTIA,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('VI', 'VP') THEN NVL((SELECT SUM(CG.VALORCOMERCIAL) FROM FITBANK.TCUENTAGARANTIAS CG
                       WHERE CG.FHASTA =FNCFHASTA AND CG.CCUENTA IN (SELECT CGO.CCUENTA_GARANTIA FROM FITBANK.TCUENTAGARANTIASOPERACION CGO
                       WHERE CGO.CCUENTA = C.CCUENTA AND CGO.FHASTA =FNCFHASTA)), 0) ELSE 0 END VALOR_VIVIENDA,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('VI', 'VP') THEN NVL((SELECT ROUND(NVL(SUM(VALORESTRUCTURA+VALORSITIO), 0)/
                       NVL(SUM(MEDICIONESTRUCTURA+MEDICIONSITIO), 1), 2)
                       FROM FITBANK.TCUENTAGARANTIAS WHERE FHASTA =FNCFHASTA AND CCUENTA IN (SELECT CCUENTA_GARANTIA FROM FITBANK.TCUENTAGARANTIASOPERACION
                       WHERE CCUENTA = C.CCUENTA AND FHASTA =FNCFHASTA)), 0) ELSE 0.00 END VALOR_METRO_CUADRADO,

                       CASE WHEN CP.CORIGENFONDOS != 'P' THEN 'RC' ELSE 'OD' END INST_POR,
                       (SELECT P.IDENTIFICACION FROM FITBANK.TPERSONA P WHERE P.CPERSONA = C.CPERSONA_CLIENTE AND P.FHASTA =FNCFHASTA) IDENTIFICACION,
                       (SELECT TII.CODIGOIDENTIFICACION FROM FITBANK.TTIPOSIDENTIFICACIONID TII WHERE TII.CTIPOIDENTIFICACION = (SELECT P.CTIPOIDENTIFICACION
                       FROM TPERSONA P WHERE P.FHASTA =FNCFHASTA AND P.CPERSONA = C.CPERSONA_CLIENTE)) TIPO_IDENTIFICACION,

                       (SELECT TPI.CODIGOSUJETO FROM FITBANK.TTIPOSPERSONAID TPI WHERE TPI.CTIPOPERSONA = (SELECT P.CTIPOPERSONA FROM FITBANK.TPERSONA P
                       WHERE P.CPERSONA = C.CPERSONA_CLIENTE AND P.FHASTA =FNCFHASTA)) CLASE_PRESTATARIO,

                       CASE WHEN CP.TASAREAJUSTABLE = '1' THEN 'A' ELSE '1' END TASA_REFERENCIAL_REAJUSTE,
                       
                       (SELECT PD.CPROVINCIA FROM FITBANK.TPERSONADIRECCIONES PD WHERE PD.CPERSONA = C.CPERSONA_CLIENTE AND PD.FHASTA =FNCFHASTA
                       AND PD.CTIPODIRECCION IN ('DO') AND ROWNUM= 1) DESTINO_PROVINCIA,

                       (SELECT PD.CCIUDAD FROM FITBANK.TPERSONADIRECCIONES PD WHERE PD.CPERSONA = C.CPERSONA_CLIENTE AND PD.FHASTA =FNCFHASTA
                       AND PD.CTIPODIRECCION IN ('DO') AND ROWNUM= 1) DESTINO_CANTON,

                       CASE WHEN C.CCLASIFICACIONCONTABLE IN ('VI', 'VP') AND (SELECT TSC.CDESTINOCREDITO FROM FITBANK.TSOLICITUDCOLOCACIONES TSC
                       WHERE TSC.CSOLICITUD=C.CSOLICITUD AND TSC.FHASTA=FNCFHASTA) IN ('1', '2', '21', '22','27','28') THEN 0 ELSE 90 END ANTIGUEDAD_VIVIENDA,
                                       
                                 CASE WHEN (SELECT CTIPOIDENTIFICACION FROM FITBANK.TPERSONA PER
                                                        WHERE PER.CPERSONA=C.CPERSONA_CLIENTE 
                                                        AND PER.FHASTA=FNCFHASTA) ='RUC' THEN '0' ELSE (SELECT GENERO FROM FITBANK.TNATURALINFORMACIONBASICA P INNER JOIN FITBANK.TPERSONA PER ON P.CPERSONA=PER.CPERSONA  
                                                        WHERE P.CPERSONA=C.CPERSONA_CLIENTE AND P.FHASTA=FNCFHASTA
                                                        AND PER.FHASTA=FNCFHASTA) END GENERO,
                           
                           CASE WHEN (SELECT CTIPOIDENTIFICACION FROM FITBANK.TPERSONA PER
                                                        WHERE PER.CPERSONA=C.CPERSONA_CLIENTE 
                                                        AND PER.FHASTA=FNCFHASTA) ='RUC' THEN 0 ELSE ( SELECT  (floor(months_between(sysdate, FNACIMIENTO) /12))  FROM FITBANK.TNATURALINFORMACIONBASICA P INNER JOIN FITBANK.TPERSONA PER ON P.CPERSONA=PER.CPERSONA  
                                                        WHERE P.CPERSONA=C.CPERSONA_CLIENTE 
                                                         AND  P.FHASTA=FNCFHASTA
                                                        AND PER.FHASTA=FNCFHASTA) END EDAD      
                                   ,CPERSONA_CLIENTE
                                ,CP.CCUENTA NUMCUENTA              
                                 , CASE WHEN (SELECT CAPITALREDUCIDO FROM FITBANK.TCUENTACUOTAS 
                                                            WHERE FHASTA=FNCFHASTA AND CCUENTA=CP.CCUENTA  
                                                            AND FVENCIMIENTO BETWEEN to_date('01/'||to_char(p_fechaDesde ,'mm/yyyy'),'dd/mm/yyyy')  AND  TRUNC(LAST_DAY(p_fechaHasta )) ) IS NULL THEN  (SELECT CAPITALREDUCIDO FROM FITBANK.TCUENTACUOTAS 
                                                            WHERE FHASTA=FNCFHASTA AND CCUENTA=CP.CCUENTA AND SUBCUENTA='1') ELSE  (SELECT CAPITALREDUCIDO FROM FITBANK.TCUENTACUOTAS 
                                                            WHERE FHASTA=FNCFHASTA AND CCUENTA=CP.CCUENTA  
                                                            AND FVENCIMIENTO BETWEEN to_date('01/'||to_char(p_fechaDesde ,'mm/yyyy'),'dd/mm/yyyy')  AND  TRUNC(LAST_DAY(p_fechaHasta )) )END   CAPITALREDUCIDO
                                                            ,fechaDesde FDESDEREPORTE,
                                                            fechaHasta FHASTAREPORTE
                           
                           FROM FITBANK.TCUENTACOLOCACIONES CP, FITBANK.TCUENTA C
                           WHERE CP.CCUENTA = C.CCUENTA
                           AND CP.FHASTA =FNCFHASTA
                           AND C.FHASTA =FNCFHASTA
                           AND CP.FDESEMBOLSO BETWEEN fechaDesde AND fechaHasta  ---JUEVES 2 A 8 
                --           AND SEGMENTOCREDITO='14'
                          --    AND CPERSONA_CLIENTE in ('264799', '369733','425228','2806411','3443434')
                           AND CP.CESTADOOPERACION NOT IN ('R','E'));
   CURSOR  ACTUALIZA  IS
                                            select   CPERSONA_CLIENTE--CONTEO,(CPERSONA_CLIENTE||SEGMENTOCREDITO) CONCATENAT,CPERSONA_CLIENTE,SEGMENTOCREDITO--,IDENTIFICACION,NUMCUENTA
                                            from FITBANK.ESTRUCTURATASAS  t
                                            where --CPERSONA_CLIENTE =VCLIENTE AND
                                              SEGMENTOCREDITO <>0
                                             AND FDESDEREPORTE=fechaDesde
                                             AND FHASTAREPORTE=fechaHasta;
                                            -- AND NUMCUENTA IN ('602400002833');
   

  CURSOR CONTAR  (VCLIENTE IN NUMBER) IS
                                     select   count (CPERSONA_CLIENTE) CONTEO, CPERSONA_CLIENTE--CONTEO,(CPERSONA_CLIENTE||SEGMENTOCREDITO) CONCATENAT,CPERSONA_CLIENTE,SEGMENTOCREDITO--,IDENTIFICACION,NUMCUENTA
                                            from FITBANK.ESTRUCTURATASAS  t
                                            where CPERSONA_CLIENTE =VCLIENTE AND
                                              SEGMENTOCREDITO <>0
                                             AND FDESDEREPORTE=fechaDesde
                                             AND FHASTAREPORTE=fechaHasta
                                            group by CPERSONA_CLIENTE,SEGMENTOCREDITO;
                                            
                                            
    CURSOR SUMVALOR (VCLIENTE IN NUMBER) IS
                            select  SUM( CAPITALREDUCIDO) SUMMONTO,CPERSONA_CLIENTE,SEGMENTOCREDITO--,IDENTIFICACION,NUMCUENTA
                                        from FITBANK.ESTRUCTURATASAS  t
                                        where CPERSONA_CLIENTE =VCLIENTE
                                         AND SEGMENTOCREDITO <>0
                                         AND FDESDEREPORTE=fechaDesde
                                        AND FHASTAREPORTE=fechaHasta
                                        group by CPERSONA_CLIENTE,SEGMENTOCREDITO;  
                                        
CURSOR TIPOIDENT (VCLIENTE IN NUMBER) IS
           select  CPERSONA_CLIENTE,SEGMENTOCREDITO,TIPOIDENTIFICACION--,IDENTIFICACION,NUMCUENTA
                                        from FITBANK.ESTRUCTURATASAS  t
                                        where CPERSONA_CLIENTE =VCLIENTE AND
                                          SEGMENTOCREDITO <>0
                                         AND FDESDEREPORTE=fechaDesde
                                        AND FHASTAREPORTE=fechaHasta
                                        and SEGMENTOCREDITO in ('13','14','15');
                        
CURSOR NIVENTAS (VCLIENTE IN NUMBER) IS

SELECT (MONTOPRESTAMO * 0.55) NIVELVENTAS, MONTOPRESTAMO FROM FITBANK.ESTRUCTURATASAS
WHERE  CPERSONA_CLIENTE =VCLIENTE AND
            FDESDEREPORTE=fechaDesde
             AND FHASTAREPORTE=fechaHasta
             AND SEGMENTOCREDITO IN ('13','14','15')
             AND NIVELVENTAS='0';      
             
CURSOR ACTIV IS
SELECT CPERSONA_CLIENTE --CODIGOACTIVIDAD, 'H492201' CODIGOACTIVIDAD 
FROM FITBANK.ESTRUCTURATASAS
WHERE FDESDEREPORTE=fechaDesde
AND FHASTAREPORTE=fechaHasta
AND CODIGOACTIVIDAD  LIKE ('A01%')
OR CODIGOACTIVIDAD LIKE ('A02%');                              
                                                          
                            BEGIN
                                   ----INSERTAMOS LA VARIABLES EN LA TABLA =0
                                   FOR TA IN TASAS LOOP
                                    
                                    --VSEGMENTOCREDITO:=TA.SEGMENTOCREDITO;
                                    
                                    DBMS_OUTPUT.PUT_LINE(VSEGMENTOCREDITO || '  ' || TA.SEGMENTOCREDITO||' '|| TA.FECHAT);
                                    
                                           INSERT INTO FITBANK.ESTRUCTURATASAS  (SISTEMA,SEGMENTOCREDITO,CUENTA,OPERACION,FECHA,MONEDA,PLAZO,TIR,
                                           TEA,OPERACIONES,FRECUENCIAPAGO,PERIODOREAJUSTE,MONTOPRESTAMO,NIVELVENTAS,SALDOMICROCREDITO,CODIGOACTIVIDAD,DESTINOCREDITO
                                           ,DESTINOCREDHIPOT,TIPOCONSUMO,TIPOGARANTIA,VALORVIVIENDA,VALRMETROCUADRADO,INSTPOR,IDENTIFICACION,TIPOIDENTIFICACION,CLASEPRESTATARIO,TASAREFERENREAJUSTE,
                                           CUPOTARJETA,DESTINOPROVINCIA,DESTINOCANTON,ANTIGUEDADVIVIENDA,VALORENCAJE,
                                           EDAD,GENERO,CPERSONA_CLIENTE,NUMCUENTA,CAPITALREDUCIDO,CONTAR,SUMMONTO,FDESDEREPORTE,FHASTAREPORTE) 
                                           VALUES (TA.SISTEMA,TA.SEGMENTOCREDITO,TA.CUENTA,TA.OPERACION,TA.FECHAT,TA.MONEDA,TA.PLAZO,TA.TIR,
                                           TA.TEA,TA.OPERACIONES,TA.FRECUENCIA_PAGO,TA.PERIODO_REAJUSTE,TA.MONTO,TA.NIVEL_VENTAS,TA.SALDO_MICROCREDITO,TA.CODIGO_ACTIVIDAD,TA.DESTINO_CREDITO,
                                           TA.DESTINO_CRED_HIPOT,TA.TIPO_CONSUMO,TA.TIPO_GARANTIA,TA.VALOR_VIVIENDA,TA.VALOR_METRO_CUADRADO,TA.INST_POR,TA.IDENTIFICACION,TA.TIPO_IDENTIFICACION,TA.CLASE_PRESTATARIO
                                           ,TA.TASA_REF_REAJUSTE,TA.CUPO_TARJETA,TA.DESTINO_PROVINCIA,TA.DESTINO_CANTON,TA.ANTIGUEDAD_VIVIENDA,TA.VALOR_ENCAJE,
                                           TA.EDAD,TA.GENERO,TA.CPERSONA_CLIENTE,TA.NUMCUENTA,TA.CAPITALREDUCIDO,TA.CONTAR,TA.SUMMONTO,TA.FDESDEREPORTE,TA.FHASTAREPORTE);
                                           
                                    
                                   
                                    
                                    END LOOP;
                                 
                            
                                               
                                    
                            ---HACEMOS EL COUNT DE LAS OPERACIONES SEGEMENTO <>0 
                            
                                       
                                         FOR TA_DOS IN TASAS_S LOOP
                                                
                                                --VSEGMENTOCREDITO:=TA.SEGMENTOCREDITO;
                                                
                                                DBMS_OUTPUT.PUT_LINE(' segmento:  ' || TA_DOS.SEGMENTOCREDITO|| ' capital reducido: '||TA_DOS.CAPITALREDUCIDO||' cliente: '|| TA_DOS.CPERSONA_CLIENTE||' ceunta: '|| TA_DOS.NUMCUENTA||'FECHA'||' '|| TA_DOS.FECHATA);
                                                
                                                
                                                       INSERT INTO FITBANK.ESTRUCTURATASAS   (SISTEMA,SEGMENTOCREDITO,CUENTA,OPERACION,FECHA,MONEDA,PLAZO,TIR,TEA,OPERACIONES,FRECUENCIAPAGO,PERIODOREAJUSTE,MONTOPRESTAMO,NIVELVENTAS,SALDOMICROCREDITO,CODIGOACTIVIDAD,DESTINOCREDITO
                                                                                                                           ,DESTINOCREDHIPOT,TIPOCONSUMO,TIPOGARANTIA,VALORVIVIENDA,VALRMETROCUADRADO,INSTPOR,IDENTIFICACION,TIPOIDENTIFICACION,CLASEPRESTATARIO,TASAREFERENREAJUSTE,CUPOTARJETA
                                                                                                                           ,DESTINOPROVINCIA,DESTINOCANTON,ANTIGUEDADVIVIENDA,VALORENCAJE, EDAD,GENERO,CPERSONA_CLIENTE,NUMCUENTA,CAPITALREDUCIDO,FDESDEREPORTE,FHASTAREPORTE)
                                                       VALUES (TA_DOS.SISTEMA,TA_DOS.SEGMENTOCREDITO,TA_DOS.CUENTA,TA_DOS.OPERACION,TA_DOS.FECHATA,TA_DOS.MONEDA,TA_DOS.PLAZO,TA_DOS.TIR,TA_DOS.TEA,TA_DOS.OPERACIONES,TA_DOS.FRECUENCIA_PAGO,TA_DOS.PERIODO_REAJUSTE,TA_DOS.MONTOPRESTAMO,TA_DOS.NIVEL_VENTAS,TA_DOS.SALDO_MICROCREDITO,TA_DOS.CODIGO_ACTIVIDAD,TA_DOS.DESTINO_CREDITO,
                                                                   TA_DOS.DESTINO_CRED_HIPOT,TA_DOS.TIPO_CONSUMO,TA_DOS.TIPO_GARANTIA,TA_DOS.VALOR_VIVIENDA,TA_DOS.VALOR_METRO_CUADRADO,TA_DOS.INST_POR,TA_DOS.IDENTIFICACION,TA_DOS.TIPO_IDENTIFICACION,TA_DOS.CLASE_PRESTATARIO
                                                                   ,TA_DOS.TASA_REFERENCIAL_REAJUSTE,TA_DOS.CUPO_TARJETA,TA_DOS.DESTINO_PROVINCIA,TA_DOS.DESTINO_CANTON,TA_DOS.ANTIGUEDAD_VIVIENDA,TA_DOS.VALOR_ENCAJE,TA_DOS.EDAD,TA_DOS.GENERO,TA_DOS.CPERSONA_CLIENTE,TA_DOS.NUMCUENTA
                                                                   , TA_DOS.CAPITALREDUCIDO,TA_DOS.FDESDEREPORTE,TA_DOS.FHASTAREPORTE);
                                                       
                                                
                                                COMMIT;
                                                 DBMS_OUTPUT.PUT_LINE( 'segmento: '||TA_DOS.SEGMENTOCREDITO ||' capital despues del insert ' || TA_DOS.CAPITALREDUCIDO|| 'identificacion:  '||TA_DOS.IDENTIFICACION||' cliente: '|| TA_DOS.CPERSONA_CLIENTE);
                                                
                                               
                                     
                                         
                                            
                                        END LOOP;
                                           
                                    FOR C IN ACTUALIZA LOOP
                                    
                                               FOR CONT IN CONTAR  (C.CPERSONA_CLIENTE)  LOOP
                                                    
                                                    
                                                     UPDATE FITBANK.ESTRUCTURATASAS SET CONTAR=CONT.CONTEO WHERE CPERSONA_CLIENTE=C.CPERSONA_CLIENTE AND FDESDEREPORTE=fechaDesde AND FHASTAREPORTE=fechaHasta AND SEGMENTOCREDITO <>0 ;
                                                     
                                                    COMMIT;
                                                    END LOOP;
                                            
                                    
                                             FOR SM IN SUMVALOR  (C.CPERSONA_CLIENTE)  LOOP
                                                        
                                                        
                                                         UPDATE FITBANK.ESTRUCTURATASAS SET SUMMONTO=SM.SUMMONTO WHERE CPERSONA_CLIENTE=C.CPERSONA_CLIENTE AND FDESDEREPORTE=fechaDesde AND FHASTAREPORTE=fechaHasta AND SEGMENTOCREDITO <>0 ;
                                                         
                                                        COMMIT;
                                                        END LOOP;
                                            
                                               FOR TI IN TIPOIDENT  (C.CPERSONA_CLIENTE)  LOOP
                                                
                                                
                                                 UPDATE FITBANK.ESTRUCTURATASAS SET TIPOIDENTIFICACION='M' WHERE CPERSONA_CLIENTE=C.CPERSONA_CLIENTE AND FDESDEREPORTE=fechaDesde AND FHASTAREPORTE=fechaHasta AND SEGMENTOCREDITO <>0 AND SEGMENTOCREDITO in ('13','14','15'); 
                                                      
                                                 COMMIT;
                             
                                                END LOOP;
                                                
                                                
                                                
                                                  FOR VN IN NIVENTAS  (C.CPERSONA_CLIENTE)  LOOP
                                                
                                                
                                                 UPDATE FITBANK.ESTRUCTURATASAS SET NIVELVENTAS=VN.NIVELVENTAS WHERE CPERSONA_CLIENTE=C.CPERSONA_CLIENTE AND FDESDEREPORTE=fechaDesde AND FHASTAREPORTE=fechaHasta
                                                                                                                                                                 AND SEGMENTOCREDITO IN ('13','14','15')  AND NIVELVENTAS='0';    
                                                      
                                                 COMMIT;
                             
                                                END LOOP;
                                               
                                               
                                                
                                                    FOR ACT IN ACTIV   LOOP
                                                
                                                
                                                 UPDATE FITBANK.ESTRUCTURATASAS SET CODIGOACTIVIDAD='H492201' WHERE CPERSONA_CLIENTE=ACT.CPERSONA_CLIENTE AND FDESDEREPORTE=fechaDesde AND FHASTAREPORTE=fechaHasta
                                                                                                                                                                 AND CODIGOACTIVIDAD  LIKE ('A01%') OR CODIGOACTIVIDAD LIKE ('A02%');
                                                      
                                                 COMMIT;
                             
                                                END LOOP;
                                               
                                    END LOOP;
                                    
                            
                       
                            END;
                        
END;