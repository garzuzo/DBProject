CREATE OR REPLACE PACKAGE pkFuncionario AS
PROCEDURE insertar(id NUMBER, nombre VARCHAR2);
PROCEDURE eliminar(id NUMBER);
PROCEDURE actualizarNombre(id NUMBER, nombre VARCHAR2);
FUNCTION  buscarFuncionario(id NUMBER) RETURN funcionario%rowtype;
END pkFuncionario;

/
CREATE OR REPLACE PACKAGE BODY pkFuncionario AS

PROCEDURE insertar(id NUMBER, nombre VARCHAR2) IS
BEGIN 
INSERT INTO Funcionario VALUES(id, nombre);
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando un funcionario' ||SQLCODE);
END insertar;

PROCEDURE eliminar(id NUMBER) IS
BEGIN
DELETE FROM Funcionario fun WHERE fun.ID_FUNCIONARIO = id;
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error eliminando un funcionario' ||SQLCODE);
END eliminar;

PROCEDURE actualizarNombre(id NUMBER, nombre VARCHAR2) IS
BEGIN
UPDATE Funcionario fun SET fun.NOMBRE = nombre WHERE fun.ID_FUNCIONARIO = id;
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error actualizando el nombre de un funcionario' ||SQLCODE);
END actualizarNombre;

FUNCTION buscarFuncionario(id NUMBER) RETURN funcionario%rowtype IS
--DECLARACION VARIABLES
--datosFuncionario VARCHAR2(200);
func funcionario%rowtype;
BEGIN
SELECT * into func
FROM Funcionario fun
WHERE fun.ID_FUNCIONARIO=id;
RETURN func;

EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error buscando un funcionario' ||SQLCODE);

END buscarFuncionario;

END pkFuncionario;
/
