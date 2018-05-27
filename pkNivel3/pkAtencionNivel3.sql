--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel3 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar);
PROCEDURE pSolicitudRetiroProducto(idSolicitud NUMBER, observacion VARCHAR) ;
PROCEDURE pSolicitudDanosReclamos(idSolicitud NUMBER, observacion VARCHAR, estado VARCHAR);
PROCEDURE pProcesoProgramado;
END pkAtencionNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkAtencionNivel3 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idTSol NUMBER, nomTSol varchar) IS
BEGIN 
  --Esta chimbada hay que modificarla
  --PKATENCIONNIVEL2.PSOLICITUDNUEVOPRODUCTO();
  DUAL;
END pSolicitudNuevoProducto;

--Procedimiento para atender una solicitud de retiro 
PROCEDURE pSolicitudRetiroProducto(idSolicitud NUMBER, observacion VARCHAR) is
BEGIN
  PKATENCIONNIVEL2.PSOLICITUDRETIROPRODUCTO(idSolicitud, observacion);
END pSolicitudRetiroProducto;

--Procedimiento para atender danos y reclamos
PROCEDURE pSolicitudDanosReclamos(idSolicitud NUMBER, observacion VARCHAR, estado VARCHAR)is
BEGIN
  PKATENCIONNIVEL2.PSOLICITUDDANOSRECLAMOS(idSolicitud, observacion, estado);
END pSolicitudDanosReclamos;

PROCEDURE pProcesoProgramado is 

BEGIN
  --Itera sobre todas las solicitudes
  for i in ( SELECT * FROM SOLICITUD s ) loop
  
  --Cambiar el 20 por la tabla de parametros  
    IF (SYSDATE - i.FECHA_SOLICITUD) > 20 THEN
     PKSOLICITUD.PMODIFICARSOLICITUD(i.ID_SOLICITUD , i.OBSERVACION , i.FECHA_SOLICITUD , SYSDATE, 'ATENDIDA'
                                        ,i.CLIENTE , i.TIPO_SOLICITUD ,i.FUNCIONARIO );
    END IF;
  end loop;
END pProcesoProgramado;


END pkAtencionNivel3;