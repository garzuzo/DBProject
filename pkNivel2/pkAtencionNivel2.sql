--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkAtencionNivel2
AS -- spec
  PROCEDURE pSolicitudNuevoProducto(
      idSolicitud NUMBER);
  PROCEDURE pSolicitudRetiroProducto(
      idSolicitud NUMBER,
      observacion VARCHAR) ;
  PROCEDURE pSolicitudDanosReclamos(
      idSolicitud NUMBER,
      observacion VARCHAR,
      estado      VARCHAR);
END pkAtencionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAtencionNivel2
AS -- creacion cuerpo del paquete
  --Procedimiento para atender una solicitud de nuevo producto
PROCEDURE pSolicitudNuevoProducto(
    idSolicitud NUMBER)
IS
  fechaInicio DATE;
  solic SOLICITUD%rowtype;
BEGIN
--valida el parametro
  IF idSolicitud IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Ingrese un id  válido');
  END IF;
  
  --Obtiene la solicitud
  solic := PKSOLICITUD.FCONSULTARSOLICITUD(idSolicitud);
  
  --Actualiza el estado del producto a activo
  PKPRODUCTO.PACTUALIZARESTADO( solic.PRODUCTO_ID_PRODUCTO , 'ACTIVO');
  
  --setea la fecha inicio para el primer dia del mes siquiente al actual.
  fechaInicio := TO_DATE('''' || EXTRACT(YEAR, SYSDATE) || (EXTRACT(MONTH,
  SYSDATE))+1 || '1' || '''', 'yyyy/mm/dd');
  
  --Actualiza al fecha de inicio 
  PKPRODUCTO.PACTUALIZARFECHAINICIO( solic.PRODUCTO_ID_PRODUCTO , fechaInicio);
  
  --Actualiza el estado de la solicitud.
  PKSOLICITUD.PMODIFICARSOLICITUD(solic.ID, observacion, solic.FECHA_SOLICITUD,
  SYSDATE, 'ATENDIDA', solic.CLIENTE_CEDULA, solic.TIPOSOLICITUD_ID,
  solic.FUNCIONARIO_ID);
END pSolicitudNuevoProducto;
--Procedimiento para atender una solicitud de retiro
PROCEDURE pSolicitudRetiroProducto(
    idSolicitud NUMBER,
    observacion VARCHAR)
IS
  solic SOLICITUD%rowtype;
BEGIN
  IF idSolicitud IS NULL THEN
    RAISE_APPLICATION_ERROR (-20001, 'ingrese el id de la solicitud');
  END IF;
  IF observacion IS NULL THEN
    RAISE_APPLICATION_ERROR (-20001, 'ingrese observacion de la solicitud');
  END IF;
  
  --Obtiene la solicitud
  solic := PKSOLICITUD.FCONSULTARSOLICITUD(idSolicitud);
  
  --Actualiza el estado del producto a activo
  PKPRODUCTO.PACTUALIZARESTADO( solic.PRODUCTO_ID_PRODUCTO , 'INACTIVO');
  
  --Actualiza fecha de retiro de producto
  PKPRODUCTO.PACTUALIZARFECHARETIRO(solic.PRODUCTO_ID, SYSDATE);
  
  --Actualiza el estado de la solicitud.
  PKSOLICITUD.PMODIFICARSOLICITUD(solic.ID, observacion, solic.FECHA_SOLICITUD,
  SYSDATE, 'ATENDIDA', solic.CLIENTE_CEDULA, solic.TIPOSOLICITUD_ID,
  solic.FUNCIONARIO_ID);
  
  
END pSolicitudRetiroProducto;
--Procedimiento para atender danos y reclamos
PROCEDURE pSolicitudDanosReclamos(
    idSolicitud NUMBER,
    observacion VARCHAR,
    estado      VARCHAR)
IS
  solic SOLICITUD%rowtype;
BEGIN
  IF idSolicitud IS NULL THEN
    RAISE_APPLICATION_ERROR (-20001, 'ingrese el id de la solicitud');
  END IF;
  IF observacion IS NULL THEN
    RAISE_APPLICATION_ERROR (-20001, 'ingrese observacion de la solicitud');
  END IF;
  IF estado IS NULL THEN
    RAISE_APPLICATION_ERROR (-20001, 'ingrese un estado para la solicitud');
  END IF;
  --obtiene la solicitud
  solic := PKSOLICITUD.FCONSULTARSOLICITUD(idSolicitud);
  --Actualiza el estado de la solicitud.
  PKSOLICITUD.PMODIFICARSOLICITUD(solic.ID, observacion, solic.FECHA_SOLICITUD,
  SYSDATE, estado, solic.CLIENTE_CEDULA, solic.TIPOSOLICITUD_ID,
  solic.FUNCIONARIO_ID);
END pSolicitudDanosReclamos;
END pkAtencionNivel2;