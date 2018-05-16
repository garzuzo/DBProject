
EXECUTE pkCliente.pInsertar(1234, 'Sandra', 'aqui');
BEGIN
DBMS_OUTPUT.PUT('nombre');
DBMS_OUTPUT.PUT_LINE('nombre');
END;

--CREATE TABLE Consola( salida VARCHAR2(2000));

CREATE OR REPLACE PACKAGE pkConsola AS
PROCEDURE imprimirConsola(salida varchar2);
end pkConsola;
/
CREATE OR REPLACE PACKAGE BODY pkConsola AS
PROCEDURE imprimirConsola(salida varchar2) IS
BEGIN
INSERT INTO Consola VALUES(salida);
END imprimirConsola;
END pkConsola;
/

SELECT *
FROM Cliente;

declare
rcCliente Cliente%rowtype;
begin 
rcCliente := pkCliente.fBuscarCliente(1234);
pkConsola.imprimirConsola(rcCliente.direccion );
pkConsola.imprimirConsola(rcCliente.nombre);
end;

select *
from Consola;
