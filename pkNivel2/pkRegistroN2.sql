CREATE OR REPLACE PACKAGE pkRegistroN2 AS
PROCEDURE pSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

--PROCEDURE pSolicitudDanio();

FUNCTION clienteExiste(cliente_cedula NUMBER) RETURN BOOLEAN;
FUNCTION productoExiste(id_producto NUMBER) RETURN BOOLEAN;
END pkRegistroN2;
/
CREATE OR REPLACE PACKAGE BODY pkRegistroN2 AS

FUNCTION clienteExiste(cliente_cedula NUMBER) RETURN BOOLEAN IS
rcClienteE Cliente%rowtype;
resultado boolean;
BEGIN
resultado:= true;
rcClienteE := pkCliente.fConsultar(cliente_cedula);
EXCEPTION
WHEN OTHERS THEN
resultado:= false;
RETURN resultado;
END clienteExiste;

FUNCTION productoExiste(id_producto NUMBER) RETURN BOOLEAN IS
rcProductoE Producto%rowtype;
resultadoP boolean;
BEGIN
resultadoP:= true;
rcProductoE := pkProducto.fBuscarProducto(id_producto);
EXCEPTION 
WHEN OTHERS THEN
resultadoP:= false;
RETURN resultadoP;
END productoExiste;

PROCEDURE pSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN
IF clienteExiste(cliente_cedula)=TRUE THEN
pkProducto.pInsertar(id_solicitud,fecha_solicitud, null, 'No registrado', cliente_cedula, tipo_producto );
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 1, 1, id_solicitud);
END IF;
END pSolicitudCreacion;

PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN
IF productoExiste(id_producto) THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 3, 1, id_producto);
END IF;
END pSolicitudCancelacion;

PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN
IF productoExiste(id_producto) THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 3, 1, id_producto);
END IF;
END pSolicitudReclamo;

END pkRegistroN2;