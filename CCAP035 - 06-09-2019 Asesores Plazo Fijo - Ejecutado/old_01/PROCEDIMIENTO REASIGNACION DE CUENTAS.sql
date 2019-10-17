---**********************************************************************************
-- El procedimiento reasigna todo el portafolio de inversiones de un oficial de cuenta a otro en la misma oficina
-- Se debe ingresar los siguinetes parámetros:
--      pOficialAnterior.-       Codigo del usuario del oficial que entrega el portafolio
--      pvOficialNuevo.-        Codigo del usuario del oficial que recibe el portafolio
--      pvOficina.-               Oficina a la que pertenecem las operaciones
--      pUsuarioModifica .-   Codigo de usuario de quien solicita se realice el cambio
---***********************************************************************************

CREATE OR REPLACE PROCEDURE FITBANK.REASIGNACIONPLAZOFIJO(pOficialAnterior IN VARCHAR2,pvOficialNuevo IN VARCHAR2,pOficina NUMBER,pUsuarioModifica IN VARCHAR2) IS

CURSOR TABLATCUENTA(pOficialA in varchar2,pOficina in number,pFhasta in timestamp) IS
SELECT *
FROM FITBANK.TCUENTA TC
WHERE TC.CSUBSISTEMA='05'
AND TC.CESTATUSCUENTA='002'
AND CUSUARIO_OFICIALCUENTA=pOficialA
and coficina=pOficina
AND FHASTA=pFhasta;

vOficialAnterior VARCHAR2(12);
vOficialNuevo VARCHAR2(12);
vOficinaAnterior number(2);
vOficinaNuevo number(2);
vUsuarioModifica varchar2(12);
vOficina NUMBER(3);
vOficinaOficialAnterior NUMBER(3);
vOficinaOficialNuevo NUMBER(3);
vTotalOperaciones NUMBER(4);
vOficinaUsuarioModifica NUMBER(4);
vFhasta timestamp;
OFICINAOFICIALES EXCEPTION;
OPERACIONESOFICINA EXCEPTION;

BEGIN

vTotalOperaciones:=0;

vOficialAnterior :=  pOficialAnterior;
vOficialNuevo := pvOficialNuevo;
vOficina:= pOficina;

vUsuarioModifica:=pUsuarioModifica;

vFhasta:=SYSDATE;

BEGIN
        
    SELECT COFICINA 
    INTO vOficinaOficialAnterior
    FROM FITBANK.TCOMPANIAUSUARIOS 
    WHERE CUSUARIO=vOficialAnterior 
    AND FHASTA=FITBANK.FNCFHASTA;
    
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20100,'[ERROR - EL OFICIAL DE CUENTA ANTERIOR NO EXISTE: '||vOficialAnterior||']');
END;

BEGIN
    SELECT COFICINA 
    INTO vOficinaOficialNuevo
    FROM FITBANK.TCOMPANIAUSUARIOS 
    WHERE CUSUARIO=vOficialNuevo
    AND FHASTA=FITBANK.FNCFHASTA;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20101,'[ERROR - EL OFICIAL DE CUENTA NUEVO NO EXISTE: '||vOficialNuevo||']');
END;

BEGIN
    SELECT COFICINA 
    INTO vOficinaUsuarioModifica
    FROM FITBANK.TCOMPANIAUSUARIOS 
    WHERE CUSUARIO=vUsuarioModifica
    AND FHASTA=FITBANK.FNCFHASTA;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20102,'[ERROR - EL USUARIO QUE MODIFICA NO EXISTE: '||vUsuarioModifica||']');
