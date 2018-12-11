/*Procedures de usuario*/
DELIMITER //
CREATE PROCEDURE GuardarUsuario
	(VUsuario_Nombres    varchar(30),
	 VUsuario_Mote       varchar(30),
	 VUsuario_Contrasena nvarchar(60),
	 VUsuario_Telefono   varchar(30),
	 VUsuario_Calle      varchar(30),
	 VUsuario_Numero     varchar(30),
	 VUsuario_CP         varchar(30),
	 VUsuario_Estado     varchar(30),
	 VUsuario_Perfil     longblob,
	 VUsuario_Portada    longblob,
     VUsuario_Correo     varchar(30))
	BEGIN
	insert INTO Usuario(Usuario_Nombres,
						Usuario_Mote,
						Usuario_Contrasena,
						Usuario_Telefono,
						Usuario_Calle,
						Usuario_Numero,
						Usuario_CP,
						Usuario_Estado,
						Usuario_Perfil,
						Usuario_Portada,
                        Usuario_Correo) 
				 values(VUsuario_Nombres,
						VUsuario_Mote,
						VUsuario_Contrasena,
						VUsuario_Telefono,
						VUsuario_Calle,
						VUsuario_Numero,
						VUsuario_CP,
						VUsuario_Estado,
						VUsuario_Perfil,
						VUsuario_Portada,
                        VUsuario_Correo);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ComprobarUsuario
	(VUsuario_Temp varchar(30),Tipo_Validacion int)
	BEGIN
    
    /*Validacion del mote*/
    IF Tipo_Validacion = 1 THEN
		select Usuario_Mote from Usuario where Usuario_Mote=VUsuario_Temp;
        
    /*validacion del correo*/    
    ELSEIF Tipo_Validacion=2 THEN
		select Usuario_Correo from Usuario where Usuario_Correo=VUsuario_Temp;
        
    END IF;
    
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Login
	(VUsuario_Correo varchar(30))
	BEGIN
		select Usuario_Contrasena,Usuario_ID,Usuario_Mote,Usuario_Perfil,Usuario_Portada from Usuario where Usuario_Correo=VUsuario_Correo;
	END //
DELIMITER ;

/*Procedures de Categorias*/
DELIMITER //
CREATE PROCEDURE VerCategorias()
	BEGIN
		Select Categoria_ID,Categoria_Nombre from Categoria;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE VerCategoria(ID int)
	BEGIN
	select Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1,Articulo_Categoria 
    from Articulo 
    where Articulo_Categoria=ID;
	END //
DELIMITER ;

/*Procedures de Articulos*/

DELIMITER //
CREATE PROCEDURE GuardarArticulo
	(VArticulo_Nombre    varchar(50),
	 VArticulo_Categoria int,
	 VArticulo_Usuario   int,
	 VArticulo_Precio    decimal,
	 VArticulo_Unidades  int,
	 VArticulo_Imagen_1  longblob,
	 VArticulo_Imagen_2  longblob,
	 VArticulo_Imagen_3  longblob,
	 VArticulo_Video     varchar(50),
     VArticulo_Descripcion text)
	BEGIN
    insert into Articulo(Articulo_Nombre,
						 Articulo_Categoria,
                         Articulo_Usuario,
                         Articulo_Precio,
                         Articulo_Unidades,
                         Articulo_Imagen_1,
                         Articulo_Imagen_2,
                         Articulo_Imagen_3,
                         Articulo_Descripcion,
                         Articulo_Video)
			      values(VArticulo_Nombre,
						 VArticulo_Categoria,
                         VArticulo_Usuario,
                         VArticulo_Precio,
                         VArticulo_Unidades,
                         VArticulo_Imagen_1,
                         VArticulo_Imagen_2,
                         VArticulo_Imagen_3,
                         VArticulo_Descripcion,
                         VArticulo_Video);
END //
DELIMITER ;

CALL VerCategorias();

DELIMITER //
CREATE PROCEDURE Vermasvistos()
	BEGIN
    select Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1 
    from Articulo 
    order by Articulo_Visitas;  
	END //
DELIMITER ;
 
 
 DELIMITER //
