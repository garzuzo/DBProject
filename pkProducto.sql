--TODO
CREATE OR REPLACE PACKAGE pkProducto AS
PROCEDURE insertar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2);
PROCEDURE eliminar(id NUMBER);
PROCEDURE actualizarFechaInicio(id NUMBER, fecha_inicio DATE);
PROCEDURE actualizarFechaFin(id NUMBER, fecha_fin DATE);
PROCEDURE actualizarFechaRetiro(id NUMBER, fecha_retiro DATE);
PROCEDURE actualizarEstado(id NUMBER, estado_producto VARCHAR2);
FUNCTION  buscarProducto(id NUMBER) RETURN producto%rowtype;
END pkProducto;
/
CREATE OR REPLACE PACKAGE BODY pkProducto AS

PROCEDURE insertar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2) IS
BEGIN 
INSERT INTO Producto VALUES(id , fecha_inicio , fecha_retiro , estado_producto);
--EXCEPTION
--WHEN OTHERS THEN
--    raise_application_error(-20000, 'Error insertando en tabla Producto' || ERRMSG);
END insertar;

PROCEDURE eliminar(id NUMBER) IS
BEGIN
DELETE FROM Producto p WHERE p.id = id;
END eliminar;

PROCEDURE actualizarFechaInicio(id NUMBER, fecha_inicio DATE) IS
BEGIN
UPDATE Producto p SET p.id = id WHERE p.id= id;
END actualizarFechaInicio;




--TODO: fix rowtype
FUNCTION buscarProducto(id NUMBER) RETURN producto%rowtype   IS
--DECLARACION VARIABLES
--datosCliente VARCHAR2(200);
prod producto%rowtype;
BEGIN
SELECT * into prod
FROM Producto p
WHERE p.id=id;

RETURN prod;

END buscarProducto;

END pkProducto;
/

EXECUTE pkProducto.insertar();