END;


   --IF vOficinaOficialAnterior=vOficinaOficialNuevo THEN

                SELECT COUNT(*) 
                INTO vTotalOperaciones
                FROM FITBANK.TCUENTA TC
                WHERE TC.CSUBSISTEMA='05'
                AND TC.CESTATUSCUENTA='002'
                AND CUSUARIO_OFICIALCUENTA=vOficialAnterior
                and coficina=vOficina
                AND FHASTA=FITBANK.fncfhasta; 
                
                IF  vTotalOperaciones<>0 THEN
                
               
                        UPDATE FITBANK.TCUENTA TC SET FHASTA=vFhasta
                        WHERE TC.CSUBSISTEMA='05'
                        AND TC.CESTATUSCUENTA='002'
                        AND CUSUARIO_OFICIALCUENTA=vOficialAnterior
                        and coficina=vOficina
                        AND FHASTA=FITBANK.fncfhasta;         
                        
                        COMMIT;
                        
                        
                        FOR REG IN TABLATCUENTA(vOficialAnterior,vOficina,vFhasta) LOOP
                                
                                BEGIN
                                
                                        INSERT INTO FITBANK.TCUENTA VALUES (REG.CCUENTA,
                                        FITBANK.FNCFHASTA,
                                        REG.CPERSONA_COMPANIA,
                                        vFhasta,
                                        REG.NOMBRECUENTA,
                                        REG.CMONEDA,
                                        REG.CSUCURSAL,
                                        REG.COFICINA,
                                        vOficialNuevo, --CUSUARIO_OFICIALCUENTA
                                        REG.CSUBSISTEMA,
                                        REG.CCLASIFICACIONCONTABLE,
                                        REG.CGRUPOPRODUCTO,
                                        REG.CPRODUCTO,
                                        REG.CTIPOBANCA,
                                        REG.CESTATUSCUENTA,
                                        REG.CPERSONA_CLIENTE,
                                        REG.NIVELSEGURIDAD,
                                        REG.CTIPOSEGMENTO,
                                        REG.FAPERTURA,
                                        REG.CSUCURSAL_APERTURA,
                                        REG.COFICINA_APERTURA,
                                        REG.CUSUARIO_INGRESO,
                                        vUsuarioModifica, --CUSUARIO_MODIFICACION
                                        vOficialAnterior, --CUSUARIO_OFICIALANTERIOR
                                        REG.CSOLICITUD,
                                        REG.CCONDICIONOPERATIVA,
                                        REG.CTARIFARIOTASA,
                                        REG.CTARIFARIO,
                                        REG.CGRUPOBALANCE,
                                        REG.CMOTIVOESTATUSCUENTA,
                                        REG.CESTATUSECONOMICO,
                                        REG.CCALIFICACIONRIESGO,
                                        REG.NUMEROMENSAJE,
                                        REG.CAGRUPACIONCONTABLE,
                                        REG.CRAZONAPERTURA,
                                        REG.FREAPERTURA,
                                        REG.CUENTAANTERIOR,
                                        REG.CDESTINOFONDOS,
                                        REG.FTOPECONDICIONOPERATIVA,
                                        REG.CUENTAINTERBANCARIA,
                                        REG.CINDICADOROPERACIONEXENTA,
                                        REG.CPRODUCTOPROMOCION,
                                        REG.CPERSONA_ASESOREXTERNO,
                                        REG.VERSIONCONTROL,
                                        REG.CCALIFICACIONCREDITO,
                                        REG.CPERSONA_COMPANIAEXTERNA,
                                        REG.COFICINAEXTERNA,
                                        REG.EXONERADOIMPUESTO,
                                        REG.FCANCELACION,
                                        REG.CAREA,
                                        REG.CUSUARIO_OFICIALJURIDICO,
                                        REG.CUSUARIO_OFICIALAPERTURA,
                                        REG.SECUENCIA,
                                        REG.CUSUARIO_OFICIALCOBRANZAS
                                        );
                                        
                                        --commit;
                                        
                                EXCEPTION
                                WHEN OTHERS THEN
                                    RAISE_APPLICATION_ERROR(-20103,'[ERROR AL INSERTAR EL NUEVO REGISTRO: ' || REG.CCUENTA||' '||SQLERRM);
                                END;
                                 
                                  
                        END LOOP;
                        
                ELSE
                
                 RAISE OPERACIONESOFICINA;
                
                END IF;
 --  ELSE   
 --   RAISE OFICINAOFICIALES;
--   END IF;


dbms_output.put_line('SE han reasignado: '||vTotalOperaciones||' operaciones, del usuario '||vOficialAnterior ||' al usuario '||vOficialNuevo||' en la agencia '||vOficina); 
commit;

EXCEPTION
--WHEN OFICINAOFICIALES THEN
 --   RAISE_APPLICATION_ERROR(-20104,'[ERROR - EL OFICIAL ANTERIOR Y EL NUEVO NO PERTENECEN A LA MISMA OFICINA]');
WHEN OPERACIONESOFICINA THEN
    RAISE_APPLICATION_ERROR(-20105,'[ERROR - NO EXISTEN OPERACIONES DE OFICIAL ANTERIOR '||vOficialAnterior|| ' EN LA OFICINA '||vOficina|| ']');
END;





