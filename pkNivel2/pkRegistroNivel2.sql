--especificación paquete segundo nivel

CREATE OR REPLACE PACKAGE pkRegistroNivel2 AS
PROCEDURE registrarSolicitudCreacion(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER,tiposolicitud_id_tipo_s NUMBER,funcionario_id_funcionario NUMBER,producto_id_producto NUMBER);
PROCEDURE solicitudModificar();
PROCEDURE solicitudDanio();
PROCEDURE solicitudReclamo();
PROCEDURE solicitudCancelacion();
END pkRegistroNivel2;

--cuerpo paquete segundo nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel2 AS
declare
rcCliente Cliente%rowtype;
PROCEDURE registrarSolicitudCreacion(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER,tiposolicitud_id_tipo_s NUMBER,funcionario_id_funcionario NUMBER,producto_id_producto NUMBER) IS

BEGIN 
rcCliente := pkCliente.fBuscarCliente(cliente_cedula);

IF(rcCliente!=NULL)
PKPRODUCTO.pInsertar();


END registrarSolicitudCreacion;



PROCEDURE solicitudModificar() IS
BEGIN

END solicitudModificar;



PROCEDURE solicitudDanio()IS
BEGIN


END solicitudDanio;



PROCEDURE solicitudReclamo()IS
BEGIN


END solicitudReclamo;

PROCEDURE solicitudCancelacion() IS
BEGIN


END solicitudCancelacion;



END pkRegistroNivel2;