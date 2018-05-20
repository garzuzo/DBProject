--Especificación del paquete Cliente con
--sus respectivos procedimientos y funciones.
CREATE OR REPLACE PACKAGE pkCliente AS
PROCEDURE pInsertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2, fechaNacimiento DATE, telefono NUMBER);
PROCEDURE pBorrar(cedula NUMBER);
PROCEDURE pModificar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2, fechaNacimiento DATE, telefono NUMBER);
FUNCTION  fConsultar(cedula NUMBER) RETURN cliente%rowtype;
END pkCliente;
/
--Cuerpo del paquete Cliente con la 
--implementacion de cada procedimiento y funcion.
CREATE OR REPLACE PACKAGE BODY pkCliente AS

PROCEDURE pInsertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2, fechaNacimiento DATE, telefono NUMBER) IS
BEGIN 
INSERT INTO Cliente VALUES(cedula, nombre, direccion, fechaNacimiento, telefono);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END pInsertar;

PROCEDURE pBorrar(cedula NUMBER) IS
BEGIN
DELETE FROM Cliente c WHERE c.cedula = cedula;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al eliminar en la tabla Cliente.'||SQLCODE);
END pBorrar;

PROCEDURE pModificar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2, fechaNacimiento DATE, telefono NUMBER) IS
BEGIN
UPDATE Cliente c SET c.nombre = nombre, c.direccion = direccion, c.fechaNacimiento= fechaNacimiento, c.telefono= telefono WHERE c.cedula= cedula;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al actualizar el nombre de un registro en la tabla Cliente.'||SQLCODE);
END pModificar;

FUNCTION fConsultar(cedula NUMBER) RETURN cliente%rowtype   IS
cli cliente%rowtype;
BEGIN
SELECT * into cli
FROM Cliente c
WHERE c.cedula=cedula;
RETURN cli;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al consultar un registro en la tabla Cliente.'||SQLERRM);

END fConsultar;

END pkCliente;
/
