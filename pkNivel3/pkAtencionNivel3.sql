--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel3 AS -- spec
PROCEDURE pSolicitudNuevoProducto(idSolicitud NUMBER);
PROCEDURE pSolicitudRetiroProducto(idSolicitud NUMBER, observacion VARCHAR) ;
PROCEDURE pSolicitudDanosReclamos(idSolicitud NUMBER, observacion VARCHAR, estado VARCHAR);
PROCEDURE pProcesoProgramado;
END pkAtencionNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkAtencionNivel3 AS -- creacion cuerpo del paquete

--Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(idSolicitud NUMBER) IS
BEGIN 
  --llamada a metodo atencion nuevo producto
  PKATENCIONNIVEL2.PSOLICITUDNUEVOPRODUCTO(idSolicitud);
  
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
  --Itera sobre todas las solicitudes que sean de tipo solicitud
  for i in ( SELECT * FROM SOLICITUD s, TIPOSOLICITUD ts WHERE s.TIPOSOLICITUD_ID_TIPO_S = ts.ID_TIPO_S AND ts.NOMBRE='DANO' OR ts.NOMBRE='RECLAMO') loop
  
  --Cambiar el 20 por la tabla de parametros  
    IF (SYSDATE - i.FECHA_SOLICITUD) > 20 THEN
     PKSOLICITUD.PMODIFICARSOLICITUD(i.ID_SOLICITUD , i.OBSERVACION , i.FECHA_SOLICITUD , SYSDATE, 'ATENDIDA'
                                        ,i.CLIENTE_CEDULA , i.TIPOSOLICITUD_ID_TIPO_S ,i.FUNCIONARIO_ID_FUNCIONARIO );
    END IF;
  end loop;
END pProcesoProgramado;


END pkAtencionNivel3;