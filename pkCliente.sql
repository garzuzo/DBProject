--creo que esto va a parte, la creacion y eliminacion de la tabla
--no se si va aqui en este package como tal
DROP TABLE Cliente CASCADE constraints;
CREATE TABLE Cliente (
	cedula NUMBER(10),
	nombre VARCHAR2(50),
    direccion  VARCHAR2(100),
	PRIMARY KEY(cedula)
);

CREATE OR REPLACE PACKAGE pkCliente IS
PROCEDURE insertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2);
PROCEDURE eliminar(cedula NUMBER);
PROCEDURE actualizarNombre(cedula NUMBER, nombre VARCHAR2);
PROCEDURE actualizarDireccion(cedula NUMBER, direccion VARCHAR2);
FUNCTION  buscarCliente(cedula NUMBER) RETURN TABLE;
END pkCliente;

CREATE OR REPLACE PACKAGE BODY pkCliente IS

PROCEDURE insertar(cedula NUMBER, nombre VARCHAR2, direccion VARCHAR2) IS
BEGIN 
INSERT INTO Cliente VALUES(cedula, nombre, direccion);
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando en tabla Cliente' || ERRMSG);
END insertar;

PROCEDURE eliminar(ced NUMBER) IS
BEGIN
DELETE FROM Cliente WHERE cedula = ced;
END eliminar;

PROCEDURE actualizarNombre(ced NUMBER, nom VARCHAR2) IS
BEGIN
UPDATE Cliente SET nombre = nom WHERE cedula= ced;
END actualizarNombre;

PROCEDURE actualizarDireccion(ced NUMBER,dir VARCHAR2) IS
BEGIN
UPDATE Cliente SET direccion = dir WHERE cedula=ced;
END actualizarDireccion;

FUNCTION buscarCliente(ced NUMBER) RETURN TABLE IS
--DECLARACION VARIABLES
--datosCliente VARCHAR2(200);
BEGIN
SELECT *
FROM Cliente
WHERE cedula=ced;
END buscarCliente;

END pkCliente;

EXECUTE pkCliente.insertar(1234, 'Sandra', 'aqui');
