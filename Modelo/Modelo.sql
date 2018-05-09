-- Generado por Oracle SQL Developer Data Modeler 17.2.0.188.1059
--   en:        2018-05-09 09:59:10 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g


DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE danio CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE tipo_anomalia CASCADE CONSTRAINTS;

DROP TABLE tipo_producto CASCADE CONSTRAINTS;

DROP TABLE tiposolicitud CASCADE CONSTRAINTS;

CREATE TABLE cliente (
    cedula      NUMBER(10) NOT NULL,
    nombre      VARCHAR2(50 CHAR) NOT NULL,
    direccion   VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE danio (
    id                    NUMBER(10) NOT NULL,
    descricion_problema   VARCHAR2(500 CHAR) NOT NULL,
    tipo_anomalia_id      NUMBER(4) NOT NULL,
    solicitud_id          NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX danio__idx ON
    danio ( solicitud_id ASC );

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
    tipo_producto_id   NUMBER(10) NOT NULL
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
    funcionario_id     NUMBER(10) NOT NULL
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
    ADD CONSTRAINT solicitud_tiposolicitud_fk FOREIGN KEY ( tiposolicitud_id )
        REFERENCES tiposolicitud ( id );




