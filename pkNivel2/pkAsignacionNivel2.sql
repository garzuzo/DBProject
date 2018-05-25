--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);

END pkAsignacionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);

--Procedimiento para atender una solicitud de retiro 
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;

--Procedimiento 
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);

PROCEDURE pAsignarSolicitudAFuncionario(id solicitud);

----Encontrar el funcionario disponible para asignarlo a una solicitud

FUNCTION funcionariosDisponibles RETURN FUNCIONARIO.id IS
         idFuncionario number;
    BEGIN
          SELECT * into idFuncionario FROM FUNCIONARIO fun, SOLICITUD sol WHERE fun.id=sol.funcionarioId AND rownum<3;
          RETURN idFuncionario;
            
    
END funcionariosDisponibles;


END pkAsignacionNivel2;