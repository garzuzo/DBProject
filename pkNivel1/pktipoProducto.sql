CREATE OR REPLACE PACKAGE pktipoProducto AS -- spec
PROCEDURE pInsertarTipoProducto(idTProd NUMBER, nomTProd varchar);
FUNCTION fConsultarTipoProducto(idTProd NUMBER) return TIPO_PRODUCTO%ROWTYPE;
PROCEDURE pModififcarTipoProducto(idTProd NUMBER, nomTProd varchar);
PROCEDURE pEliminarTipoProducto(idTProd NUMBER);
END pktipoProducto;
/
CREATE OR REPLACE PACKAGE BODY pktipoProducto AS -- body
PROCEDURE pInsertarTipoProducto(idTProd NUMBER, nomTProd varchar) is
BEGIN
    INSERT INTO TIPO_PRODUCTO (id, NOMBRE_TIPO_PRODUCTO) VALUES (idTProd, nomTProd);

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END pInsertarTipoProducto;


FUNCTION fConsultarTipoProducto(idTProd NUMBER) return TIPO_PRODUCTO%ROWTYPE is 
    tipoProd TIPO_PRODUCTO%ROWTYPE;
BEGIN
    SELECT * INTO tipoProd FROM TIPO_PRODUCTO tp WHERE tp.id = idTProd;
    return tipoProd;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END fConsultarTipoProducto;

PROCEDURE pModififcarTipoProducto(idTProd NUMBER, nomTProd varchar) is
BEGIN
    UPDATE TIPO_PRODUCTO tp
    SET  tp.NOMBRE_TIPO_PRODUCTO = nomTProd
    WHERE tp.id = idTProd;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END pModififcarTipoProducto;

PROCEDURE pEliminarTipoProducto(idTProd NUMBER) is
BEGIN
    DELETE FROM TIPO_PRODUCTO WHERE id=idTProd;

    EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000,'Error al insertar en la tabla Cliente.'||SQLERRM);
END pEliminarTipoProducto;
END pktipoProducto;

--pruebas procedimientos
-- execute pktipoProducto.pInsertarTipoProducto(1234, 'Telefono');
-- execute PKTIPOPRODUCTO.PMODIFIFCARTIPOPRODUCTO(1234,'Celular');
-- execute PKTIPOPRODUCTO.PELIMINARTIPOPRODUCTO(1234);
 
