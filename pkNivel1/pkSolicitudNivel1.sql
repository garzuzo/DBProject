Create or replace PACKAGE pkSolicitud  as

Procedure pInsertarSolicitud(id IN SOLICITUD.iD%type, Observacion IN SOLICITUD.observacion%type, fecha_solicitud IN SOLICITUD. fecha_solicitud%type,
fecha_atencion IN SOLICITUD.fecha_atencion);


Procedure pmodificarSolicitud(id IN SOLICITUD.iD%type, Observacion IN SOLICITUD.observacion%type, fecha_solicitud IN SOLICITUD. fecha_solicitud%type,
fecha_atencion IN SOLICITUD.fecha_atencion, estado IN SOLICITUD.estado%type);


FUNCTION fConsultarSolicitud(iId in SOLICITUD.id%type) RETURN SOLICITUD%rowtype ;
      

PROCEDURE pEliminarSolicitud (iId in SOLICITUD.id%type);


end pkSolicitud;





/** BODY---PACKAGE**/

Create or Replace package body  pkSolicitud as 


/*INSERTAR SOLICITUD*/
Procedure pInsertarSolicitud(id IN SOLICITUD.iD%type, Observacion IN SOLICITUD.observacion%type, fecha_solicitud IN SOLICITUD. fecha_solicitud%type,
fecha_atencion IN SOLICITUD.fecha_atencion, estado IN SOLICITUD.estado%type) is 
BEGIN 
INSERt INTO CONDUCTOR VALUES (id,Observacion,fecha_solicitud,fecha_atencion,estado);


        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLCODE||SQLERRM );

end pInsertarSolicitud;



/*ACTUALIZAR SOLICITUD*/
Procedure pmodificarSolicitud(Sid IN SOLICITUD.iD%type, SObservacion IN SOLICITUD.observacion%type, Sfecha_solicitud IN SOLICITUD.fecha_solicitud%type,
Sfecha_atencion IN SOLICITUD.fecha_atencion, Sestado IN SOLICITUD.estado%type) is 
BEGIN 

 UPDATE Solicitud
        
        SET 
        observacion = SObservacion,
        fecha_solicitud = TO_DATE(Sfecha_solicitud, 'YYYY-MM-DD'),
        fecha_atencion=TO_DATE(Sfecha_atencion, 'YYYY-MM-DD'),
        estado=Sestado
        where SID =id;
        

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLCODE||SQLERRM );
end pmodificarSolicitud;


/*ELIMINAR SOLICITUD*/

 PROCEDURE pEliminarSolicitud (iId in SOLICITUD.id%type) IS
    BEGIN
        DELETE FROM SOLCICITUD WHERE id = iId;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, No existe una solicitu con ese id.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.');
    END pEliminarSolicitud;




/** consultar Solicitud?*/

 FUNCTION fConsultarSolicitud(iId in SOLICITUD.id%type) RETURN SOLICITUD%rowtype IS
        rcsolicitud SOLICITUD%rowtype;
    BEGIN
        SELECT *  into rcsolicitud FROM SOLICITUD  WHERE id = iId;
        RETURN rcsolicitud;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, No existe una solicitud con este id.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.');
    END fConsultarSolicitud;

end pkSolicitud;




