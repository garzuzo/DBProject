--Creacion de especificacion del paquete
CREATE OR REPLACE PACKAGE pkTipoSolicitud AS -- spec
PROCEDURE pInsertarTipoSolicitud(idTSol NUMBER, nomTSol varchar);
FUNCTION fConsultarTipoSolicitud(idTSol NUMBER) return TIPOSOlICITUD%ROWTYPE;
PROCEDURE pModififcarTipoSolicitud(idTSol NUMBER, nomTSol varchar);
PROCEDURE pEliminarTipoSolicitud(idTSol NUMBER);
END pkTipoSolicitud;
/
CREATE OR REPLACE PACKAGE BODY pkTipoSolicitud AS -- creacion cuerpo del paquete

--Metodo para crear un tipo de solicitud al sistema
PROCEDURE pInsertarTipoSolicitud(idTSol NUMBER, nomTSol varchar) is
BEGIN
    INSERT INTO TIPOSOlICITUD (id, nombre) VALUES (idTSol, nomTSol);

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
    END pEliminarTipoProducto;
END pInsertarTipoSolicitud;

--Metodo para consultar un tipo de solicitud existente en el sistema
FUNCTION fConsultarTipoSolicitud(idTSol NUMBER) return TIPOSOlICITUD%ROWTYPE is 
    tipoSol TIPOSOlICITUD%ROWTYPE;
BEGIN
    SELECT * INTO tipoSol FROM TIPOSOlICITUD ts WHERE ts.id = idTSol;
    return tipoSol;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
    END pEliminarTipoProducto;
END fConsultarTipoSolicitud;

--Metodo para modificar un tipo de solicitud existente en el sistema
PROCEDURE pModififcarTipoSolicitud(idTSol NUMBER, nomTSol varchar) is
BEGIN
    UPDATE TIPOSOlICITUD
    SET nombre = nomTSol
    WHERE id = idTSol;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
    END pEliminarTipoProducto;
END pModififcarTipoSolicitud;

--Metodo para eliminar un tipo de solicitud en el sistema
PROCEDURE pEliminarTipoSolicitud(idTSol NUMBER) is
BEGIN
    DELETE FROM TIPOSOlICITUD WHERE id=idTSol;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
    END pEliminarTipoProducto;
END pEliminarTipoSolicitud;
END pkTipoSolicitud;


--Prueba procedimientos
--execute PKTIPOSOLICITUD.PINSERTARTIPOSOLICITUD(12,'Da�o')
--execute PKTIPOSOLICITUD.PMODIFIFCARTIPOSOLICITUD(12,'Arreglo')
--execute PKTIPOSOLICITUD.PELIMINARTIPOSOLICITUD(12)
