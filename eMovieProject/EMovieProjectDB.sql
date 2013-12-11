CREATE DATABASE "eMovieProjectDB"
USE "eMovieProjectDB"

CREATE TABLE Usuario(
	idUsuario int identity(1,1) NOT NULL,
	nombreCompleto varchar(100) NOT NULL,
	apellidoCompleto varchar(100) NOT NULL,
	loginUser varchar(50) NOT NULL,
	contraseña varchar(128) NOT NULL,
	fotografia varchar(200) NULL,
	CONSTRAINT pk_usuario PRIMARY KEY(idUsuario),
)

CREATE TABLE Administrador(
	idAdministrador int identity(1,1) NOT NULL,
	idUsuario int NOT NULL,
	CONSTRAINT pk_administrador PRIMARY KEY(idAdministrador),
	CONSTRAINT fk_adminUser FOREIGN KEY(idUsuario) references Usuario(idUsuario)
)


CREATE TABLE Cliente(
	idCliente int identity(1,1) NOT NULL,
	idUsuario int NOT NULL,
	numeroTarjetaCredito varchar(50) NOT NULL,
	pinTarjetaCredito varchar(50) NOT NULL,
	email varchar(80) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(idCliente),
	CONSTRAINT fk_clienteUser FOREIGN KEY(idUsuario) references Usuario(idUsuario)
)

CREATE TABLE Cajero(
	idCajero int identity(1,1) NOT NULL,
	idUsuario int NOT NULL,
	CONSTRAINT pk_cajero PRIMARY KEY(idCajero),
	CONSTRAINT fk_adminCajero FOREIGN KEY(idUsuario) references Usuario(idUsuario)
)


CREATE TABLE Proveedor(
	idProveedor int identity(1,1) NOT NULL,
	nombreProveedor varchar(128) NOT NULL,
	nit varchar(50) NOT NULL,
	telefono varchar(20) NOT NULL,
	email varchar(128) NOT NULL,
	direccion varchar(128) NULL,
	CONSTRAINT pk_proveedor PRIMARY KEY(idProveedor),
)


CREATE TABLE Categoria(
	idCategoria int identity(1,1) NOT NULL,
	categoria varchar(50) NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY(idCategoria)
)


CREATE TABLE PeliculasProveedor(
	idPelicula int identity(1,1) NOT NULL,
	idProveedor int NOT NULL,
	pelicula varchar(200) NOT NULL,
	precio decimal (10,2) NOT NULL,
	productora varchar(100) NOT NULL,
	protagonistas varchar(300)NULL,
	ano varchar(5)NULL,
	idCategoria int NOT NULL,
	fotografia varchar(200)NOT NULL,
	trailer varchar(200) NULL,
	CONSTRAINT pk_peliculasProveedor PRIMARY KEY(idPelicula),
	CONSTRAINT fk_peliculaProveedor FOREIGN KEY(idProveedor)  references Proveedor(idProveedor),
	CONSTRAINT fk_peliculaProveedorCategoria FOREIGN KEY(idCategoria) references Categoria(idCategoria)
)


CREATE TABLE Pedido(
	idPedido int identity(1,1) NOT NULL,
	idAdministrador int NOT NULL,
	idProveedor int NOT NULL,
	estado int NOT NULL, /* 1 = en Transito   2 = entregado */
	fechaPedido varchar(30) NOT NULL,
	fechaEntrega varchar(30) NOT NULL,
	totalPrecio decimal(10,2) NOT NULL,
	cantidadProductos int NOT NULL,
	CONSTRAINT pk_pedido PRIMARY KEY(idPedido),
	CONSTRAINT fk_pedidoAdministrador FOREIGN KEY(idAdministrador) references Administrador(idAdministrador),
	CONSTRAINT fk_pedidoProveedor FOREIGN KEY(idProveedor) references Proveedor(idProveedor)
)

CREATE TABLE DetallePedido(
	idDetalle int identity(1,1) NOT NULL,
	idPedido int NOT NULL,
	idPelicula int NOT NULL,
	CONSTRAINT pk_detallePedido PRIMARY KEY(idDetalle),
	CONSTRAINT fk_detallePedido FOREIGN KEY(idDetalle) references Pedido(idPedido),
	CONSTRAINT fk_detallePelicula FOREIGN KEY(idPelicula) references PeliculasProveedor(idPelicula)
)


CREATE TABLE Bodega(
	idRegistro int identity(1,1) NOT NULL,
	idProveedor int NOT NULL,
	fechaEntrada varchar(30) NOT NULL,
	idPelicula int NOT NULL,
	existencia int NOT NULL,
	CONSTRAINT pk_bodega PRIMARY KEY(idRegistro),
	CONSTRAINT fk_bodegaProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedor(idProveedor),
	CONSTRAINT fk_bodegaPelicula FOREIGN KEY(idPelicula) references Pelicula(idPelicula)
)

CREATE TABLE Pelicula(
	idPelicula int identity(1,1) NOT NULL,
	pelicula varchar(200) NOT NULL,
	precio decimal (10,2) NOT NULL,
	productora varchar(100) NOT NULL,
	protagonistas varchar(300)NULL,
	ano varchar(5)NULL,
	idCategoria int NOT NULL,
	fotografia varchar(200)NOT NULL,
	trailer varchar(200) NULL,
	CONSTRAINT pk_pelicula PRIMARY KEY(idPelicula),
	CONSTRAINT fk_peliculaCategoria FOREIGN KEY(idCategoria) references Categoria(idCategoria)
)

CREATE TABLE Compra(
	idCompra int identity(1,1) NOT NULL,
	idCliente int NOT NULL,
	idCajero int NOT NULL,
	fechaCompra varchar(30) NOT NULL,
	idDetalleAdquirido int NOT NULL,
	total decimal(10,2) NOT NULL,
	cantidad int NOT NULL,
	CONSTRAINT pk_compra PRIMARY KEY(idCompra),
	CONSTRAINT fk_compraDetalle FOREIGN KEY(idDetalleAdquirido) references DetalleAdquirido(idDetalleAdquirido),
	CONSTRAINT fk_compraCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_compraCajero FOREIGN KEY(idCajero) REFERENCES Cajero(idCajero)
)

CREATE TABLE DetalleAdquirido(
	idDetalleAdquirido int identity(1,1) NOT NULL,
	idPelicula int NOT NULL,
	CONSTRAINT pk_detalleAdquirido PRIMARY KEY(idDetalleAdquirido),
	CONSTRAINT fk_detalleAdquiridoPelicula FOREIGN KEY(idPelicula) REFERENCES Pelicula(idPelicula)
)

CREATE TABLE Renta(
	idRenta int identity(1,1) NOT NULL,
	idCliente int NOT NULL,
	idCajero int NOT NULL,
	fechaRenta varchar(30) NOT NULL,
	fechaDevolucion varchar(30) NOT NULL,
	idDetalleAdquirido int NOT NULL,
	total int NOT NULL,
	cantidad int NOT NULL,
	CONSTRAINT pk_renta PRIMARY KEY(idRenta),
	CONSTRAINT fk_rentaCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_rentaCajero FOREIGN KEY(idCajero) REFERENCES Cajero(idCajero),
	CONSTRAINT fk_rentaDetalle FOREIGN KEY(idDetalleAdquirido) REFERENCES DetalleAdquirido(idDetalleAdquirido)
)

