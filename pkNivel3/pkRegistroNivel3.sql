--especificacion paquete registro tercer nivel
CREATE OR REPLACE PACKAGE pkRegistroNivel3 AS
PROCEDURE pSolicitudCreacionN3(tipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER);
PROCEDURE pSolicitudModificarN3(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER);
END pkRegistroNivel3;
/
--cuerpo paquete tercer nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel3 AS
--registrar solicitud de creación. Los dos primeros parametros son para manejar las excepciones. 
PROCEDURE pSolicitudCreacionN3(code VARCHAR, msg VARCHAR, atipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN 
pkRegistroNivel2.pRegistroSolicitudCreacion(atipo_producto, id_solicitud, Observacion, fecha_solicitud, estado_atencion, cliente_cedula);
EXCEPTION
WHEN OTHERS THEN
code := SQLERRC || '.';
msg := ERRMSG || '.';
--RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creación.'||SQLERRM);
END pSolicitudCreacionN3;

--
PROCEDURE pSolicitudModificarN3(code VARCHAR, msg VARCHAR, id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
pkRegistroNivel2.pSolicitudModificar(id_producto, id_solicitud, Observacion, fecha_solicitud,estado_atencion, cliente_cedula);
EXCEPTION
WHEN OTHERS THEN
code := SQLERRC || '.';
msg := ERRMSG || '.';
--RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificación de un producto.'||SQLERRM);
END pSolicitudModificarN3;
END pkRegistroNivel3;