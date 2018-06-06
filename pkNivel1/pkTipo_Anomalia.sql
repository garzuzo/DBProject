
CREATE OR REPLACE PACKAGE pkTipo_Anomalia AS
PROCEDURE insertar(id NUMBER, nombre_Anomalia VARCHAR2);
PROCEDURE eliminar(id NUMBER);
PROCEDURE actualizarNombreAnomalia(id NUMBER, nombre_Anomalia VARCHAR2);
FUNCTION  buscarTipoAnomalia(id NUMBER) RETURN tipo_anomalia%rowtype;
END pkTipo_Anomalia;
/
CREATE OR REPLACE PACKAGE BODY pkTipo_Anomalia AS

PROCEDURE insertar(id NUMBER, nombre_Anomalia VARCHAR2) IS
BEGIN 
INSERT INTO TIPO_ANOMALIA VALUES(id, nombre_Anomalia);
--EXCEPTION
--WHEN OTHERS THEN
--    raise_application_error(-20000, 'Error insertando en tabla Cliente' || ERRMSG);
END insertar;

PROCEDURE eliminar(id NUMBER) IS
BEGIN
DELETE FROM TIPO_ANOMALIA t WHERE t.ID = id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Cliente.'||SQLCODE);
END eliminar;

PROCEDURE actualizarNombreAnomalia(id NUMBER, nombre_Anomalia VARCHAR2) IS
BEGIN
UPDATE TIPO_ANOMALIA t SET t.NOMBRE_ANOMALIA = nombre_Anomalia WHERE t.ID= id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar el nombre de un registro en la tabla Cliente.'||SQLCODE);
END actualizarNombreAnomalia;





--TODO: fix rowtype
FUNCTION buscarTipoAnomalia(id NUMBER) RETURN  tipo_anomalia%rowtype   IS
--DECLARACION VARIABLES
--datosCliente VARCHAR2(200);
tip tipo_anomalia%rowtype;
BEGIN
SELECT * into tip
FROM TIPO_ANOMALIA t
WHERE t.ID=id;

RETURN tip;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Cliente.'||SQLERRM);
END buscarTipoAnomalia;

END pkTipo_Anomalia;
/

EXECUTE PKTIPO_ANOMALIA.insertar(3, 'Daño neuronal');