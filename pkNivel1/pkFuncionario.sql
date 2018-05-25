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
    raise_application_error(-20000, 'Error insertando en tabla Funcionario' ||SQLCODE);
END insertar;

PROCEDURE eliminar(id NUMBER) IS
BEGIN
DELETE FROM Funcionario fun WHERE fun.id = id;
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando en tabla Funcionario' ||SQLCODE);
END eliminar;

PROCEDURE actualizarNombre(id NUMBER, nombre VARCHAR2) IS
BEGIN
UPDATE Funcionario fun SET fun.nombre = nombre WHERE fun.id= id;
EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando en tabla Funcionario' ||SQLCODE);
END actualizarNombre;

FUNCTION buscarFuncionario(id NUMBER) RETURN funcionario%rowtype IS
--DECLARACION VARIABLES
--datosFuncionario VARCHAR2(200);
func funcionario%rowtype;
BEGIN
SELECT * into func
FROM Funcionario fun
WHERE fun.id=id;
RETURN func;

EXCEPTION
WHEN OTHERS THEN
    raise_application_error(-20000, 'Error insertando en tabla Funcionario' ||SQLCODE);

END buscarFuncionario;

END pkFuncionario;
/