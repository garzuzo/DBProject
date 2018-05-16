
CREATE OR REPLACE PACKAGE pkCliente AS
PROCEDURE pInsertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2);
PROCEDURE pEliminar(cedula NUMBER);
PROCEDURE pActualizarNombre(cedula NUMBER, nombre VARCHAR2);
PROCEDURE pActualizarDireccion(cedula NUMBER, direccion VARCHAR2);
FUNCTION  fBuscarCliente(cedula NUMBER) RETURN cliente%rowtype;
END pkCliente;
/
CREATE OR REPLACE PACKAGE BODY pkCliente AS

PROCEDURE pInsertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2) IS
BEGIN 
INSERT INTO Cliente VALUES(cedula, nombre, direccion);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END pInsertar;

PROCEDURE pEliminar(cedula NUMBER) IS
BEGIN
DELETE FROM Cliente c WHERE c.cedula = cedula;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Cliente.'||SQLCODE);
END pEliminar;

PROCEDURE pActualizarNombre(cedula NUMBER, nombre VARCHAR2) IS
BEGIN
UPDATE Cliente c SET c.nombre = nombre WHERE c.cedula= cedula;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar el nombre de un registro en la tabla Cliente.'||SQLCODE);
END pActualizarNombre;

PROCEDURE pActualizarDireccion(cedula NUMBER,direccion VARCHAR2) IS
BEGIN
UPDATE Cliente c SET c.direccion = direccion WHERE c.cedula=cedula;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar la dirección de un registro en la tabla Cliente.'||SQLCODE);
END pActualizarDireccion;

FUNCTION fBuscarCliente(cedula NUMBER) RETURN cliente%rowtype   IS
cli cliente%rowtype;
BEGIN
SELECT * into cli
FROM Cliente c
WHERE c.cedula=cedula;
RETURN cli;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Cliente.'||SQLERRM);

END fBuscarCliente;

END pkCliente;
/
