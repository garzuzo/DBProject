--especificacion paquete segundo nivel

CREATE OR REPLACE PACKAGE pkRegistroNivel2 AS
PROCEDURE pRegistrarSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date,estado_atencion VARCHAR, cliente_cedula NUMBER);
PROCEDURE pSolicitudModificar(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date,estado_atencion VARCHAR, cliente_cedula NUMBER);
PROCEDURE pSolicitudDanio(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER,idDanio NUMBER,descripcion VARCHAR, idAnomalia NUMBER, nombreAnomalia VARCHAR);
PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER,idProducto NUMBER, observacion VARCHAR);
PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER,idProducto NUMBER, observacion VARCHAR);

FUNCTION clienteExiste(cliente_cedula NUMBER) RETURN BOOLEAN;

END pkRegistroNivel2;
/
--cuerpo paquete segundo nivel
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel2 AS


--registrar solicitud de creacion
PROCEDURE pRegistrarSolicitudCreacion(tipo_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date,estado_atencion VARCHAR, cliente_cedula NUMBER) IS
rcCliente Cliente%rowtype;
numProductos NUMBER;
numActual NUMBER;

BEGIN 
--rcCliente := pkCliente.fConsultar(cliente_cedula);
--se verifica que el cliente existe
IF(clienteExiste(cliente_cedula)) THEN
SELECT count(*) into numProductos
FROM Producto;
--(numProductos, fecha_inicio DATE, fecha_retiro DATE, estado_producto VARCHAR2,cedula_cliente NUMBER, tipo_producto NUMBER
numActual:= numProductos+1;
--se crea un producto
pkProducto.pInsertar(numActual, fecha_solicitud, null, 'No registrado',cedula_cliente, tipo_producto);
--se crea la solicitud de creacion
pkSolicitud.pInsertarSolicitud(id_solicitud, Observacion, fecha_solicitud, null,estado_atencion, cliente_cedula,1,1, numActual);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creacion.'||SQLERRM);
END pRegistrarSolicitudCreacion;

FUNCTION clienteExiste(cliente_cedula NUMBER) RETURN BOOLEAN IS
rcCliente Cliente%rowtype;
resultado boolean;
BEGIN
resultado:=true;
rcCliente:= pkCliente.fConsultar(cliente_cedula);
EXCEPTION 
WHEN OTHERS THEN
resultado:= false;
RETURN resultado;
END clienteExiste;
--
PROCEDURE pSolicitudModificar(id_producto NUMBER, id_solicitud NUMBER, Observacion Varchar, fecha_solicitud Date,estado_atencion VARCHAR, cliente_cedula NUMBER) IS
rcCliente Cliente%rowtype;
rcProducto Producto%rowtype;

BEGIN
rcCliente := pkCliente.fConsultar(cliente_cedula);
rcProducto := pkProducto.fBuscarProducto(id_producto);
IF(rcCliente!=NULL AND rcProducto!=NULL) THEN
pkSolicitud.pInsertarSolicitud(id_solicitud, Observacion, fecha_solicitud, null,estado_atencion, cliente_cedula,2,1, id_producto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificacion de un producto.'||SQLERRM);
END pSolicitudModificar;

PROCEDURE pSolicitudDanio(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date,estado_atencion VARCHAR, cliente_cedula NUMBER,idDanio NUMBER,descripcion VARCHAR, idAnomalia NUMBER, nombreAnomalia VARCHAR) is

BEGIN 
--id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, fecha_atencion DATE,estado_atencion VARCHAR, cliente_cedula NUMBER
pkSolicitud.pInsertarSolicitud(id_solicitud, descripcion , fecha_solicitud, null ,estado_atencion , cliente_cedula ,3,1 , idProducto );
pkdanio.insertar(idDanio,descripcion, tipo);
pktipo_anomalia.insertar(nombreAnomalia);
END pSolicitudDanio;


PROCEDURE pSolicitudReclamo(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER,idProducto NUMBER, observacion VARCHAR) IS
BEGIN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion , fecha_solicitud, null ,estado_atencion , cliente_cedula ,4,1 , idProducto );

END pSolicitudReclamo;

PROCEDURE pSolicitudCancelacion(id_producto NUMBER, id_solicitud NUMBER,fecha_solicitud Date, estado_atencion VARCHAR, cliente_cedula NUMBER,idProducto NUMBER, observacion VARCHAR) IS
BEGIN
pkSolicitud.pInsertarSolicitud(id_solicitud, observacion , fecha_solicitud, null ,estado_atencion , cliente_cedula ,5,1 , idProducto );

END pSolicitudCancelacion;
END pkRegistroNivel2;
/