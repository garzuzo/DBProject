--especificaci�n paquete segundo nivel

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
numProductos NUMBER;
numActual NUMBER;
--registra solicitud de creaci�n
--se verifica que el cliente existe. Se crea un producto "falso". Se crea la solicitud. 
PROCEDURE registrarSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN 
rcCliente := pkCliente.fBuscarCliente(cliente_cedula);

IF(rcCliente!=NULL)
SELECT count(*) into numProductos
FROM Producto;
--(numProductos, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER
numActual:= numProductos+1;
pkProducto.pInsertar(numActual, fecha_solicitud DATE, null, 'no registrado',cedula_cliente NUMBER, tipo_producto NUMBER);
pkSolicitud.pInsertarSolicitud(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER,1,1, numActual);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creaci�n.'||SQLERRM);
END registrarSolicitudCreacion;

--
PROCEDURE solicitudModificar(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
rcCliente := pkCliente.fBuscarCliente(cliente_cedula);
rcProducto := pkProducto.fBuscarProducto(id_producto);
IF(rcCliente!=NULL AND rcProducto!=NULL)
pkSolicitud.pInsertarSolicitud(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER,2,1, id_producto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificaci�n de un producto.'||SQLERRM);
END solicitudModificar;

PROCEDURE solicitudCancelacion() IS
BEGIN


END solicitudCancelacion;

PROCEDURE solicitudDanio()IS
BEGIN


END solicitudDanio;

PROCEDURE solicitudReclamo()IS
BEGIN

END solicitudReclamo;

END pkRegistroNivel2;