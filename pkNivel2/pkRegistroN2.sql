CREATE OR REPLACE PACKAGE pkRegistroN2 AS
PROCEDURE pSolicitudCreacion(tipoproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudCancelacion(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudReclamo(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudDanio(idproducto NUMBER,iddanio NUMBER,idanomalia NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);

PROCEDURE pSolicitudModificacion(idproducto NUMBER,id_tipo_producto_nuevo NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechainicio DATE,fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER);
FUNCTION clienteExiste(clientecedula NUMBER) RETURN BOOLEAN;
FUNCTION productoExiste(idproducto NUMBER) RETURN BOOLEAN;
END pkRegistroN2;
/
CREATE OR REPLACE PACKAGE BODY pkRegistroN2 AS

FUNCTION clienteExiste(clientecedula NUMBER) RETURN BOOLEAN IS
rcClienteE Cliente%rowtype;
BEGIN
rcClienteE := pkCliente.fConsultar(clientecedula);
RETURN TRUE;
EXCEPTION
WHEN OTHERS THEN
RETURN FALSE;
END clienteExiste;

FUNCTION productoExiste(idproducto NUMBER) RETURN BOOLEAN IS
rcProductoE Producto%rowtype;
BEGIN
rcProductoE := pkProducto.fConsultar(idproducto);
RETURN TRUE;
EXCEPTION 
WHEN OTHERS THEN
RETURN FALSE;
END productoExiste;

PROCEDURE pSolicitudCreacion(tipoproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS

BEGIN
IF clienteExiste(clientecedula)=TRUE THEN
pkProducto.pInsertar(idsolicitud,fechasolicitud, null, 'No registrado', clientecedula, tipoproducto );
pkSolicitud.pInsertarSolicitud(idsolicitud, observacion, fechasolicitud,null, estadoatencion, clientecedula, 1, 1, idsolicitud);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de creacion. '||SQLERRM);
END pSolicitudCreacion;


PROCEDURE pSolicitudCancelacion(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
IF productoExiste(idproducto)=TRUE AND clienteExiste(clientecedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(idsolicitud, observacion, fechasolicitud,null, estadoatencion, clientecedula, 3, 1, idproducto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de cancelacion. '||SQLERRM);
END pSolicitudCancelacion;


PROCEDURE pSolicitudReclamo(idproducto NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
IF productoExiste(idproducto)=TRUE AND clienteExiste(clientecedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(idsolicitud, observacion, fechasolicitud,null, estadoatencion, clientecedula, 5, 1, idproducto);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de reclamo. '||SQLERRM);
END pSolicitudReclamo;


PROCEDURE pSolicitudDanio(idproducto NUMBER,iddanio NUMBER,idanomalia NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS
BEGIN
IF productoExiste(idproducto)=TRUE  AND clienteExiste(clientecedula)=TRUE THEN
pkSolicitud.pInsertarSolicitud(idsolicitud, observacion, fechasolicitud,null, estadoatencion, clientecedula,4, 1, idproducto);
pkDanio.pInsertar(iddanio , observacion, idanomalia,idsolicitud);
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de danio. '||SQLERRM);
END pSolicitudDanio;


PROCEDURE pSolicitudModificacion(idproducto NUMBER,id_tipo_producto_nuevo NUMBER, idsolicitud NUMBER, observacion VARCHAR, fechainicio DATE,fechasolicitud DATE, estadoatencion VARCHAR, clientecedula NUMBER) IS

BEGIN
IF productoExiste(idproducto)=TRUE AND clienteExiste(clientecedula)=TRUE THEN

pkSolicitud.pInsertarSolicitud(idsolicitud, observacion, fechasolicitud,fechainicio, estadoatencion, clientecedula,2, 1, idproducto);
pkProducto.pModificar(idproducto , fechainicio , null, 'Registrado',clientecedula, id_tipo_producto_nuevo );
END IF;
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20000,'Error al registrar una solicitud de modificacion. '||SQLERRM);
END pSolicitudModificacion;

END pkRegistroN2;