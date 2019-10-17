--Respaldos de los Registros eliminados
create table FITBANK.tmp_mayor08062019 as
select *
from FITBANK.tsaldoscontablesdiario
where fcontable between '25/04/2019' and '09/05/2019'
and fcontable not in ('29/04/2019')
order by fcontable, csucursal, coficina;

--Cursor de Mayorizacion
DECLARE 
        CURSOR FECHAS_PROCESO IS
            SELECT TO_DATE('25/04/2019','DD/MM/YYYY') + ROWNUM -1 Fecha
            FROM ALL_OBJECTS
            WHERE ROWNUM <=TO_DATE('09/05/2019','DD/MM/YYYY') -TO_DATE('25/04/2019','DD/MM/YYYY')+1;
        BEGIN 
             FOR I IN FECHAS_PROCESO LOOP
                IF I.FECHA<>TO_DATE('29/04/2019') THEN --EL 29/04/2019 YA FUE EJECUTADO EL DIA 04/06/2019
                    FITBANK.MAYORIZACION(I.FECHA);
                    COMMIT;
                    DBMS_OUTPUT.PUT_LINE('Ejecutado: '||I.FECHA);
                END IF;  
             END LOOP;
        END;