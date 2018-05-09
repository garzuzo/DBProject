
CREATE OR REPLACE PACKAGE pkCliente AS
PROCEDURE insertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2);
PROCEDURE eliminar(cedula NUMBER);
PROCEDURE actualizarNombre(cedula NUMBER, nombre VARCHAR2);
PROCEDURE actualizarDireccion(cedula NUMBER, direccion VARCHAR2);
FUNCTION  buscarCliente(cedula NUMBER) RETURN cliente%rowtype;
END pkCliente;
/
CREATE OR REPLACE PACKAGE BODY pkCliente AS

PROCEDURE insertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2) IS
BEGIN 
INSERT INTO Cliente VALUES(cedula, nombre, direccion);
--EXCEPTION
--WHEN OTHERS THEN
--    raise_application_error(-20000, 'Error insertando en tabla Cliente' || ERRMSG);
END insertar;

PROCEDURE eliminar(cedula NUMBER) IS
BEGIN
DELETE FROM Cliente c WHERE c.cedula = cedula;
END eliminar;

PROCEDURE actualizarNombre(cedula NUMBER, nombre VARCHAR2) IS
BEGIN
UPDATE Cliente c SET c.nombre = nombre WHERE c.cedula= cedula;
END actualizarNombre;

PROCEDURE actualizarDireccion(cedula NUMBER,direccion VARCHAR2) IS
BEGIN
UPDATE Cliente c SET c.direccion = direccion WHERE c.cedula=cedula;
END actualizarDireccion;



--TODO: fix rowtype
FUNCTION buscarCliente(cedula NUMBER) RETURN cliente%rowtype   IS
--DECLARACION VARIABLES
--datosCliente VARCHAR2(200);
cli cliente%rowtype;
BEGIN
SELECT * into cli
FROM Cliente c
WHERE c.cedula=cedula;

RETURN cli;

END buscarCliente;

END pkCliente;
/

EXECUTE pkCliente.insertar(1234, 'Sandra', 'aqui');

