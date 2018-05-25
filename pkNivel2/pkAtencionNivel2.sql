--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel2 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);

END pkAtencionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAtencionNivel2 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);

--Procedimiento para atender una solicitud de retiro 
PROCEDURE pSolicitudRetiroProducto(idTSol NUMBER) ;

--Procedimiento 
PROCEDURE pSolicitudDanosReclamos(idTSol NUMBER, nomTSol varchar);


END pkAtencionNivel2;