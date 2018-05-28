--especificacion paquete registro tercer nivel
CREATE OR REPLACE PACKAGE pkRegistroNivel3 AS
--SE ANADIRAN 2 ATRIBUTOS 
--CODE CODIGO DE LA EXCEPCION
--MSG MENSAJE DE LA EXCEPCION
PROCEDURE pSolicitudCreacionN3(tipoproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudCancelacionN3(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudReclamoN3(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudDanioN3(idproducto NUMBER,iddanio NUMBER,idanomalia NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudModificacionN3(idproducto NUMBER,id_tipo_producto_nuevo NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechainicio DATE,fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);


END pkRegistroNivel3;
/
--cuerpo paquete tercer nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel3 AS
--registrar solicitud de creacion. Los dos primeros parametros son para manejar las excepciones. 
PROCEDURE pSolicitudCreacionN3(tipoproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudCreacion(tipoproducto, idsolicitud, observacion , fechasolicitud , estadoatencion , clientecedula );
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creacion. '||SQLERRM);
END pSolicitudCreacionN3;

--
PROCEDURE pSolicitudCancelacionN3(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudCancelacion(idproducto, idsolicitud, observacion, fechasolicitud, estadoatencion, clientecedula);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de cancelacion. '||SQLERRM);
END pSolicitudCancelacionN3;

PROCEDURE pSolicitudReclamoN3(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudReclamo(idproducto, idsolicitud, observacion, fechasolicitud, estadoatencion, clientecedula);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de reclamo. '|| SQLERRM);
END pSolicitudReclamoN3;

PROCEDURE pSolicitudDanioN3(idproducto NUMBER,iddanio NUMBER,idanomalia NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudDanio(id_producto ,id_danio ,id_anomalia , id_solicitud , observacion , fecha_solicitud , estado_atencion , cliente_cedula );
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de dano. '|| SQLERRM);
END pSolicitudDanioN3;

PROCEDURE pSolicitudModificacionN3(idproducto NUMBER,id_tipo_producto_nuevo NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechainicio DATE,fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudModificacion(idproducto ,id_tipo_producto_nuevo , idsolicitud , observacion , fechainicio ,fechasolicitud , estadoatencion , clientecedula );
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificacion. '|| SQLERRM);
END pSolicitudModificacionN3;

END pkRegistroNivel3;