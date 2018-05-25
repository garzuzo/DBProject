--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel3 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);
PROCEDURE pProcesoProgramado;
END pkAtencionNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkAtencionNivel3 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);

--Procedimiento para atender una solicitud de retiro 
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;

--Procedimiento 
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);

PROCEDURE pProcesoProgramado;


END pkAtencionNivel3;