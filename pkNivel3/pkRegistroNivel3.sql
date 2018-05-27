--especificacion paquete registro tercer nivel
CREATE OR REPLACE PACKAGE pkRegistroNivel3 AS
--SE AÑADIRAN 2 ATRIBUTOS 
--CODE CODIGO DE LA EXCEPCION
--MSG MENSAJE DE LA EXCEPCION
PROCEDURE pSolicitudCreacionN3(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudCancelacionN3(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudReclamoN3(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);
END pkRegistroNivel3;
/
--cuerpo paquete tercer nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel3 AS
--registrar solicitud de creación. Los dos primeros parametros son para manejar las excepciones. 
PROCEDURE pSolicitudCreacionN3(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudCreacion(tipo_producto, id_solicitud, observacion , fecha_solicitud , estado_atencion , cliente_cedula );
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creacion. '||SQLERRM);
END pSolicitudCreacionN3;

--
PROCEDURE pSolicitudCancelacionN3(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudCancelacion(id_producto, id_solicitud, observacion, fecha_solicitud, estado_atencion, cliente_cedula);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de cancelacion. '||SQLERRM);
END pSolicitudCancelacionN3;

PROCEDURE pSolicitudReclamoN3(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
pkRegistroN2.pSolicitudReclamo(id_producto, id_solicitud, observacion, fecha_solicitud, estado_atencion, cliente_cedula);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de reclamo. '|| SQLERRM);
END pSolicitudReclamoN3;

END pkRegistroNivel3;