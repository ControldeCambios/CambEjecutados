---1._GENERACION DESDE LA BASE DE SIFCO EN LA BASE DE SIFCO
BEGIN
                        TASAS_SIFCO(to_date(:fechaDesde,'dd-mm-yyyy'),to_date(:fechaHasta,'dd-mm-yyyy'));
                                EXCEPTION
                                    WHEN OTHERS THEN
                                        DBMS_OUTPUT.PUT_LINE('Error general la informacion:  '||SQLERRM);
                                END;

				
---2._INSERTAMOS LA INFORMACION DE LA ESTRUCUTRA DE SIFCO EN FITBAN GENERARA DESDE FIBANK
                                                        
                                               BEGIN 
                                                INSERT INTO FITBANK.ESTRUCTURATASAS ( SELECT * FROM sifco_owner.ESTRUCTURATASAS@sifco
                                                                                WHERE FDESDEREPORTE=:fechaDesde
                                                                                AND FHASTAREPORTE= :fechaHasta);
												COMMIT;
                                                END;

-------3._GENERACION ESTRUCTURA FITBANK DESDE LA BASE DE FITBANK
   BEGIN
                        
                        
                        FITBANK.SP_TASASP(to_date(:fechaDesde,'dd-mm-yyyy'),to_date(:fechaHasta,'dd-mm-yyyy'));
                        
                        EXCEPTION
                            WHEN OTHERS THEN
                                DBMS_OUTPUT.PUT_LINE('Error general la informacion:  '||SQLERRM);
                        END;



----------------+++++++++++++++++++++++++++++++GENERACION DEL ARCHIVO++++++++++++++++++++++++++++++++++++++
----4.  GENERAR LA INFORMCION EN LA BASE DE FITBANK INGRESO DE FECHAS  ACTIVAR DBMS OUTPUT
DECLARE
CURSOR CONTEO IS 
                 SELECT (COUNT(*)+1) LINEAS FROM FITBANK.ESTRUCTURATASAS
                WHERE FDESDEREPORTE= TO_DATE(:VINICIO,'DD-MM-YYY')
                AND FHASTAREPORTE=:VFIN;
       BEGIN                             
                                              FOR L IN CONTEO LOOP
                        
                                DBMS_OUTPUT.PUT_LINE(:VINICIO||CHR(9)||'1122'||CHR(9)||L.LINEAS);
                           
                        END LOOP;
                        DBMS_OUTPUT.NEW_LINE;
         END;



-----5._ GENERAR LA INFORMCION EN LA BASE DE FITBANK INGRESO DE FECHAS  ACTIVAR DBMS OUTPUT
DECLARE
CURSOR ESTR_TASAS IS 

        SELECT SEGMENTOCREDITO,CUENTA,OPERACION, to_char(FECHA,'dd/mm/yyyy') FECHA,MONEDA,PLAZO,  to_char(TIR, 'fm9990.00') TIR,
       to_char(TEA, 'fm9990.00')  TEA,  OPERACIONES,FRECUENCIAPAGO,PERIODOREAJUSTE,  to_char(MONTOPRESTAMO, 'fm9999990.00')  MONTOPRESTAMO,  to_char(NIVELVENTAS, 'fm9999990.00') NIVELVENTAS ,CONTAR NCREDVIGENTES,
       to_char(SUMMONTO, 'fm999990.00')   SALDOVIGENTE, CODIGOACTIVIDAD,DESTINOCREDHIPOT,  
       DESTINOCREDITO DESTINO_ANTERIOR,     
       CASE WHEN SEGMENTOCREDITO= '9' THEN 'TF' ELSE DESTINOCREDITO END DESTINOCREDITO,
       CASE WHEN SEGMENTOCREDITO= '9'  AND TIPOCONSUMO='VH'  THEN 'OT' ELSE TIPOCONSUMO END TIPOCONSUMO ,TIPOCONSUMO TPIANTERIOR,TIPOGARANTIA, to_char(VALORVIVIENDA, 'fm9999990.00')   VALORCOMERCIAL, to_char(VALRMETROCUADRADO, 'fm9990.00')  VALRMETROCUADRADO,
       INSTPOR,IDENTIFICACION,
       TIPOIDENTIFICACION,CLASEPRESTATARIO,TASAREFERENREAJUSTE
        ,  to_char(CUPOTARJETA, 'fm999990.00') CUPOTARJETA,
         CASE WHEN DESTINOPROVINCIA IS NULL THEN '17' ELSE DESTINOPROVINCIA END DESTINOPROVINCIA ,
        CASE WHEN DESTINOCANTON IS NULL THEN '01' ELSE DESTINOCANTON END DESTINOCANTON
        ,ANTIGUEDADVIVIENDA, to_char(VALORENCAJE, 'fm999990.00')  VALORENCAJE,GENERO, to_char(EDAD, 'fm999990.00')  EDAD
         FROM FITBANK.ESTRUCTURATASAS
        WHERE FDESDEREPORTE= :VINICIO
        AND FHASTAREPORTE=:VFIN;
    
   BEGIN                             
                     BEGIN
                                
                                FOR C IN ESTR_TASAS LOOP
                                
                                        DBMS_OUTPUT.PUT_LINE(C.SEGMENTOCREDITO||CHR(9)||C.CUENTA||CHR(9)||C.OPERACION||CHR(9)||C.FECHA||CHR(9)||C.MONEDA||CHR(9)||C.PLAZO ||CHR(9)|| C.TIR||CHR(9)||C.TEA||CHR(9)|| C.OPERACIONES||CHR(9)||C.FRECUENCIAPAGO||CHR(9)||C.PERIODOREAJUSTE||CHR(9)||C.MONTOPRESTAMO||CHR(9)||C.NIVELVENTAS||CHR(9)||
                                                                               C.NCREDVIGENTES ||CHR(9)||C.SALDOVIGENTE||CHR(9)||C.CODIGOACTIVIDAD||CHR(9)||C.DESTINOCREDITO||CHR(9)||C.DESTINOCREDHIPOT||CHR(9)||C.TIPOCONSUMO||CHR(9)||C.TIPOGARANTIA||CHR(9)||C.VALORCOMERCIAL||CHR(9)||C.VALRMETROCUADRADO||CHR(9)||C.INSTPOR||CHR(9)||C.IDENTIFICACION||CHR(9)||C.TIPOIDENTIFICACION||CHR(9)||C.CLASEPRESTATARIO
                                                                                ||CHR(9)||C.TASAREFERENREAJUSTE||CHR(9)||C.CUPOTARJETA||CHR(9)||C.DESTINOPROVINCIA||CHR(9)||C.DESTINOCANTON||CHR(9)||C.ANTIGUEDADVIVIENDA||CHR(9)||C.VALORENCAJE||CHR(9)||C.GENERO||CHR(9)||C.EDAD);
                                END LOOP;
                              
                     END;        
                   END;                   


