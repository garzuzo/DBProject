--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS -- spec
PROCEDURE pAsignarSolicitudaFuncionario;


END pkAsignacionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 AS -- body

--Procedimiento para asignar una solicitud a un funcionario
PROCEDURE pSolicitudNuevoProducto;





END pkAsignacionNivel2;

EXECUTE PKFUNCIONARIO.INSERTAR(5,'Antonia');