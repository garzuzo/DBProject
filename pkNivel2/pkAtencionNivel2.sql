--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel2 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);
PROCEDURE pSolicitudRetiroProducto(idSolicitud NUMBER, observacion VARCHAR) ;
PROCEDURE pSolicitudDanosReclamos(idSolicitud NUMBER, observacion VARCHAR, estado VARCHAR);
END pkAtencionNivel2;
/

CREATE OR REPLACE PACKAGE BODY pkAtencionNivel2 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);

--Procedimiento para atender una solicitud de retiro 
PROCEDURE pSolicitudRetiroProducto( idSolicitud NUMBER, observacion VARCHAR ) IS
solic SOLICITUD%rowtype;
BEGIN
         
        IF idSolicitud IS NULL THEN
        RAISE_APPLICATION_ERROR (-20001, 'ingrese el id de la solicitud');
        
        IF observacion IS NULL THEN
        RAISE_APPLICATION_ERROR (-20001, 'ingrese observacion de la solicitud');
        
        solic := PKSOLICITUD.FCONSULTARSOLICITUD(idSolicitud);
        
        --Actualiza fecha de retiro de producto
        PKPRODUCTO.PACTUALIZARFECHARETIRO(solic.PRODUCTO_ID, SYSDATE);
        
        --Actualiza el estado de la solicitud.
        PKSOLICITUD.PMODIFICARSOLICITUD(solic.ID, observacion, solic.FECHA_SOLICITUD, SYSDATE, 
                                'ATENDIDA', solic.CLIENTE_CEDULA, solic.TIPOSOLICITUD_ID, solic.FUNCIONARIO_ID);     
    
END pSolicitudRetiroProducto;


--Procedimiento para atender danos y reclamos
PROCEDURE pSolicitudDanosReclamos(idSolicitud NUMBER, observacion VARCHAR, estado VARCHAR) IS
solic SOLICITUD%rowtype;
BEGIN
         
        IF idSolicitud IS NULL THEN
        RAISE_APPLICATION_ERROR (-20001, 'ingrese el id de la solicitud');
        
        IF observacion IS NULL THEN
        RAISE_APPLICATION_ERROR (-20001, 'ingrese observacion de la solicitud');
        
        IF estado IS NULL THEN
        RAISE_APPLICATION_ERROR (-20001, 'ingrese un estado para la solicitud');
        
        --obtiene la solicitud
        solic := PKSOLICITUD.FCONSULTARSOLICITUD(idSolicitud);        
            
        --Actualiza el estado de la solicitud.
        PKSOLICITUD.PMODIFICARSOLICITUD(solic.ID, observacion, solic.FECHA_SOLICITUD, SYSDATE, 
                                estado, solic.CLIENTE_CEDULA, solic.TIPOSOLICITUD_ID, solic.FUNCIONARIO_ID);
        
END pSolicitudDanosReclamos;


END pkAtencionNivel2;