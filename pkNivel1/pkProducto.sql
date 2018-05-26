CREATE OR REPLACE PACKAGE pkProducto AS
PROCEDURE pInsertar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER);
PROCEDURE pEliminar(id NUMBER);
PROCEDURE pActualizarFechaInicio(id NUMBER, fecha_inicio DATE);
PROCEDURE pActualizarFechaRetiro(id NUMBER, fecha_retiro DATE);
PROCEDURE pActualizarEstado(id NUMBER, estado_producto VARCHAR2);
FUNCTION  fBuscarProducto(id NUMBER) RETURN producto%rowtype;
END pkProducto;
/
create or replace PACKAGE BODY pkProducto AS

PROCEDURE pInsertar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER) IS
BEGIN 
INSERT INTO Producto VALUES(id , fecha_inicio , fecha_retiro , estado_producto, cedula_cliente,tipo_producto);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Producto.'||SQLCODE);
END pInsertar;

PROCEDURE pEliminar(id NUMBER) IS
BEGIN
DELETE FROM Producto p WHERE p.ID_PRODUCTO = id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Producto.'||SQLCODE);
END pEliminar;

PROCEDURE pActualizarFechaInicio(id NUMBER, fecha_inicio DATE) IS
BEGIN
UPDATE Producto p SET p.fecha_inicio= fecha_inicio WHERE p.ID_PRODUCTO= id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar la fecha de inicio de un registro en la tabla producto .'||SQLCODE);
END pActualizarFechaInicio;


PROCEDURE pActualizarFechaRetiro(id NUMBER, fecha_retiro DATE) IS
BEGIN
UPDATE Producto p SET p.fecha_retiro =  fecha_retiro  WHERE p.ID_PRODUCTO= id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar la fecha de inicio de un registro en la tabla producto .'||SQLCODE);
END pActualizarFechaRetiro;
                        
PROCEDURE pActualizarEstado(id NUMBER, estado_producto VARCHAR2) IS
BEGIN
UPDATE Producto p SET p.estado_producto= estado_producto WHERE p.ID_PRODUCTO= id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar el estado de un registro en la tabla producto .'||SQLCODE);
END pActualizarEstado;

FUNCTION  fBuscarProducto(id NUMBER) RETURN producto%rowtype   IS
prod producto%rowtype;
BEGIN
SELECT * into prod
FROM Producto p
WHERE p.ID_PRODUCTO=id;

RETURN prod;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Producto.'||SQLCODE);
END fBuscarProducto;

END pkProducto;

--EXECUTE pkProducto.pInsertar(1234 NUMBER, 10-03-15,  10-06-15, 'activo');

