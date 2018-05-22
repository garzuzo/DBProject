-- Generado por Oracle SQL Developer Data Modeler 18.1.0.082.1035
--   en:        2018-05-21 21:01:44 COT
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g



DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE danio CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE tipo_anomalia CASCADE CONSTRAINTS;

DROP TABLE tipo_producto CASCADE CONSTRAINTS;

DROP TABLE tiposolicitud CASCADE CONSTRAINTS;

CREATE TABLE cliente (
    cedula            NUMBER(10) NOT NULL,
    nombre            VARCHAR2(50 CHAR) NOT NULL,
    direccion         VARCHAR2(100 CHAR) NOT NULL,
    fechanacimiento   DATE,
    telefono          NUMBER(7)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE danio (
    id                    NUMBER(10) NOT NULL,
    descricion_problema   VARCHAR2(500 CHAR) NOT NULL,
    tipo_anomalia_id      NUMBER(4) NOT NULL,
    solicitud_id          NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX danio__idx ON
    danio (
        solicitud_id
    ASC );

ALTER TABLE danio ADD CONSTRAINT danio_pk PRIMARY KEY ( id );

CREATE TABLE funcionario (
    id       NUMBER(10) NOT NULL,
    nombre   VARCHAR2(100) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( id );

CREATE TABLE producto (
    id                 NUMBER(10) NOT NULL,
    fecha_inicio       DATE NOT NULL,
    fecha_retiro       DATE,
    estado_producto    VARCHAR2(200 CHAR) NOT NULL,
    cliente_cedula     NUMBER(10) NOT NULL,
    tipo_producto_id   NUMBER(10) NOT NULL,
    id2                NUMBER
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE solicitud (
    id                 NUMBER(10) NOT NULL,
    observacion        VARCHAR2(300 CHAR),
    fecha_solicitud    DATE NOT NULL,
    fecha_atencion     DATE,
    estado_atencion    VARCHAR2(100 CHAR) NOT NULL,
    cliente_cedula     NUMBER(10) NOT NULL,
    tiposolicitud_id   NUMBER(3) NOT NULL,
    funcionario_id     NUMBER(10) NOT NULL,
    producto_id        NUMBER(10) NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id );

CREATE TABLE tipo_anomalia (
    id                NUMBER(4) NOT NULL,
    nombre_anomalia   VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE tipo_anomalia ADD CONSTRAINT tipo_anomalia_pk PRIMARY KEY ( id );

CREATE TABLE tipo_producto (
    id                     NUMBER(10) NOT NULL,
    nombre_tipo_producto   VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE tipo_producto ADD CONSTRAINT tipo_producto_pk PRIMARY KEY ( id );

CREATE TABLE tiposolicitud (
    id       NUMBER(3) NOT NULL,
    nombre   VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE tiposolicitud ADD CONSTRAINT tiposolicitud_pk PRIMARY KEY ( id );

ALTER TABLE danio
    ADD CONSTRAINT danio_solicitud_fk FOREIGN KEY ( solicitud_id )
        REFERENCES solicitud ( id );

ALTER TABLE danio
    ADD CONSTRAINT danio_tipo_anomalia_fk FOREIGN KEY ( tipo_anomalia_id )
        REFERENCES tipo_anomalia ( id );

ALTER TABLE producto
    ADD CONSTRAINT producto_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula );

ALTER TABLE producto
    ADD CONSTRAINT producto_tipo_producto_fk FOREIGN KEY ( tipo_producto_id )
        REFERENCES tipo_producto ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_id )
        REFERENCES funcionario ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tiposolicitud_fk FOREIGN KEY ( tiposolicitud_id )
        REFERENCES tiposolicitud ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             1
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
