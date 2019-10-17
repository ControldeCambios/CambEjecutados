---**********************************************************************************
-- El procedimiento reasigna todo el portafolio de inversiones de un oficial de cuenta a otro en la misma oficina
-- Se debe ingresar los siguinetes parámetros:
--      pOficialAnterior.-       Codigo del usuario del oficial que entrega el portafolio
--      pvOficialNuevo.-        Codigo del usuario del oficial que recibe el portafolio
--      pvOficina.-               Oficina a la que pertenecem las operaciones
--      pUsuarioModifica .-   Codigo de usuario de quien solicita se realice el cambio
---***********************************************************************************

EXEC REASIGNACIONPLAZOFIJO(:pOficialAnterior,:pvOficialNuevo,:pvOficina,:pUsuarioModifica);