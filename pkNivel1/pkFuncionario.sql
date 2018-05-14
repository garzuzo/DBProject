CREATE OR REPLACE PACKAGE pkFuncionario IS
PROCEDURE insertar(id NUMBER, nombre VARCHAR2);
PROCEDURE eliminar(id NUMBER);
PROCEDURE actualizarNombre(id NUMBER, nombre VARCHAR2);
FUNCTION  buscarFuncionario(id NUMBER) RETURN TABLE;
END pkFuncionario;

CREATE OR REPLACE PACKAGE BODY pkFuncionario IS

PROCEDURE insertar(id NUMBER, nombre VARCHAR2) IS
BEGIN 
INSERT INTO funcionario VALUES(id, nombre);
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando en tabla Cliente' || ERRMSG);
END insertar;

PROCEDURE eliminar(Sid NUMBER) IS
BEGIN
DELETE FROM funcionario WHERE id = Sid;
END eliminar;

PROCEDURE actualizarNombre(Sid NUMBER, nom VARCHAR2) IS
BEGIN
UPDATE funcionario SET nombre = nom WHERE id= Sid;
END actualizarNombre;

FUNCTION buscarFuncionario(Sid NUMBER) RETURN TABLE IS
--DECLARACION VARIABLES
--datosFuncionario VARCHAR2(200);
BEGIN
SELECT *
FROM funcionario
WHERE id=Sid;
END buscarFuncionario;

END pkFuncionario;

EXECUTE pkFuncionario.insertar(1234, 'Ronaldo');