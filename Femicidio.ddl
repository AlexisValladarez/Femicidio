-- Generado por Oracle SQL Developer Data Modeler 17.3.0.261.1541
--   en:        2018-05-29 02:07:02 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE agresor (
    idagresor               VARCHAR2(4 CHAR) NOT NULL,
    nombreagresor           VARCHAR2(20 CHAR) NOT NULL,
    apellidoagresor         VARCHAR2(30 CHAR) NOT NULL,
    nacionalidadagresor     VARCHAR2(20 CHAR) NOT NULL,
    sentencia_idsentencia   VARCHAR2(4) NOT NULL,
    arma_idarma             VARCHAR2(4 CHAR) NOT NULL
);

ALTER TABLE agresor ADD CONSTRAINT agresor_pk PRIMARY KEY ( idagresor,
arma_idarma );

CREATE TABLE arma (
    idarma     VARCHAR2(4 CHAR) NOT NULL,
    tipoarma   VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE arma ADD CONSTRAINT arma_pk PRIMARY KEY ( idarma );

CREATE TABLE categoriadata (
    idcategoria            VARCHAR2(4 CHAR) NOT NULL,
    tipocategoria          VARCHAR2(30 CHAR) NOT NULL,
    datafemicidio_iddata   VARCHAR2(4 CHAR) NOT NULL
);

ALTER TABLE categoriadata ADD CONSTRAINT categoriadata_pk PRIMARY KEY ( idcategoria );

CREATE TABLE datafem_fem (
    datafemicidio_iddata    VARCHAR2(4 CHAR) NOT NULL,
    femicidio_idfemicidio   VARCHAR2(4 CHAR) NOT NULL
);

ALTER TABLE datafem_fem ADD CONSTRAINT datafem_fem_pk PRIMARY KEY ( datafemicidio_iddata,
femicidio_idfemicidio );

CREATE TABLE datafemicidio (
    iddata          VARCHAR2(4 CHAR) NOT NULL,
    autordata       VARCHAR2(50 CHAR) NOT NULL,
    enlacedata      VARCHAR2(150 CHAR) NOT NULL,
    contenidodata   VARCHAR2(600 CHAR) NOT NULL
);

ALTER TABLE datafemicidio ADD CONSTRAINT datafemicidio_pk PRIMARY KEY ( iddata );

CREATE TABLE departamento (
    iddepartamento          VARCHAR2(4 CHAR) NOT NULL,
    departamentoprovincia   VARCHAR2(20 CHAR) NOT NULL,
    departamentocanton      VARCHAR2(20 CHAR) NOT NULL,
    direccion_iddireccion   VARCHAR2(4 CHAR) NOT NULL
);

CREATE UNIQUE INDEX departamento__idx ON
    departamento ( direccion_iddireccion ASC );

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( iddepartamento );

CREATE TABLE direccion (
    iddireccion             VARCHAR2(4 CHAR) NOT NULL,
    calledireccion          VARCHAR2(50 CHAR) NOT NULL,
    femicidio_idfemicidio   VARCHAR2(4 CHAR) NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( iddireccion );

CREATE TABLE femicidio (
    idfemicidio      VARCHAR2(4 CHAR) NOT NULL,
    lugarfemicidio   VARCHAR2(50 CHAR) NOT NULL,
    fechafemicidio   DATE NOT NULL
);

ALTER TABLE femicidio ADD CONSTRAINT femicidio_pk PRIMARY KEY ( idfemicidio );

CREATE TABLE sentencia (
    idsentencia          VARCHAR2(4) NOT NULL,
    situacionsentencia   VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE sentencia ADD CONSTRAINT sentencia_pk PRIMARY KEY ( idsentencia );

CREATE TABLE victima (
    idvictima               VARCHAR2(4 CHAR) NOT NULL,
    nombrevictima           VARCHAR2(20 CHAR) NOT NULL,
    apellidovictima         VARCHAR2(30 CHAR) NOT NULL,
    edadvictima             VARCHAR2(4 CHAR) NOT NULL,
    nacionalidadvictima     VARCHAR2(20 CHAR) NOT NULL,
    ocupacionvictima        VARCHAR2(20 CHAR) NOT NULL,
    femicidio_idfemicidio   VARCHAR2(4 CHAR) NOT NULL,
    agresor_idagresor       VARCHAR2(4 CHAR) NOT NULL,
    agresor_arma_idarma     VARCHAR2(4 CHAR) NOT NULL
);

CREATE UNIQUE INDEX victima__idx ON
    victima ( femicidio_idfemicidio ASC );

ALTER TABLE victima
    ADD CONSTRAINT victima_pk PRIMARY KEY ( idvictima,
    agresor_idagresor,
    agresor_arma_idarma );

ALTER TABLE agresor
    ADD CONSTRAINT agresor_arma_fk FOREIGN KEY ( arma_idarma )
        REFERENCES arma ( idarma );

ALTER TABLE agresor
    ADD CONSTRAINT agresor_sentencia_fk FOREIGN KEY ( sentencia_idsentencia )
        REFERENCES sentencia ( idsentencia );

ALTER TABLE categoriadata
    ADD CONSTRAINT categoriadata_datafemicidio_fk FOREIGN KEY ( datafemicidio_iddata )
        REFERENCES datafemicidio ( iddata );

ALTER TABLE datafem_fem
    ADD CONSTRAINT datafem_fem_datafemicidio_fk FOREIGN KEY ( datafemicidio_iddata )
        REFERENCES datafemicidio ( iddata );

ALTER TABLE datafem_fem
    ADD CONSTRAINT datafem_fem_femicidio_fk FOREIGN KEY ( femicidio_idfemicidio )
        REFERENCES femicidio ( idfemicidio );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_direccion_fk FOREIGN KEY ( direccion_iddireccion )
        REFERENCES direccion ( iddireccion );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_femicidio_fk FOREIGN KEY ( femicidio_idfemicidio )
        REFERENCES femicidio ( idfemicidio );

ALTER TABLE victima
    ADD CONSTRAINT victima_agresor_fk FOREIGN KEY ( agresor_idagresor,
    agresor_arma_idarma )
        REFERENCES agresor ( idagresor,
        arma_idarma );

ALTER TABLE victima
    ADD CONSTRAINT victima_femicidio_fk FOREIGN KEY ( femicidio_idfemicidio )
        REFERENCES femicidio ( idfemicidio );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             2
-- ALTER TABLE                             19
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
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