-----6._ GENERAR LA INFORMCION EN LA BASE DE FITBANK INGRESO DE FECHAS  ACTIVAR DBMS OUTPUT
DECLARE
VTIR NUMBER(5, 2);
 VSUMTASAXVALOR NUMBER(18, 2):=0;
 VNUMOPERACIONES NUMBER(10):=0;
 VSUMVALORES NUMBER(18, 2):=0;
 VPROMEDIOTASAS NUMBER(5, 2);
CURSOR DEPOSITOSAHORROS IS
            SELECT TT.CSUBSISTEMA, TT.CGRUPOPRODUCTO, TT.CPRODUCTO, TT.VALORMONEDACUENTA VALOR --COUNT(*)--sum(VALORMONEDACUENTA)
            FROM             FITBANK.TMOVIMIENTOS TT INNER JOIN FITBANK.TCUENTA TC ON TC.CCUENTA=TT.CCUENTA
             WHERE  
                         TT.CTIPOSALDOCATEGORIA = 'SAL'
                            AND TT.CSUBSISTEMA = '04'
                            AND TT.CATEGORIA NOT IN ('INTERS')
                            AND FCONTABLE BETWEEN :VINICIO AND :VFIN 
                            AND TC.CSUBSISTEMA = '04'  
                            AND TC.CGRUPOPRODUCTO = '01'  
                            AND TC.CPRODUCTO IN ( '01','07','05','06') 
                            AND TC.FHASTA = TO_DATE('31/12/2999','dd/mm/yyyy')  
                            AND TT.DEBITOCREDITO = 'C'
                            AND (TT.VALORMONEDAMOVIMIENTO<>0  AND TT.VALORMONEDACUENTA<>0)
                            AND NUMEROMENSAJE_REVERSO IS NULL
                           -- AND RUBRO  IN ('1')
                            AND TT.REVERSO=0
                            AND CODIGOCONTABLE IN (
                                    '21010101',
                                    '21010102',
                                    '21010103',
                                    '21010104',
                                    '21010201',
                                    '21010202',
                                    '21010203',
                                    '21010204',
                                    '21040208',
                                    '2101010513',
                                    '2101010510',
                                    '2101010511',
                                    '2101010512',
                                    '21013510',
                                    '2101351001',
                                    '21013515',
                                    '2101350514',
                                    '2101350515');    
        BEGIN
                               -- DBMS_OUTPUT.put_line (' '); 
                            FOR X IN DEPOSITOSAHORROS LOOP
                                    VTIR:= TASAS(X.CSUBSISTEMA, X.CGRUPOPRODUCTO, X.CPRODUCTO, X.VALOR);
                                    VSUMTASAXVALOR:= VSUMTASAXVALOR+(VTIR* X.VALOR);
                                    VNUMOPERACIONES:= VNUMOPERACIONES+1;
                                    VSUMVALORES:= VSUMVALORES+ X.VALOR;
                            END LOOP;
                        
                                IF VSUMVALORES>0 THEN
                                    VPROMEDIOTASAS:= VSUMTASAXVALOR/ VSUMVALORES;
                                END IF;
                                
                                DBMS_OUTPUT.PUT_LINE( 0||CHR(9)||210135||CHR(9)||0||CHR(9)||TO_CHAR(:VINICIO,'DD/MM/YYYY')||CHR(9)||1||CHR(9)||0||CHR(9)||LTRIM(TO_CHAR(VPROMEDIOTASAS, '99.99'))||CHR(9)||
                                    LTRIM(TO_CHAR(VPROMEDIOTASAS, '99.99'))||CHR(9)||VNUMOPERACIONES||CHR(9)||360||CHR(9)||0||CHR(9)||LTRIM(TO_CHAR(VSUMVALORES, '9999999999.99'))||CHR(9)
                                    ||0||CHR(9)||LTRIM(TO_CHAR('0.00'))||CHR(9)||LTRIM(TO_CHAR('0.00'))||CHR(9)||0||CHR(9)||0||CHR(9)||0||CHR(9)||0||CHR(9)||LTRIM(TO_CHAR('0.00'))||CHR(9)||
                                    0||CHR(9)||LTRIM(TO_CHAR('0.00'))||CHR(9)||0||CHR(9)||0||CHR(9)||0||CHR(9)||0||CHR(9)||0||CHR(9)||LTRIM(TO_CHAR('0.00'))||CHR(9)||0||CHR(9)||0||CHR(9)||
                                    LTRIM(TO_CHAR('0.00')));

                    END;
                