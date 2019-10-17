--**************************
--mayoriza de un día
--**************************
DECLARE
    VFECHA DATE:=TO_DATE('2019/05/29','YYYY/MM/DD');
BEGIN
     fitbank.MAYORIZACION(VFECHA);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR: '||SQLERRM);
END;