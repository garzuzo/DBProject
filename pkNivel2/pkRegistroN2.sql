CREATE OR REPLACE PACKAGE pkRegistroN2 AS
PROCEDURE pSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudDanio(id_producto NUMBER,id_danio NUMBER,id_anomalia NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);

PROCEDURE pSolicitudModificacion(id_producto NUMBER,id_tipo_producto_nuevo NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_inicio DATE,fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER);
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
rcProductoE := pkProducto.fConsultar(id_producto);
EXCEPTION 
WHEN OTHERS THEN
resultadoP:= false;
RETURN resultadoP;
END productoExiste;

PROCEDURE pSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
rcClienteP Cliente%rowtype;
BEGIN
--IF clienteExiste(cliente_cedula)=TRUE THEN
rcClienteP := pkCliente.fConsultar(cliente_cedula);
pkProducto.pInsertar(id_solicitud,fecha_solicitud, null, 'No registrado', cliente_cedula, tipo_producto );
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 1, 1, id_solicitud);
--END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creacion. '||SQLERRM);
END pSolicitudCreacion;

PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
IF productoExiste(id_producto)=TRUE AND clienteExiste(cliente_cedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 3, 1, id_producto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de cancelacion. '||SQLERRM);
END pSolicitudCancelacion;


PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
IF productoExiste(id_producto)=TRUE AND clienteExiste(cliente_cedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula, 5, 1, id_producto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de reclamo. '||SQLERRM);
END pSolicitudReclamo;


PROCEDURE pSolicitudDanio(id_producto NUMBER,id_danio NUMBER,id_anomalia NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS
BEGIN
IF productoExiste(id_producto)=TRUE  AND clienteExiste(cliente_cedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,null, estado_atencion, cliente_cedula,4, 1, id_producto);
pkDanio.pInsertar(id_danio , observacion, id_anomalia,id_solicitud);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de danio. '||SQLERRM);
END pSolicitudDanio;


PROCEDURE pSolicitudModificacion(id_producto NUMBER,id_tipo_producto_nuevo NUMBER, id_solicitud NUMBER, observacion VARCHAR, fecha_inicio DATE,fecha_solicitud DATE, estado_atencion VARCHAR, cliente_cedula NUMBER) IS

BEGIN
IF productoExiste(id_producto)=TRUE AND clienteExiste(cliente_cedula)=TRUE THEN
--idSOL NUMBER, Observacion Varchar, fecha_solicitud Date,fecha_atencion DATE,estado VARCHAR, cliente NUMBER,tipo_solicitud NUMBER, funcionario NUMBER,idProducto NUMBER
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion, fecha_solicitud,fecha_inicio, estado_atencion, cliente_cedula,2, 1, id_producto);
pkProducto.pModificar(ID_PRODUCTO , fecha_inicio , null, 'Registrado',cliente_cedula, id_tipo_producto_nuevo );
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificacion. '||SQLERRM);
END pSolicitudModificacion;

END pkRegistroN2;