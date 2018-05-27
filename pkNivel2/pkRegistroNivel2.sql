--especificación paquete segundo nivel

CREATE OR REPLACE PACKAGE pkRegistroNivel2 AS
PROCEDURE pRegistrarSolicitudCreacion(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER,tiposolicitud_id_tipo_s NUMBER,funcionario_id_funcionario NUMBER,producto_id_producto NUMBER);
PROCEDURE pSolicitudModificar(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER);
PROCEDURE pSolicitudDanio();
PROCEDURE pSolicitudReclamo();
PROCEDURE pSolicitudCancelacion();
END pkRegistroNivel2;

--cuerpo paquete segundo nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel2 AS
declare
rcCliente Cliente%rowtype;
numProductos NUMBER;
numActual NUMBER;

--registrar solicitud de creación
PROCEDURE pRegistrarSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN 
rcCliente := pkCliente.fBuscarCliente(cliente_cedula);
--se verifica que el cliente existe
IF(rcCliente!=NULL)
SELECT count(*) into numProductos
FROM Producto;
--(numProductos, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER
numActual:= numProductos+1;
--se crea un producto
pkProducto.pInsertar(numActual, fecha_solicitud DATE, null, 'No registrado',cedula_cliente NUMBER, tipo_producto NUMBER);
--se crea la solicitud de creacion
pkSolicitud.pInsertarSolicitud(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, null,estado_atencion VARCHAR, cliente_cedula NUMBER,1,1, numActual);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creación.'||SQLERRM);
END pRegistrarSolicitudCreacion;

--
PROCEDURE pSolicitudModificar(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
rcCliente := pkCliente.fBuscarCliente(cliente_cedula);
rcProducto := pkProducto.fBuscarProducto(id_producto);
IF(rcCliente!=NULL AND rcProducto!=NULL)
pkSolicitud.pInsertarSolicitud(id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date, null,estado_atencion VARCHAR, cliente_cedula NUMBER,2,1, id_producto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificación de un producto.'||SQLERRM);
END pSolicitudModificar;

PROCEDURE pSolicitudCancelacion() IS
BEGIN


END pSolicitudCancelacion;

PROCEDURE pSolicitudDanio()IS
BEGIN


END pSolicitudDanio;

PROCEDURE pSolicitudReclamo()IS
BEGIN

END pSolicitudReclamo;

END pkRegistroNivel2;