CREATE OR REPLACE PACKAGE pkProducto AS
PROCEDURE pInsertar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER);
PROCEDURE pEliminar(id NUMBER);
PROCEDURE pModificar(id NUMBER, fecha_inicio DATE);
FUNCTION  fConsultar(id NUMBER) RETURN producto%rowtype;
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


PROCEDURE pModificar(id NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER) IS
BEGIN
UPDATE Producto c SET c.fecha_inicio = fecha_inicio, c.fecha_retiro = fecha_retiro, c.estado_producto= estado_producto, c.cedula_cliente= cedula_cliente, c.tipo_producto=tipo_producto WHERE c.ID_PRODUCTO=id;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar  un registro en la tabla Producto.'||SQLERRM);
END pModificar;


FUNCTION  fConsultar(id NUMBER) RETURN producto%rowtype   IS
prod producto%rowtype;
BEGIN
SELECT * into prod
FROM Producto p
WHERE p.ID_PRODUCTO=id;

RETURN prod;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Producto.'||SQLCODE);
END fConsultar;

END pkProducto;

--EXECUTE pkProducto.pInsertar(1234 NUMBER, 10-03-15,  10-06-15, 'activo');