CREATE PROCEDURE BuscaUsuario(ID int)
	BEGIN
		select Usuario_ID,Usuario_Mote,Usuario_Perfil,Usuario_Portada 
        from Usuario 
        where Usuario_ID=ID;
	END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE BuscarProducto(ID int)
	BEGIN
		select Articulo_ID,Articulo_Nombre,Articulo_Categoria,Articulo_Usuario,Articulo_Precio,Articulo_Unidades,Articulo_Imagen_1,Articulo_Imagen_2,Articulo_Imagen_3,Articulo_Descripcion,Articulo_Video,Articulo_Visitas,Articulo_Ventas,Articulo_Descuento
        from Articulo 
        where Articulo_ID=ID;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE VerVideosUser(ID int)
	BEGIN
    select Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1,Articulo_Descripcion
    from Articulo 
    where Articulo_Usuario=ID;  
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ModificarArticulo
                                  (ID int,
                                  VArticulo_Nombre    varchar(50),
								  VArticulo_Categoria int,
								  VArticulo_Usuario   int,
	                              VArticulo_Precio    decimal,
								  VArticulo_Unidades  int,
	                              VArticulo_Imagen_1  longblob,
	                              VArticulo_Imagen_2  longblob,
								  VArticulo_Imagen_3  longblob,
								  VArticulo_Video     varchar(50),
                                  VArticulo_Descripcion text)
	BEGIN
       update Articulo
       set Articulo_Nombre=VArticulo_Nombre,Articulo_Categoria=VArticulo_Categoria,Articulo_Usuario=VArticulo_Usuario,Articulo_Precio=VArticulo_Precio,Articulo_Unidades=VArticulo_Unidades,Articulo_Imagen_1=VArticulo_Imagen_1,Articulo_Imagen_2=VArticulo_Imagen_2,Articulo_Imagen_3=VArticulo_Imagen_3,Articulo_Video=VArticulo_Video,Articulo_Descripcion=VArticulo_Descripcion
       where Articulo_ID=ID;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarArticulo(ID int)
	BEGIN
    delete from Articulo
    where Articulo_ID=ID;  
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Buscar(ID varchar(30))
	BEGIN
           select Categoria_Nombre,Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1,Articulo_Descripcion 
           FROM Articulo 
           inner join Categoria on Articulo_Categoria=Categoria_ID
           WHERE Articulo_Nombre LIKE CONCAT('%', ID, '%') or  Articulo_Descripcion LIKE CONCAT('%', ID, '%') or Categoria_Nombre LIKE CONCAT('%', ID, '%');
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Aliminar(IDu int ,idp int)
	BEGIN
          delete from Carrito where Carrito_Usuario=IDu and Carrito_Articulo=idp;
	END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE Comentario(ID int,
                         IDV int,
                         VComenta_Contenido text)
	BEGIN
insert into Comenta (Comenta_Usuario,Comenta_Articulo,Comenta_Fecha,Comenta_Contenido) values(ID,IDV,now(),VComenta_Contenido);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE VerComentarios(ID int)
	BEGIN
    select Comenta_Fecha,Comenta_Contenido,Usuario_ID,Usuario_Mote,Usuario_Perfil,Comenta_Fecha
    from Comenta
    inner join Usuario on Usuario.Usuario_ID=Comenta.Comenta_Usuario
    where Comenta_Articulo=ID;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Califica(
						  VValora_Usuario  int,
                          VValora_Articulo int,
                          VValora_Cantidad int)
	BEGIN
insert into Valora(Valora_Usuario,Valora_Articulo,Valora_Cantidad) Values(VValora_Usuario,VValora_Articulo,VValora_Cantidad);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE VerCarrito(ID int)
	BEGIN
    select Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1,Articulo_Descripcion
    from Carrito
    inner join Articulo on Articulo_ID=Carrito_Articulo
    where Carrito_Usuario=ID;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Historial(ID int)
	BEGIN
    select Articulo_ID,Articulo_Nombre,Articulo_Precio,Articulo_Imagen_1,Articulo_Descripcion,Compra_Fecha,Compra_Cantidad
    from Compra
    inner join Articulo on Articulo_ID=Compra_Articulo
    where Compra_Usuario=ID;
	END //
DELIMITER ;

delimiter $ 
CREATE FUNCTION hello() RETURNS VARCHAR(50) 
BEGIN 
RETURN 'hoho' ; 
end$ 
delimiter ;

delimiter $ 
CREATE FUNCTION Valoracion(ID int) RETURNS int 
BEGIN 
declare resultado int;

select AVG(Valora_Cantidad) into resultado
FROM Valora
WHERE Valora_Articulo=ID;

RETURN resultado ; 
end$ 
delimiter ;

delimiter $ 
CREATE FUNCTION AgregarAlCarrito(IDU int,IDP int) RETURNS bit 
BEGIN 
declare Cantidad int;

select Articulo_Unidades into Cantidad
FROM Articulo
WHERE Articulo_ID=IDP;

IF Cantidad = 0 THEN
RETURN 0;

ELSEIF Cantidad>0 THEN
insert into Carrito(Carrito_Usuario,Carrito_Articulo)values(IDU,IDP);
END IF;

RETURN 1; 

end$ 
delimiter ;

delimiter $ 
CREATE FUNCTION Comprar(VCompra_Usuario   int,
						VCompra_Articulo  int) RETURNS bit 
BEGIN 
declare Cantidad int;

select Articulo_Unidades into Cantidad
FROM Articulo
WHERE Articulo_ID=VCompra_Articulo;

IF Cantidad = 0 THEN
RETURN 0;

ELSEIF Cantidad>0 THEN
insert into Compra(Compra_Fecha,Compra_Usuario,Compra_Cantidad,Compra_Articulo)values(now(),VCompra_Usuario,1,VCompra_Articulo);
END IF;

RETURN 1; 

end$ 
delimiter ;

DELIMITER $$
CREATE TRIGGER BorraCarrito after INSERT ON Compra
 FOR EACH ROW
 BEGIN
  delete from Carrito where Carrito_Usuario= NEW.Compra_Usuario and Carrito_Articulo=NEW.Compra_Articulo;
     update Articulo set Articulo_Unidades= Articulo_Unidades-1 where Articulo_ID=NEW.Compra_Articulo;

END$$
DELIMITER ;



