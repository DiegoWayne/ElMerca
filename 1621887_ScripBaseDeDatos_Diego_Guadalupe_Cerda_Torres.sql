create database GoldenGoblet;

use GoldenGoblet;

CREATE TABLE Usuario
(
Usuario_ID         int NOT NULL AUTO_INCREMENT,
Usuario_Nombres    varchar(60),
Usuario_Mote       varchar(30),
Usuario_Contrasena nvarchar(60),
Usuario_Telefono   varchar(30),
Usuario_Calle      varchar(30),
Usuario_Numero     varchar(30),
Usuario_CP         varchar(30),
Usuario_Estado     varchar(30),
Usuario_Perfil     longblob,
Usuario_Portada    longblob,
Usuario_Correo     varchar(30),

primary key (Usuario_ID)
);
ALTER TABLE Usuario AUTO_INCREMENT=2345;

create table Categoria
(
Categoria_ID     int NOT NULL AUTO_INCREMENT,
Categoria_Nombre varchar(30),

primary key (Categoria_ID)
);

insert into Categoria (Categoria_Nombre) values ('Musica');
insert into Categoria (Categoria_Nombre) values ('Libros');
insert into Categoria (Categoria_Nombre) values ('Juegos');

create table Articulo
(
Articulo_ID          int NOT NULL AUTO_INCREMENT,
Articulo_Nombre      varchar(50),
Articulo_Categoria   int,
Articulo_Usuario     int,
Articulo_Precio      decimal,
Articulo_Unidades    int,
Articulo_Imagen_1    longblob,
Articulo_Imagen_2    longblob,
Articulo_Imagen_3    longblob,
Articulo_Descripcion text,
Articulo_Video       varchar(50),
Articulo_Visitas     int default 0,
Articulo_Ventas      int default 0,
Articulo_Descuento   int default 0,

primary key(Articulo_ID),
foreign key (Articulo_Categoria) references Categoria(Categoria_ID),
foreign key (Articulo_Usuario) references Usuario(Usuario_ID)
);

ALTER TABLE Articulo AUTO_INCREMENT=4645;

create table Comenta
(
Comenta_ID        int NOT NULL AUTO_INCREMENT,
Comenta_Usuario   int,
Comenta_Articulo  int,
Comenta_Fecha     date,
Comenta_Contenido text,

primary key (Comenta_ID),
foreign key (Comenta_Articulo) references Articulo(Articulo_ID),
foreign key (Comenta_Usuario) references Usuario(Usuario_ID)
);

create table Compra
(
Compra_ID        int NOT NULL AUTO_INCREMENT,
Compra_Fecha     date,
Compra_Usuario   int,
Compra_Cantidad  int,
Compra_Articulo  int,
Compra_Efectuada int,

primary key (Compra_ID),
foreign key (Compra_Usuario) references Usuario(Usuario_ID),
foreign key (Compra_Articulo) references Articulo(Articulo_ID)
);

create table Valora
(
Valora_ID       int NOT NULL AUTO_INCREMENT,
Valora_Usuario  int,
Valora_Articulo int,
Valora_Cantidad int,

primary key (Valora_ID),
foreign key (Valora_Articulo) references Articulo(Articulo_ID),
foreign key (Valora_Usuario) references Usuario(Usuario_ID)
);

create table Carrito
(
Carrito_ID       int NOT NULL AUTO_INCREMENT,
Carrito_Usuario  int,
Carrito_Articulo int,

primary key (Carrito_ID)
);

set FOREIGN_KEY_CHECKS=0;
SET SQL_SAFE_UPDATES=0;

delete from Valora;