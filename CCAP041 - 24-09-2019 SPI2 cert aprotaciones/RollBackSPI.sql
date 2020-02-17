DELETE FROM FITBANK.TPARAMETROSSISTEMA WHERE CIDIOMA = 'ES' AND CPARAMETROSISTEMA='04_EXC_SPI2' 
    AND FHASTA= fncfhasta AND DESCRIPCION = 'Producto especificados para permitir trasnferencias' 
    AND VERSIONCONTROL = 0 ;
    
DELETE FROM FITBANK.TCOMPANIAPARAMETROSSISTEMA WHERE CPERSONA_COMPANIA = 2 AND CPARAMETROSISTEMA = '04_EXC_SPI2' 
    AND VALORTEXTO ='040703';
    
DELETE FROM FITBANK.TPARAMETROSSISTEMAID WHERE CPARAMETROSISTEMA = '04_EXC_SPI2' AND TIPODATO = 'T';

DELETE FROM FITBANK.tresultados WHERE cidioma= 'ES' AND fhasta = fncfhasta AND versioncontrol = 0 
    AND cresultado= 'DVI449' AND descripcion = 'EL PRODUCTO AL QUE PERTENECE LA  CUENTA {0} NO PERMITE TRANSFERENCIAS';

DELETE FROM FITBANK.tresultadosid WHERE CRESULTADO = 'DVI449';
    
DELETE FROM FITBANK.TCOMANDOS WHERE COMANDO = 'com.fitbank.view.validate.item.acco.VerifyProducts' AND TIPOCOMANDO = 'FIN' 
    AND FHASTA = TIMESTAMP '2999-12-31 00:00:00' AND CIDIOMA= 'ES'    
    AND DESCRIPCION='lase que se encarga de verificar que el producto al que pertenece la cuenta acepta transferencias' AND VERSIONCONTROL = 0;
    
DELETE FROM FITBANK.TCOMANDOSRUBRO WHERE CSUBSISTEMA='04' AND CTRANSACCION = '5011' 
    AND VERSIONTRANSACCION='01' AND RUBRO= 1 AND SCOMANDO= 8 AND ORDEN=8 
    AND  COMANDO= 'com.fitbank.view.validate.item.acco.VerifyProducts' AND TIPOCOMANDO = 'FIN' AND VALIDACION= '1'  AND USACACHE = '0'  AND VERSIONCONTROL = 0;

DELETE FROM FITBANK.TCOMANDOSID WHERE COMANDO = 'com.fitbank.view.validate.item.acco.VerifyProducts' AND TIPOCOMANDO = 'FIN';