CREATE OR REPLACE PACKAGE pkProducto AS
PROCEDURE pInsertar(ID_PRODUCTO NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER);
PROCEDURE pBorrar(ID_PRODUCTO NUMBER);
PROCEDURE pModificar(ID_PRODUCTO NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER);
FUNCTION fConsultar(ID_PRODUCTO NUMBER) RETURN producto%rowtype;
END pkProducto;
/
create or replace PACKAGE BODY pkProducto AS

PROCEDURE pInsertar(ID_PRODUCTO NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER) IS
BEGIN 
INSERT INTO Producto VALUES(ID_PRODUCTO , fecha_inicio , fecha_retiro , estado_producto, cedula_cliente,tipo_producto);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Producto.'||SQLCODE);
END pInsertar;

PROCEDURE pBorrar(ID_PRODUCTO NUMBER) IS
BEGIN
DELETE FROM Producto pro WHERE pro.ID_PRODUCTO = ID_PRODUCTO;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Cliente'||SQLCODE);
END pBorrar;


PROCEDURE pModificar(ID_PRODUCTO NUMBER, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER) IS
BEGIN
UPDATE Producto pro SET pro.fecha_inicio = fecha_inicio, pro.fecha_retiro = fecha_retiro, pro.estado_producto= estado_producto, pro.cliente_cedula= cedula_cliente, pro.TIPO_PRODUCTO_ID_TIPO_PRODUCTO=tipo_producto WHERE pro.ID_PRODUCTO=ID_PRODUCTO;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar  un registro en la tabla Producto.'||SQLERRM);
END pModificar;



FUNCTION fConsultar(ID_PRODUCTO NUMBER) RETURN producto%rowtype   IS
prod producto%rowtype;
BEGIN
SELECT * into prod
FROM Producto p
WHERE p.ID_PRODUCTO=ID_PRODUCTO;

RETURN prod;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Producto.'||SQLCODE);
END fConsultar;

END pkProducto;
/
--EXECUTE pkProducto.pInsertar(1234 NUMBER, 10-03-15,  10-06-15, 'activo');

