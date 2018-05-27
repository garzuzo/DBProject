CREATE OR REPLACE PACKAGE pkDanio AS -- spec
PROCEDURE pInsertar(id NUMBER, Descripcion VARCHAR2, tipo_Anomalia NUMBER,solicitud_id NUMBER);
PROCEDURE pEliminar(id NUMBER);
PROCEDURE pActualizarDescripcion(id NUMBER, descripcion VARCHAR2);
FUNCTION  fBuscarDanio(id NUMBER) RETURN danio%rowtype;
END pkDanio;
/
CREATE OR REPLACE PACKAGE BODY pkDanio AS -- body

PROCEDURE pInsertar(id NUMBER, Descripcion VARCHAR2, tipo_Anomalia NUMBER,solicitud_id NUMBER) IS
BEGIN 
INSERT INTO Danio VALUES(id, Descripcion, tipo_Anomalia,solicitud_id);
--EXCEPTION
--WHEN OTHERS THEN
--    raise_application_error(-20000, 'Error insertando en tabla Cliente' || ERRMSG);
END pInsertar;

PROCEDURE pEliminar(id NUMBER) IS
BEGIN
DELETE FROM DANIO d WHERE d.ID_DANIO = id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Cliente.'||SQLCODE);
END pEliminar;

PROCEDURE pActualizarDescripcion(id NUMBER, descripcion VARCHAR2) IS
BEGIN
UPDATE Danio d SET d.DESCRICION_PROBLEMA = descripcion WHERE d.ID_DANIO= id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar el nombre de un registro en la tabla Cliente.'||SQLCODE);
END pActualizarDescripcion;





FUNCTION fBuscarDanio(id NUMBER) RETURN danio%rowtype   IS
--DECLARACION VARIABLES
--datosCliente VARCHAR2(200);
dan danio%rowtype;
BEGIN
SELECT * into dan
FROM Danio d
WHERE d.ID_DANIO=id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Cliente.'||SQLERRM);
RETURN dan;

END fBuscarDanio;

END pkDanio;
/



