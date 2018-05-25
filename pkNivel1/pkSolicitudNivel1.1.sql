Create or replace PACKAGE pkSolicitud  as

Procedure pInsertarSolicitud(id NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado VARCHAR, cliente NUMBER,tipo_solicitud NUMBER,funcionario NUMBER, idProducto NUMBER);

Procedure pmodificarSolicitud(id NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado VARCHAR, cliente NUMBER,tipo_solicitud NUMBER,funcionario NUMBER);

Procedure pEliminarSolicitud (id NUMBER);

FUNCTION fConsultarSolicitud(id NUMBER) RETURN SOLICITUD%rowtype;

end pkSolicitud;

/

--- BODY PACKAGE

Create or Replace package body  pkSolicitud as 


---INSERTAR SOLICITUD
Procedure pInsertarSolicitud(id NUMBER, Observacion Varchar, fecha_solicitud Date,fecha_atencion DATE,estado VARCHAR, cliente NUMBER,tipo_solicitud NUMBER, funcionario NUMBER,idProducto NUMBER) is 
BEGIN 
INSERT INTO SOLICITUD VALUES (id,Observacion,fecha_solicitud,fecha_atencion,estado,cliente,tipo_solicitud,funcionario,idProducto);


        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLCODE||SQLERRM );

end pInsertarSolicitud;


----modificar solictud

Procedure pmodificarSolicitud(id NUMBER, Observacion Varchar, fecha_solicitud Date, fecha_atencion DATE,estado VARCHAR, cliente NUMBER,tipo_solicitud NUMBER,funcionario NUMBER) is 
BEGIN 

 UPDATE SOLICITUD s
        
        SET 
        s.OBSERVACION = Observacion,
        s.FECHA_SOLICITUD = TO_DATE(fecha_solicitud, 'YYYY-MM-DD'),
        s.FECHA_ATENCION=TO_DATE(fecha_atencion, 'YYYY-MM-DD'),
        s.ESTADO_ATENCION=estado
        
        where s.ID=id;
        

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLCODE||SQLERRM );
end pmodificarSolicitud;

--Elimiar solicitud
Procedure pEliminarSolicitud (id NUMBER) IS
    BEGIN
        DELETE FROM SOLICITUD c WHERE c.id = id;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, No existe una solicitu con ese id.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.');
    END pEliminarSolicitud;
    
  ----Consultar Solicitud----  
FUNCTION fConsultarSolicitud(id NUMBER) RETURN SOLICITUD%rowtype IS
        rcsolicitud SOLICITUD%rowtype;
    BEGIN
        SELECT *  into rcsolicitud FROM SOLICITUD c WHERE c.id = id;
        RETURN rcsolicitud;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'Error, No existe una solicitud con este id.');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20001,'Error desconocido.');
END fConsultarSolicitud;   
    
    

end pkSolicitud;
/