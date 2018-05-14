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
END pInsertarTipoSolicitud;

--Metodo para consultar un tipo de solicitud existente en el sistema
FUNCTION fConsultarTipoSolicitud(idTSol NUMBER) return TIPOSOlICITUD%ROWTYPE is 
    tipoSol TIPOSOlICITUD%ROWTYPE;
BEGIN
    SELECT * INTO tipoSol FROM TIPOSOlICITUD ts WHERE ts.id = idTSol;
    return tipoSol;
END fConsultarTipoSolicitud;

--Metodo para modificar un tipo de solicitud existente en el sistema
PROCEDURE pModififcarTipoSolicitud(idTSol NUMBER, nomTSol varchar) is
BEGIN
    UPDATE TIPOSOlICITUD
    SET nombre = nomTSol
    WHERE id = idTSol;
END pModififcarTipoSolicitud;

--Metodo para eliminar un tipo de solicitud en el sistema
PROCEDURE pEliminarTipoSolicitud(idTSol NUMBER) is
BEGIN
    DELETE FROM TIPOSOlICITUD WHERE id=idTSol;
END pEliminarTipoSolicitud;
END pkTipoSolicitud;


--Prueba procedimientos
--execute PKTIPOSOLICITUD.PINSERTARTIPOSOLICITUD(12,'Daño')
--execute PKTIPOSOLICITUD.PMODIFIFCARTIPOSOLICITUD(12,'Arreglo')
--execute PKTIPOSOLICITUD.PELIMINARTIPOSOLICITUD(12)
