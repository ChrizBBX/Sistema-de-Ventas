CREATE DATABASE SistemaVentas
GO
USE SistemaVentas
GO


--------------------------------------------------------------------
--------------------------------------------------------------------
--Usuarios

CREATE TABLE tbUsuarios(
	usuarioId					INT IDENTITY(1,1),
	usuarioUsuario				NVARCHAR(150) NOT NULL UNIQUE,
	usuarioContrASenia			NVARCHAR(MAX) NOT NULL,
	empleadoId					INT NOT NULL,
	usuarioUsuarioCreacion		INT NOT NULL,
	usuarioFechaCreacion		DATETIME NOT NULL,
	usuarioUsuarioModificacion INT ,
	usuarioFechaModificacion	DATETIME,
	usuarioEstado				BIT NOT NULL,
	CONSTRAINT PK_dbo_tbUsuarios_usuarioId PRIMARY KEY(usuarioId)
);

--------------------------------------------------------------------
--------------------------------------------------------------------
--Estado Civil
CREATE TABLE tbEstadosCiviles(
	estadoCivilId					CHAR(1) NOT NULL,
	estadoCivilNombre				NVARCHAR(200) NOT NULL,
	estadoCivilFechaCreacion		DATETIME NOT NULL,
	estadoCivilUsuarioCreacion		INT NOT NULL,
	estadoCivilFechaModificacion	DATETIME,
	estadoCivilUsuarioModificacion  INT,
	estadoCivilEstado				BIT NOT NULL, 
	CONSTRAINT PK_dbo_tbEstadosCiviles_estadoCivilId PRIMARY KEY(estadoCivilId),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estadoCivilUsuarioCreacion_estadoCivilId FOREIGN KEY(estadoCivilUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estadoCivilFechaModificacion_estadoCivilId FOREIGN KEY(estadoCivilUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);

--------------------------------------------------------------------
--------------------------------------------------------------------
--Departamentos
CREATE TABLE tbDepartamentos(
	departamentoId					CHAR(2) NOT NULL,
	departamentoNombre				NVARCHAR(200) NOT NULL,
	departamentoFechaCreacion		DATETIME NOT NULL,
	departamentoUsuarioCreacion		INT NOT NULL,
	departamentoFechaModificacion	DATETIME,
	departamentoUsuarioModificacion INT,
	departamentoEstado				BIT NOT NULL,
	CONSTRAINT PK_dbo_tbDepartamentos_departamentoId PRIMARY KEY(departamentoId),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_departamentoUsuarioCreacion_usuarioId FOREIGN KEY(departamentoUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_departamentoUsuarioModificacion_usuarioId FOREIGN KEY(departamentoUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);


--------------------------------------------------------------------
--------------------------------------------------------------------
--Municipios

CREATE TABLE tbMunicipios(
	municipioId						CHAR(4) NOT NULL,
	departamentoId					CHAR(2) NOT NULL,
	municipioNombre					NVARCHAR(200) NOT NULL,
	municipioFechaCreacion			DATETIME NOT NULL,
	municipioUsuarioCreacion		INT NOT NULL,
	municipioFechaModificacion		DATETIME,
	municipioUsuarioModificacion	INT,
	municipioEstado					BIT NOT NULL,
	CONSTRAINT PK_dbo_tbMunicipios_municipioId PRIMARY KEY(municipioId),
	CONSTRAINT FK_tbMunicipios_tbDepartamentos_departamentoId FOREIGN KEY(departamentoId) REFERENCES tbDepartamentos(departamentoId),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_municipioUsuarioCreacion_usuarioId FOREIGN KEY(municipioUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_municipioUsuarioModificacion_usuarioId FOREIGN KEY(municipioUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

--CategoriAS
CREATE TABLE tbCategoria(
categoriaId						INT IDENTITY(1,1),
categoriaDescripcion			NVARCHAR (150) NOT NULL,
categoriaFechaCreacion			DATETIME NOT NULL,
categoriaUsuarioCreacion		INT NOT NULL,
categoriaFechaModificacion		DATETIME,
categoriaUsuarioModificacion	INT,
categoriaEstado					BIT NOT NULL,
CONSTRAINT PK_dbo_tbCategoria_categoriaId PRIMARY KEY(categoriaId),
	CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_categoriaUsuarioCreacion_usuarioId FOREIGN KEY(categoriaUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_categoriaFechaModificacion_usuarioId FOREIGN KEY(categoriaUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);



--------------------------------------------------------------------
--------------------------------------------------------------------
--Cargos
CREATE TABLE tbCargos(
	cargoId					INT IDENTITY(1,1) NOT NULL,
	cargoNombre				NVARCHAR(150) NOT NULL,
	cargoFechaCreacion		DATETIME NOT NULL,
	cargoUsuarioCreacion		INT NOT NULL,
	cargoFechaModificacion	DATETIME,
	cargoUsuarioModificacion INT,
	cargoEstado				BIT NOT NULL,
	CONSTRAINT PK_dbo_tbCargos_cargoId PRIMARY KEY(cargoId),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_cargoUsuarioCreacion_usuarioId FOREIGN KEY(cargoUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_cargoUsuarioModificacion_usuarioId FOREIGN KEY(cargoUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--Metodo de Pago
CREATE TABLE tbMetodoPago(
	metodopagoId						Char(1) NOT NULL,
	metodopagoDescripcion				NVARCHAR (100) NOT NULL,
	metodopagoFechaCreacion				DATETIME NOT NULL,
	metodopagoUsuarioCreacion			INT NOT NULL,
	metodopagoFechaModificacion			DATETIME,
	metodopagoUsuarioModificacion		INT,
	metodopagoEstado					BIT NOT NULL,
	
	CONSTRAINT PK_dbo_tbMetodoPagos_metodopagoId PRIMARY KEY(metodopagoId),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metodopagoUsuarioCreacion_usuarioId FOREIGN KEY(metodopagoUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metodopagoUsuarioModificacion_usuarioId FOREIGN KEY(metodopagoUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Proveedores
CREATE TABLE tbProveedores (
proveedorId                             INT IDENTITY(1,1),
proveedorNombre                         NVARCHAR(250) NOT NULL,
municipioId								CHAR(04) NOT NULL,
proveedorDireccionExacta                NVARCHAR(500),
proveedorTelefono                       VARCHAR(50),
proveedorEmail                          NVARCHAR(150) NOT NULL,
proveedorFechaCreacion					DATETIME NOT NULL,
proveedorUsuarioCreacion				INT NOT NULL,
proveedorFechaModificacion				DATETIME,
proveedorUsuarioModificacion			INT,
proveedorEstado							BIT NOT NULL,
CONSTRAINT PK_dbo_tbProveedores_proveedorId PRIMARY KEY(proveedorId),
CONSTRAINT FK_dbo_tbProveedores_dbo_tbMunicipios_municipioId FOREIGN KEY(municipioId) REFERENCES tbMunicipios(municipioId),
CONSTRAINT FK_dbo_tbproveedores_dbo_tbUsuarios_proveedorUsuarioCreacion_usuarioId FOREIGN KEY(proveedorUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbProveedores_dbo_tbUsuarios_proveedorUsuarioModificacion_usuarioId FOREIGN KEY(proveedorUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)	
);


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Productos
CREATE TABLE tbProductos(
productoId								INT IDENTITY(1,1),
productoNombre							NVARCHAR (150) NOT NULL,
productoPrecio							DECIMAL (18,2) NOT NULL,
categoriaId								INT NOT NULL,
proveedorid								INT NOT NULL,
productoStock							INT NOT NULL,
productoFechaCreacion					DATETIME NOT NULL,
productoUsuarioCreacion					INT NOT NULL,
productoFechaModificacion				DATETIME,
productoUsuarioModificacion				INT,
productoEstado							BIT NOT NULL,

CONSTRAINT PK_dbo_tbProdutos_productoId PRIMARY KEY(productoId),
CONSTRAINT FK_dbo_tbProductos_tbCategoria_categoriaId FOREIGN KEY (categoriaId) REFERENCES tbCategoria (categoriaId),
CONSTRAINT FK_dbo_tbProductos_tbProveedores_proveedorid FOREIGN KEY (proveedorid) REFERENCES tbProveedores (proveedorId),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_productoUsuarioCreacion_usuarioId FOREIGN KEY(productoUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_productoUsuarioModificacion_usuarioId FOREIGN KEY(productoUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Clientes
CREATE TABLE tbClientes(
clienteId                              INT IDENTITY (1,1),
clienteNombre							NVARCHAR(150) NOT NULL,
clienteApellido						NVARCHAR(150) NOT NULL,
municipioId								CHAR(04) NOT NULL,
clienteDireccionExacta					NVARCHAR(500) NOT NULL,
clienteTelefono						NVARCHAR(20) NOT NULL,
clienteCorreoElectronico				NVARCHAR(100) NOT NULL,
clienteFechaCreacion					DATETIME NOT NULL,
clienteUsuarioCreacion					INT NOT NULL,
clienteFechaModificacion				DATETIME,
clienteUsuarioModificacion				INT,
clienteEstado							BIT NOT NULL,

CONSTRAINT PK_dbo_tbClientes_clienteId PRIMARY KEY(clienteid),
CONSTRAINT FK_dbo_tbClientes_dbo_tbMunicipios_municipioId FOREIGN KEY(municipioId) REFERENCES tbMunicipios(municipioId),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_clienteUsuarioCreacion_usuarioId FOREIGN KEY(clienteUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_clienteUsuarioModificacion_usuarioId FOREIGN KEY(clienteUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Empleados
CREATE TABLE tbEmpleados(
empleadoId                              INT IDENTITY (1,1),
empleadoNombre							NVARCHAR(150) NOT NULL,
empleadoApellido						NVARCHAR(150) NOT NULL,
empleadoSexo							CHAR(1) NOT NULL,
municipioId								CHAR(04) NOT NULL,
empleadoDireccionExacta					NVARCHAR(500) NOT NULL,
estadoCivilId							CHAR(1) NOT NULL,
empleadoTelefono						NVARCHAR(20) NOT NULL,
empleadoCorreoElectronico				NVARCHAR(100) NOT NULL,
empleadoFechaNacimiento					Date NOT NULL,
empleadoFechaContratacion				Date NOT NULL,
cargoId									INT NOT NULL,
empleadoFechaCreacion					DATETIME NOT NULL,
empleadoUsuarioCreacion					INT NOT NULL,
empleadoFechaModificacion				DATETIME,
empleadoUsuarioModificacion				INT,
empleadoEstado							BIT NOT NULL,

CONSTRAINT PK_dbo_tbEmpleados_empleadoId PRIMARY KEY(empleadoId),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbMunicipios_municipioId FOREIGN KEY(municipioId) REFERENCES tbMunicipios(municipioId),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbEstadosCiviles_estadoCivilId FOREIGN KEY(estadoCivilId) REFERENCES tbEstadosCiviles(estadoCivilId),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbCargos_cargoId FOREIGN KEY(cargoId) REFERENCES tbCargos(cargoId),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_empleadoUsuarioCreacion_usuarioId FOREIGN KEY(empleadoUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_empleadoUsuarioModificacion_usuarioId FOREIGN KEY(empleadoUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);


--Factura
CREATE TABLE tbFactura(
facturaId								INT IDENTITY(1,1),
clienteId								INT NOT NULL,
facturaFecha							Datetime NOT NULL,
empleadoId								INT NOT NULL,
metodopagoId							CHAR(1) NOT NULL,
facturaFechaCreacion					DATETIME NOT NULL,
facturaUsuarioCreacion					INT NOT NULL,
facturaFechaModificacion				DATETIME,
facturaUsuarioModificacion				INT,
facturaEstado							BIT NOT NULL,

CONSTRAINT PK_dbo_tbFactura_facturaId PRIMARY KEY(facturaId),
CONSTRAINT FK_dbo_tbFactura_tbClientes_clienteId FOREIGN KEY(clienteId) REFERENCES tbClientes(clienteId),
CONSTRAINT FK_dbo_tbFactura_tbMetodoPago_metodopagoId FOREIGN KEY(metodopagoId) REFERENCES tbMetodoPago(metodopagoId),
CONSTRAINT FK_dbo_tbFactura_dbo_tbEmpleados_empleadoId FOREIGN KEY(empleadoId) REFERENCES tbEmpleados(empleadoId),
CONSTRAINT FK_dbo_tbFactura_dbo_tbUsuarios_facturaUsuarioCreacion_usuarioId FOREIGN KEY(facturaUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbFactura_dbo_tbUsuarios_facturaUsuarioModificacion_usuarioId FOREIGN KEY(facturaUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)
);

--------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--FacturaDetalles
CREATE TABLE tbFacturaDetalles (
facturaDetalle_Id                            INT IDENTITY(1,1),
facturaId									 INT NOT NULL,
productoId									 INT NOT NULL,
facturaDetalle_catidad						 INT NOT NULL,
facturaDetalle_Precio						 DECIMAL (18,2) NOT NULL,
facturaDetalle_FechaCreacion				 DATETIME NOT NULL,
facturaDetalle_UsuarioCreacion				 INT NOT NULL,
facturaDetalle_FechaModificacion			 DATETIME,
facturaDetalle_UsuarioModificacion			 INT,
facturaDetalle_Estado						 BIT NOT NULL,
CONSTRAINT PK_dbo_tbFacturaDetalles_facturaDetalle_Id PRIMARY KEY(facturaDetalle_Id),
CONSTRAINT FK_dbo_tbFacturaDetalles_tbFactura_facturaId FOREIGN KEY(facturaId) REFERENCES tbFactura(facturaId),
CONSTRAINT FK_dbo_tbFacturaDetalles_tbProducto_productoId FOREIGN KEY(productoId) REFERENCES tbProductos(productoId),
CONSTRAINT FK_dbo_tbFacturaDetalles_dbo_tbUsuarios_facturaDetalle_UsuarioCreacion_usuarioId FOREIGN KEY(facturaDetalle_UsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbFacturaDetalles_dbo_tbUsuarios_facturaDetalle_UsuarioModificacion_usuarioId FOREIGN KEY(facturaDetalle_UsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------



--Compra
CREATE TABLE tbComprAS(
compraId                            INT IDENTITY(1,1),
proveedorId                         INT NOT NULL,
compraFecha							Datetime NOT NULL,
compraFechaCreacion					DATETIME NOT NULL,
compraUsuarioCreacion				INT NOT NULL,
compraFechaModificacion				DATETIME,
compraUsuarioModificacion			INT,
compraEstado						BIT NOT NULL,

CONSTRAINT PK_dbo_tbComprAS_compraId PRIMARY KEY(compraId),
CONSTRAINT FK_dbo_tbComprAS_tbProveedores_proveedorId FOREIGN KEY(proveedorId) REFERENCES tbProveedores(proveedorId),
CONSTRAINT FK_dbo_tbComprAS_dbo_tbUsuarios_compraUsuarioCreacion_usuarioId FOREIGN KEY(compraUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbComprAS_dbo_tbUsuarios_compraUsuarioModificacion_usuarioId FOREIGN KEY(compraUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--CompraDetalles
CREATE TABLE tbCompraDetalles (
compraDetalleId                             INT IDENTITY(1,1),
compraId									INT NOT NULL,
productoId									INT NOT NULL,
compraDetallecatidad						INT NOT NULL,
compraDetallePrecio							DECIMAL (18,2) NOT NULL,
compraDetalleFechaCreacion					DATETIME NOT NULL,
compraDetalleUsuarioCreacion				INT NOT NULL,
compraDetalleFechaModificacion				DATETIME,
compraDetalleUsuarioModificacion			INT,
compraDetalleEstado							BIT NOT NULL,
CONSTRAINT PK_dbo_tbCompraDetalles_compraDetalleId PRIMARY KEY(compraDetalleId),
CONSTRAINT FK_dbo_tbCompraDetalles_tbComprAS_compraId FOREIGN KEY(compraId) REFERENCES tbComprAS(compraId),
CONSTRAINT FK_dbo_tbCompraDetalles_tbProducto_productoId FOREIGN KEY(productoId) REFERENCES tbProductos(productoId),
CONSTRAINT FK_dbo_tbCompraDetalles_dbo_tbUsuarios_compraDetalleUsuarioCreacion_usuarioId FOREIGN KEY(compraDetalleUsuarioCreacion) REFERENCES tbUsuarios(usuarioId),
CONSTRAINT FK_dbo_tbCompraDetalles_dbo_tbUsuarios_compraDetalleUsuarioModificacion_usuarioId FOREIGN KEY(compraDetalleUsuarioModificacion) REFERENCES tbUsuarios(usuarioId)

);


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
go

CREATE TRIGGER trg_AumentarStockluegoBorrar
   ON  [dbo].[tbFacturaDetalles]
   AFTER Delete
AS 
BEGIN
	

	DECLARE @NuevoStock int = (SELECT t1.productoStock from [tbProductos] AS t1 WHERE t1.productoId = (SELECT t1.productoId from deleted AS t1)) + (SELECT t1.facturaDetalle_catidad from deleted AS t1 WHERE t1.productoId = (SELECT t1.productoId from deleted AS t1))

UPDATE [dbo].[tbProductos]
   SET [productoStock] = @NuevoStock
 WHERE productoId = (SELECT t1.productoId from deleted AS t1)


END
GO
go

-------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------



go

CREATE TRIGGER trg_AumentarStock
   ON  [dbo].[tbCompraDetalles]
   AFTER INSERT
AS 
BEGIN
	

	DECLARE @NuevoStock int = (SELECT t1.productoStock from [tbProductos] AS t1 WHERE t1.productoId = (SELECT t1.productoId from inserted AS t1)) + (SELECT t1.compraDetallecatidad from inserted AS t1 WHERE t1.productoId = (SELECT t1.productoId from inserted AS t1))

UPDATE [dbo].[tbProductos]
   SET [productoStock] = @NuevoStock
 WHERE productoId = (SELECT t1.productoId from inserted AS t1)


END
GO
go

-------------------------------------------------------------------------------------------

go

CREATE TRIGGER trg_DisminuirStock
   ON  [dbo].[tbFacturaDetalles]
   AFTER INSERT
AS 
BEGIN
	

	DECLARE @NuevoStock int = (SELECT t1.productoStock from [tbProductos] AS t1 WHERE t1.productoId = (SELECT t1.productoId from inserted AS t1)) - (SELECT t1.facturaDetalle_catidad from inserted AS t1 WHERE t1.productoId = (SELECT t1.productoId from inserted AS t1))

UPDATE [dbo].[tbProductos]
   SET [productoStock] = @NuevoStock
 WHERE productoId = (SELECT t1.productoId from inserted AS t1)


END
GO
go



-------------------------------------------------------------------------------------------

INSERT INTO [dbo].[tbUsuarios]
           ([usuarioUsuario]
           ,[usuarioContrASenia]
           ,[empleadoId]
           ,[usuarioUsuarioCreacion]
           ,[usuarioFechaCreacion]
           ,[usuarioUsuarioModificacion]
           ,[usuarioFechaModificacion]
           ,[usuarioEstado])
     VALUES
           ('admin',HASHBYTES('SHA2_512','123'),1,1,GETDATE(),null,null,1)
GO


INSERT INTO [dbo].[tbDepartamentos]
VALUES ('01', 'Atlantida', GETDATE(), 1,null,null,1),
	   ('02', 'Colon', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Copan', GETDATE(), 1,null,null,1),
	   ('05', 'Cortes', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Paraiso', GETDATE(), 1,null,null,1),
	   ('08', 'Francisco Morazan', GETDATE(), 1,null,null,1),
	   ('09', 'GraciAS a Dios', GETDATE(), 1,null,null,1),
	   ('10', 'Intibuca', GETDATE(), 1,null,null,1),
	   ('11', 'IslAS de la Bahia', GETDATE(), 1,null,null,1),
	   ('12', 'La Paz', GETDATE(), 1,null,null,1),
	   ('13', 'Lempira', GETDATE(), 1,null,null,1),
	   ('14', 'Ocotepeque', GETDATE(), 1,null,null,1),
	   ('15', 'Olancho', GETDATE(), 1,null,null,1),
	   ('16', 'Santa Brbara', GETDATE(), 1,null,null,1),
	   ('17', 'Valle', GETDATE(), 1,null,null,1),
	   ('18', 'Yoro', GETDATE(), 1,null,null,1)

INSERT INTO [dbo].[tbMunicipios]([municipioId], [municipioNombre], [departamentoId], [municipioFechaCreacion],[municipioUsuarioCreacion],[municipioFechaModificacion], [municipioUsuarioModificacion],[municipioEstado])
VALUES ('0101', 'La Ceiba', '01', GETDATE(), 1,null,null,1),
	   ('0107', 'Tela', '01', GETDATE(), 1,null,null,1),
	   ('0301', 'Comayagua', '03', GETDATE(), 1,null,null,1),
	   ('0401', 'Santa Rosa de Copan', '04', GETDATE(), 1,null,null,1),
	   ('0501', 'San Pedro Sula', '05', GETDATE(), 1,null,null,1),
	   ('0502', 'Choloma', '05', GETDATE(), 1,null,null,1),
	   ('0511', 'Villanueva', '05', GETDATE(), 1,null,null,1),
	   ('0801', 'Distrito Central', '08', GETDATE(), 1,null,null,1),
	   ('0901', 'Puerto Lempira', '09', GETDATE(), 1,null,null,1),
	   ('1001', 'La Esperanza', '10', GETDATE(), 1,null,null,1),
	   ('1101', 'Roatan', '11', GETDATE(), 1,null,null,1)

	   INSERT INTO [dbo].[tbEstadosCiviles]
VALUES ('C', 'CASado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('S', 'Soltero(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('D', 'Divorciado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('V', 'Viudo(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ('U', 'Union libre',  GETDATE(), 1, NULL, NULL, 1)


	   Insert INTO [dbo].[tbCargos]
	   Values('Jefe',GetDate(),1,null,null,1)

INSERT INTO [dbo].[tbEmpleados]
           ([empleadoNombre]
           ,[empleadoApellido]
           ,[empleadoSexo]
           ,[municipioId]
           ,[empleadoDireccionExacta]
           ,[estadoCivilId]
           ,[empleadoTelefono]
           ,[empleadoCorreoElectronico]
           ,[empleadoFechaNacimiento]
           ,[empleadoFechaContratacion]
           ,[cargoId]
           ,[empleadoFechaCreacion]
           ,[empleadoUsuarioCreacion]
           ,[empleadoFechaModificacion]
           ,[empleadoUsuarioModificacion]
           ,[empleadoEstado])
     VALUES
           ('Daniel','Espinoza' ,'M','0501' ,'Col. Municipal','S' ,'87756952' ,'daniele09099@gmail.com','02-04-2005' ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
GO



ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usuarioUsuarioCreacion_usuarioId FOREIGN KEY([usuarioUsuarioCreacion]) REFERENCES tbUsuarios(usuarioId);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usuarioUsuarioModificacion_usuarioId FOREIGN KEY([usuarioUsuarioModificacion]) REFERENCES tbUsuarios(usuarioId);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbEmpleados_empleadoId FOREIGN KEY([empleadoId]) REFERENCES tbEmpleados([empleadoId]);



INSERT INTO [dbo].[tbMetodoPago]
           ([metodoPagoId]
           ,[metodoPagoDescripcion]
           ,[metodoPagoFechaCreacion]
           ,[metodoPagoUsuarioCreacion]
           ,[metodoPagoFechaModificacion]
           ,[metodoPagoUsuarioModificacion]
           ,[metodoPagoEstado])
     VALUES
           ('E','Efectivo',GetDate(),1,null ,null,1),
           ('C','Tarjeta de Credito',GetDate(),1,null ,null,1),
           ('D','Tarjeta de Debito',GetDate(),1,null ,null,1)
GO

INSERT INTO [dbo].[tbProveedores]
           ([proveedorNombre]
           ,[municipioId]
           ,[proveedorDireccionExacta]
           ,[proveedorTelefono]
           ,[proveedorEmail]
           ,[proveedorFechaCreacion]
           ,[proveedorUsuarioCreacion]
           ,[proveedorFechaModificacion]
           ,[proveedorUsuarioModificacion]
           ,[proveedorEstado])
     VALUES
           ('Emsula','0501','Bulevar lAS torres','25002010','emsula@gmail.com',GetDate(),1,null,null ,1),
		   ('RicASula','0501','Satelite','90002010','ricASula@gmail.com',GetDate(),1,null,null ,1),
		   ('lokilo','0501','Salida la lima','74550020','lokilo@gmail.com',GetDate(),1,null,null ,1),
		   ('Pollos Norteno','0501','15 calle','95660022','nortenios@gmail.com',GetDate(),1,null,null ,1),
		   ('Policarpio','0501','7 Calle','85556320','policarpio@gmail.com',GetDate(),1,null,null ,1)

GO


INSERT INTO [dbo].[tbClientes]
           ([clienteNombre]
           ,[clienteApellido]
           ,[municipioId]
           ,[clienteDireccionExacta]
           ,[clienteTelefono]
           ,[clienteCorreoElectronico]
           ,[clienteFechaCreacion]
           ,[clienteUsuarioCreacion]
           ,[clienteFechaModificacion]
           ,[clienteUsuarioModificacion]
           ,[clienteEstado])
     VALUES
			('Comprador Final','NA','0501','NA','NA','NA',getDate(),1,null,null,1),
           ('Daniel','Martinez','0501','C10 15','87756952','daniel.martinez@gmail.com',getDate(),1,null,null,1),
		   ('Christopher','Aguiar Garcia','0501','Col Satelite','95299620','chrisaguila@gmail.com',getDate(),1,null,null,1),
		   ('Mario','Hernandez','0501','Ciudad nueva','74552012','marioh@gmail.com',getDate(),1,null,null,1)
GO



INSERT INTO [dbo].[tbCategoria]
           ([categoriaDescripcion]
           ,[categoriaFechaCreacion]
           ,[categoriaUsuarioCreacion]
           ,[categoriaFechaModificacion]
           ,[categoriaUsuarioModificacion]
           ,[categoriaEstado])
     VALUES
           ('Carnes',GETDATE(),'1',null,null,1),
		   ('Vegetales',GETDATE(),'1',null,null,1),
		   ('Juguetes',GETDATE(),'1',null,null,1),
		   ('Lacteos',GETDATE(),'1',null,null,1),
		   ('Medicamentos',GETDATE(),'1',null,null,1),
		   ('Electronicos',GETDATE(),'1',null,null,1),
		   ('Domesticos',GETDATE(),'1',null,null,1)
GO




INSERT INTO [dbo].[tbProductos]
           ([productoNombre]
           ,[productoPrecio]
           ,[categoriaId]
           ,[proveedorId]
           ,[productoStock]
           ,[productoFechaCreacion]
           ,[productoUsuarioCreacion]
           ,[productoFechaModificacion]
           ,[productoUsuarioModificacion]
           ,[productoEstado])
     VALUES
           ('Pollo',38.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('Carne Molida',30.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('Chuleta',42.5,1,4,0 ,GETDATE(),1,null,null,1),
		   ('PapAS',16.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Repollo',7.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Cebolla',20.5,2,3,0 ,GETDATE(),1,null,null,1),
		   ('Leche',30.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Queso',45.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Mantequilla',40.5,4,1,0 ,GETDATE(),1,null,null,1),
		   ('Acetaminofen',24,5,5,0 ,GETDATE(),1,null,null,1)
GO



INSERT INTO [dbo].[tbComprAS]
           ([proveedorId]
           ,[compraFecha]
           ,[compraFechaCreacion]
           ,[compraUsuarioCreacion]
           ,[compraFechaModificacion]
           ,[compraUsuarioModificacion]
           ,[compraEstado])
     VALUES
           (4,GETDATE(),GETDATE(),1,null,null,1),
		   (3,GETDATE(),GETDATE(),1,null,null,1),
		   (1,GETDATE(),GETDATE(),1,null,null,1),
		   (5,GETDATE(),GETDATE(),1,null,null,1)
GO


INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
           (1,1,20 ,35,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (1,2,20 ,28,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (1,3,20 ,40,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (2,4,20 ,15,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (2,5,20 ,5,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (2,6,20 ,18,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (3,7,20 ,28,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (3,8,20 ,42,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (3,9,20 ,38,GETDATE(),1,null ,null,1)
GO
INSERT INTO [dbo].[tbCompraDetalles]
           ([compraId],[productoId],[compraDetallecatidad],[compraDetallePrecio],[compraDetalleFechaCreacion],[compraDetalleUsuarioCreacion],[compraDetalleFechaModificacion],[compraDetalleUsuarioModificacion],[compraDetalleEstado])
     VALUES
		   (4,10,20 ,20,GETDATE(),1,null ,null,1)
GO

INSERT INTO [dbo].[tbFactura]
           ([clienteId]
           ,[facturaFecha]
           ,[empleadoid]
           ,[metodoPagoId]
           ,[facturaFechaCreacion]
           ,[facturaUsuarioCreacion]
           ,[facturaFechaModificacion]
           ,[facturaUsuarioModificacion]
           ,[facturaEstado])
     VALUES
           (1,GETDATE() ,1,'E',GETDATE(),'1' ,null,null,1),
		   (2,GETDATE() ,1,'C',GETDATE(),'1' ,null,null,1),
		   (3,GETDATE() ,1,'D',GETDATE(),'1' ,null,null,1)

GO

INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
           (1,7,2,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 7),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
		   (2,1,3,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 1),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
		   (2,2,4,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 2),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
		   (3,3,6,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 3),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
		   (3,4,8,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 4),GETDATE(),1,null,null,1)

GO
INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId],[productoId],[facturaDetalle_catidad],[facturaDetalle_Precio],[facturaDetalle_FechaCreacion],[facturaDetalle_UsuarioCreacion],[facturaDetalle_FechaModificacion],[facturaDetalle_UsuarioModificacion],[facturaDetalle_Estado])
     VALUES
		   (3,6,10,(SELECT T1.productoPrecio from tbProductos T1 WHERE t1.productoId = 6),GETDATE(),1,null,null,1)

GO

----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------PROCEDIMIENTOS ALMACENADOS---------------------------------
----------------------------------------------------------------------------------------------------------------



-- Index prooveedores
create or alter procedure UDP_BuscarProveedores
@frASe nvarchar(250)
AS
begin


SELECT   proveedorId,
		 proveedorNombre, 
		 t1.municipioId, 
		 t2.municipioNombre + ', '+ t3.departamentoNombre AS municipioNombre,
		 proveedorDireccionExacta, 
		 proveedorTelefono, 
		 proveedorEmail, 
		 proveedorFechaCreacion, 
		 proveedorUsuarioCreacion, 
		 proveedorFechaModificacion,
		  proveedorUsuarioModificacion, 
		  proveedorEstado     
FROM            tbProveedores t1 INNER JOIN  [dbo].[tbMunicipios]  t2
ON t1.municipioId = t2.municipioId INNER JOIN [dbo].[tbDepartamentos] t3 
ON t2.departamentoId = t3.departamentoId
WHERE  (( proveedorId LIKE '%'+@frASe+'%')
or     (proveedorNombre LIKE '%'+@frASe+'%')
or     (proveedorDireccionExacta LIKE '%'+@frASe+'%')
or     ( proveedorTelefono LIKE '%'+@frASe+'%')
or     ( proveedorEmail LIKE '%'+@frASe+'%'))
AND t1.proveedorEstado = 1
end 
GO




--Procedimiento Editar Proveedor

create or alter procedure UDP_EditarProveedores
@id int,
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(150),
@UsuarioModificacion INT
AS
begin


UPDATE tbProveedores
set proveedorNombre = @Nombre,
	proveedorDireccionExacta = @Direccion,
    proveedorTelefono= @Telefono, 
	proveedorEmail=@Email,
	proveedorFechaModificacion=  GETDATE(),
	proveedorUsuarioModificacion = @UsuarioModificacion
where proveedorId=@id
end

go
--Procedimiento Almacenado Eliminar Proveedor
create or alter procedure UDP_EliminarProveedores
@id int
AS
begin

UPDATE tbProveedores
set proveedorEstado = 0
where proveedorId=@id

end
go


 --Insertar Proveedores


 
create or alter procedure UDP_InsertarProveedores
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioCreacion INT
AS
begin



INSERT INTO [dbo].[tbProveedores]
           ([proveedorNombre]
           ,[municipioId]
           ,[proveedorDireccionExacta]
           ,[proveedorTelefono]
           ,[proveedorEmail]
           ,[proveedorFechaCreacion]
           ,[proveedorUsuarioCreacion]
           ,[proveedorFechaModificacion]
           ,[proveedorUsuarioModificacion]
           ,[proveedorEstado])
     VALUES
           (@Nombre,@Municipio,@Direccion,@Telefono,@Email,GetDate(),1,null,null ,1)

end

GO


--Insertar Usuario
CREATE PROCEDURE UDP_InsertarUsuario
	@Usuario Nvarchar(150),
	@ContrASenia Nvarchar(max),
	@Empleado int,
	@usuarioCreacion int

AS
BEGIN

Declare @PASsword Nvarchar(max) = (HASHBYTES('SHA2_512',@ContrASenia))

INSERT INTO [dbo].[tbUsuarios]
           ([usuarioUsuario]
           ,[usuarioContrASenia]
           ,[empleadoId]
           ,[usuarioUsuarioCreacion]
           ,[usuarioFechaCreacion]
           ,[usuarioUsuarioModificacion]
           ,[usuarioFechaModificacion]
           ,[usuarioEstado])
     VALUES
           (@Usuario
           ,@PASsword
           ,@Empleado
           ,@usuarioCreacion
           ,GetDate()
           ,null
           ,null
           ,1)

END
GO

--Index/Tabla Usuarios
CREATE PROCEDURE UDP_IndexUsuario

AS
BEGIN

SELECT [usuarioId]
      ,[usuarioUsuario]
      ,[usuarioContrASenia]
      ,T1.[empleadoId]
	  ,t2.empleadoNombre + ' ' + t2.empleadoApellido AS empleadoNombre 
      ,[usuarioUsuarioCreacion]
      ,[usuarioFechaCreacion]
      ,[usuarioUsuarioModificacion]
      ,[usuarioFechaModificacion]
      ,[usuarioEstado]
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.empleadoId = T2.empleadoId
  WHERE t1.usuarioEstado = 1

END
GO


--Editar Usuario 
CREATE PROCEDURE UDP_EdicionUsuario
	@IdEdicion INT,
	@ContrASenia Nvarchar(max),
	@Empleado int,
	@usuarioModificacion int
AS
BEGIN

Declare @PASsword Nvarchar(max) = (HASHBYTES('SHA2_512',@ContrASenia))

UPDATE [dbo].[tbUsuarios]
   SET [usuarioContrASenia] = @PASsword
      ,[empleadoId] = @Empleado
      ,[usuarioUsuarioModificacion] = @usuarioModificacion
      ,[usuarioFechaModificacion] = GetDate()
      ,[usuarioEstado] = 1
 WHERE usuarioId = @IdEdicion


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_BorrarUsuario
	@IdEdicion INT
AS
BEGIN

UPDATE [dbo].[tbUsuarios]
   SET [usuarioEstado] = 0
 WHERE usuarioId = @IdEdicion


END
GO


--Login
CREATE PROCEDURE UDP_Login
	@Usuario Nvarchar(100),
	@ContrASenia Nvarchar(Max)
AS
BEGIN

Declare @PASsword Nvarchar(max) = (HASHBYTES('SHA2_512',@ContrASenia))

SELECT [usuarioId]
      ,[usuarioUsuario]
      ,[usuarioContrASenia]
      ,T1.[empleadoId]
	  ,t2.empleadoNombre + ' ' + t2.empleadoApellido AS empleadoNombre 
      ,[usuarioUsuarioCreacion]
      ,[usuarioFechaCreacion]
      ,[usuarioUsuarioModificacion]
      ,[usuarioFechaModificacion]
      ,[usuarioEstado]
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.empleadoId = T2.empleadoId
  WHERE t1.usuarioContrASenia = @PASsword 
  AND t1.usuarioUsuario = @Usuario

END
GO

--index / buscar FacturAS

CREATE PROCEDURE UDP_IndexFacturAS
AS
BEGIN


SELECT [facturaId]
      ,t1.[clienteId]
	  , t2.clienteNombre + ' ' + t2.clienteApellido AS nombreCliente
      ,[facturaFecha]
      ,t1.[empleadoid]
	  ,t3.empleadoNombre + ' ' + t3.empleadoApellido AS nombreEmpleado
      ,t1.[metodoPagoId]
	  ,t4.metodoPagoDescripcion
      ,[facturaFechaCreacion]
      ,[facturaUsuarioCreacion]
      ,[facturaFechaModificacion]
      ,[facturaUsuarioModificacion]
      ,[facturaEstado]
  FROM [dbo].[tbFactura] t1 INNER JOIN [dbo].[tbClientes] t2
  ON t2.clienteId = t1.clienteId INNER JOIN [dbo].[tbEmpleados] t3
  ON t3.empleadoId = t1.empleadoid INNER JOIN [dbo].[tbMetodoPago] t4
  ON t4.metodoPagoId = t1.metodoPagoId
  WHERE facturaEstado = 1


END
GO



--index / buscar FacturaDetalles

CREATE OR ALTER PROCEDURE UDP_IndexFacturaDetalles
@FacturaId int
AS
BEGIN

SELECT [facturaDetalle_Id]
      ,t5.[facturaId]
	  ,t6.facturaFecha
	  ,t2.clienteId
	  ,t4.metodoPagoId
	  ,t2.clienteNombre + ' ' + t2.clienteApellido AS nombreCliente
	  ,t3.empleadoNombre + ' ' + t3.empleadoApellido AS nombreEmpleado
      ,t5.[productoId]
	  ,t7.productoNombre
	  ,t8.proveedorNombre
	  ,t4.metodoPagoDescripcion
      ,[facturaDetalle_catidad]
      ,[facturaDetalle_Precio]
	  ,t7.productoStock
	  ,[facturaDetalle_catidad] * [facturaDetalle_Precio] AS CantidadPrecio
	  ,(SELECT SUM([facturaDetalle_catidad] * [facturaDetalle_Precio]) from [dbo].[tbFacturaDetalles] WHERE facturaDetalle_Estado = 1 AND facturaId = @FacturaId) AS Subtotal
	  ,(SELECT SUM(([facturaDetalle_catidad] * [facturaDetalle_Precio]) *0.15) from [dbo].[tbFacturaDetalles] WHERE facturaDetalle_Estado = 1 AND facturaId = @FacturaId) AS IVA
	  ,(SELECT SUM(([facturaDetalle_catidad] * [facturaDetalle_Precio]) + (([facturaDetalle_catidad] * [facturaDetalle_Precio]) *0.15)) from [dbo].[tbFacturaDetalles] WHERE facturaDetalle_Estado = 1 AND facturaId = @FacturaId) AS Total
      ,[facturaDetalle_FechaCreacion]
      ,[facturaDetalle_UsuarioCreacion]
      ,[facturaDetalle_FechaModificacion]
      ,[facturaDetalle_UsuarioModificacion]
      ,[facturaDetalle_Estado]
  FROM [dbo].[tbFacturaDetalles] t5 INNER JOIN [dbo].[tbFactura] t6
  ON t5.facturaId = t6.facturaId INNER JOIN  [dbo].[tbClientes] t2
  ON t2.clienteId = t6.clienteId INNER JOIN [dbo].[tbEmpleados] t3
  ON t3.empleadoId = t6.empleadoid INNER JOIN [dbo].[tbMetodoPago] t4
  ON t4.metodoPagoId = t6.metodoPagoId INNER JOIN [dbo].[tbProductos] t7
  ON t7.productoId = t5.productoId INNER JOIN [dbo].[tbProveedores] t8
  ON t8.proveedorId = t7.proveedorId
  WHERE facturaDetalle_Estado = 1 AND t5.facturaId = @FacturaId



END
GO

--Insertar Factura
CREATE OR ALTER PROCEDURE UDP_InsertarFactura
@ClienteId Nvarchar(100),
@MetodoPago Nvarchar(100),
@EmpleadoId Nvarchar(100),
@UsuarioCreacion Nvarchar(100)
AS
BEGIN
INSERT INTO [dbo].[tbFactura]
           ([clienteId]
           ,[facturaFecha]
           ,[empleadoid]
           ,[metodoPagoId]
           ,[facturaFechaCreacion]
           ,[facturaUsuarioCreacion]
           ,[facturaFechaModificacion]
           ,[facturaUsuarioModificacion]
           ,[facturaEstado])
     VALUES
           (@ClienteId
           ,GETDATE()
           ,@EmpleadoId
           ,@MetodoPago
           ,GETDATE()
           ,@UsuarioCreacion
           ,null
           ,null
           ,1)


END
GO

--Borrar Factura
CREATE OR ALTER PROCEDURE UDP_BorrarFactura
	@IdEdicion INT
AS
BEGIN

UPDATE [dbo].[tbFactura]
   SET facturaEstado = 0
 WHERE facturaId = @IdEdicion

UPDATE [dbo].[tbFacturaDetalles]
   SET [facturaDetalle_Estado] = 0
 WHERE facturaId = @IdEdicion


END
GO




--Insertar FacturaDetalle
CREATE OR ALTER PROCEDURE UDP_InsertarFacturaDetalles
@FacturaId Nvarchar(100),
@ProductoId Nvarchar(100),
@Cantidad Nvarchar(100),
@UsuarioCreacion Nvarchar(100)
AS
BEGIN

Declare @Precio Nvarchar(100) = (SELECT productoPrecio From tbProductos WHERE productoEstado = 1 and productoId = @ProductoId)

INSERT INTO [dbo].[tbFacturaDetalles]
           ([facturaId]
           ,[productoId]
           ,[facturaDetalle_catidad]
           ,[facturaDetalle_Precio]
           ,[facturaDetalle_FechaCreacion]
           ,[facturaDetalle_UsuarioCreacion]
           ,[facturaDetalle_FechaModificacion]
           ,[facturaDetalle_UsuarioModificacion]
           ,[facturaDetalle_Estado])
     VALUES
           (@FacturaId
           ,@ProductoId
           ,@Cantidad
           ,@Precio
           ,GETDATE()
           ,@UsuarioCreacion
           ,null
           ,null
           ,1)




END
GO



--Cambiar ContrASenia
CREATE PROCEDURE UDP_CambiarContrASenia
	@Usuario Nvarchar(200),
	@ContrASenia Nvarchar(max)
AS
BEGIN

Declare @PASsword Nvarchar(max) = (HASHBYTES('SHA2_512',@ContrASenia))

UPDATE [dbo].[tbUsuarios]
   SET [usuarioContrASenia] = @PASsword
 WHERE usuarioUsuario = @Usuario


END
GO



--index / buscar Empleados

CREATE OR ALTER PROCEDURE UDP_IndexEmpleados
AS
BEGIN


SELECT [empleadoId]
      ,[empleadoNombre]
      ,[empleadoApellido]
	  ,empleadoNombre +' '+ empleadoApellido AS Nombre
      ,[empleadoSexo]
	  ,CASE
			WHEN empleadoSexo='M' THEN 'MASculino'
			WHEN empleadoSexo='F' THEN 'Femenino'
			ELSE 'Otro'
		END AS Sexo
      ,t1.[municipioId]
	  ,t4.municipioNombre + ', ' + t5.departamentoNombre AS Ciudad
      ,[empleadoDireccionExacta]
      ,t1.[estadoCivilId]
	  ,t2.estadoCivilNombre
      ,[empleadoTelefono]
      ,[empleadoCorreoElectronico]
      ,[empleadoFechaNacimiento]
	  ,DATEDIFF(YEAR, empleadoFechaNacimiento,GetDate()) AS Edad
      ,[empleadoFechaContratacion]
      ,t1.[cargoId]
	  ,t3.cargoNombre
      ,[empleadoFechaCreacion]
      ,[empleadoUsuarioCreacion]
      ,[empleadoFechaModificacion]
      ,[empleadoUsuarioModificacion]
      ,[empleadoEstado]
  FROM [dbo].[tbEmpleados] T1 INNER JOIN [dbo].[tbEstadosCiviles] T2
  ON T1.estadoCivilId = T2.estadoCivilId Inner JOIN [dbo].[tbCargos] T3
  ON t3.cargoId = t1.cargoId INNER JOIN [dbo].[tbMunicipios] T4
  ON t4.municipioId = t1.municipioId INNER JOIN [dbo].[tbDepartamentos] T5
  ON t4.departamentoId = t5.departamentoId
  WHERE empleadoEstado = 1



END
GO


--Insertar Empleado

CREATE OR ALTER PROCEDURE UDP_InsertarEmpleados
	@Nombre Nvarchar(150),
	@Apellido Nvarchar(150),
	@Sexo char(1),
	@Municipio Nvarchar(10),
	@DireccionExacta Nvarchar(500),
	@EstadoCivil char(1),
	@Telefono Nvarchar(20),
	@Correo Nvarchar(100),
	@FechaNacimiento Nvarchar(100),
	@FechaContaratacion Nvarchar(100),
	@Cargo Nvarchar(20),
	@UsuarioCreacion int
AS
BEGIN

INSERT INTO [dbo].[tbEmpleados]
           ([empleadoNombre]
           ,[empleadoApellido]
           ,[empleadoSexo]
           ,[municipioId]
           ,[empleadoDireccionExacta]
           ,[estadoCivilId]
           ,[empleadoTelefono]
           ,[empleadoCorreoElectronico]
           ,[empleadoFechaNacimiento]
           ,[empleadoFechaContratacion]
           ,[cargoId]
           ,[empleadoFechaCreacion]
           ,[empleadoUsuarioCreacion]
           ,[empleadoFechaModificacion]
           ,[empleadoUsuarioModificacion]
           ,[empleadoEstado])
     VALUES
           (@Nombre
           ,@Apellido
           ,@Sexo
           ,@Municipio
           ,@DireccionExacta
           ,@EstadoCivil
           ,@Telefono
           ,@Correo
           ,@FechaNacimiento
           ,@FechaContaratacion
           ,@Cargo
           ,GETDATE()
           ,@UsuarioCreacion
           ,null
           ,null
           ,1)



END
GO





--Insertar Empleado

CREATE OR ALTER PROCEDURE UDP_EditarEmpleados
	@Id INT,
	@Nombre Nvarchar(150),
	@Apellido Nvarchar(150),
	@Sexo char(1),
	@Municipio Nvarchar(10),
	@DireccionExacta Nvarchar(500),
	@EstadoCivil char(1),
	@Telefono Nvarchar(20),
	@Correo Nvarchar(100),
	@FechaNacimiento Nvarchar(100),
	@FechaContaratacion Nvarchar(100),
	@Cargo Nvarchar(20),
	@UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET [empleadoNombre] = @Nombre
      ,[empleadoApellido] = @Apellido
      ,[empleadoSexo] = @Sexo
      ,[municipioId] = @Municipio
      ,[empleadoDireccionExacta] = @DireccionExacta
      ,[estadoCivilId] = @EstadoCivil
      ,[empleadoTelefono] = @Telefono
      ,[empleadoCorreoElectronico] = @Correo
      ,[empleadoFechaNacimiento] = @FechaNacimiento
      ,[empleadoFechaContratacion] = @FechaContaratacion
      ,[cargoId] = @Cargo
      ,[empleadoFechaModificacion] = GETDATE()
      ,[empleadoUsuarioModificacion] = @UsuarioModificacion
 WHERE empleadoId = @Id



END
GO



--Insertar Empleado

CREATE OR ALTER PROCEDURE UDP_EliminarEmpleados
	@Id INT
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET empleadoEstado = 0
 WHERE empleadoId = @Id



END
GO






--Insertar Usuario
CREATE OR ALTER PROCEDURE UDP_InsertarCargos
	@Cargo Nvarchar(150),
	@usuarioCreacion int

AS
BEGIN
INSERT INTO [dbo].[tbCargos]
           ([cargoNombre]
           ,[cargoFechaCreacion]
           ,[cargoUsuarioCreacion]
           ,[cargoFechaModificacion]
           ,[cargoUsuarioModificacion]
           ,[cargoEstado])
     VALUES
           (@Cargo
           ,GETDATE()
           ,@usuarioCreacion
           ,null
           ,null
           ,1)


END
GO

--Index/Tabla Usuarios
CREATE OR ALTER PROCEDURE UDP_IndexCargos

AS
BEGIN

SELECT [cargoId]
      ,[cargoNombre]
      ,[cargoFechaCreacion]
      ,[cargoUsuarioCreacion]
      ,[cargoFechaModificacion]
      ,[cargoUsuarioModificacion]
      ,[cargoEstado]
  FROM [dbo].[tbCargos]
	WHERE cargoEstado = 1

END
GO


--Editar Usuario 
CREATE OR ALTER PROCEDURE UDP_EditarCargo
	@IdEdicion INT,
	@Cargo Nvarchar(200),
	@usuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCargos]
   SET [cargoNombre] = @Cargo
      ,[cargoFechaModificacion] = GETDATE()
      ,[cargoUsuarioModificacion] = @usuarioModificacion
 WHERE cargoId = @IdEdicion


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_BorrarCargo
	@IdEdicion INT
AS
BEGIN


UPDATE [dbo].[tbCargos]
   SET [cargoEstado] = 0
 WHERE cargoId = @IdEdicion


END
GO











--Insertar Usuario
CREATE OR ALTER PROCEDURE UDP_InsertarCategoriAS
	@Categoria Nvarchar(150),
	@usuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbCategoria]
           ([categoriaDescripcion]
           ,[categoriaFechaCreacion]
           ,[categoriaUsuarioCreacion]
           ,[categoriaFechaModificacion]
           ,[categoriaUsuarioModificacion]
           ,[categoriaEstado])
     VALUES
           (@Categoria
           ,GETDATE()
           ,@usuarioCreacion
           ,null
           ,null
           ,1)


END
GO

--Index/Tabla Usuarios
CREATE OR ALTER PROCEDURE UDP_IndexCategoriAS

AS
BEGIN

SELECT [categoriaId]
      ,[categoriaDescripcion]
      ,[categoriaFechaCreacion]
      ,[categoriaUsuarioCreacion]
      ,[categoriaFechaModificacion]
      ,[categoriaUsuarioModificacion]
      ,[categoriaEstado]
  FROM [dbo].[tbCategoria]
WHERE categoriaEstado = 1

END
GO


--Editar Usuario 
CREATE OR ALTER PROCEDURE UDP_EditarCategoriAS
	@IdEdicion INT,
	@Categoria Nvarchar(200),
	@usuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCategoria]
   SET [categoriaDescripcion] = @Categoria
      ,[categoriaFechaModificacion] = GETDATE()
      ,[categoriaUsuarioModificacion] = @usuarioModificacion
 WHERE categoriaId = @IdEdicion


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_BorrarCaTegoriAS
	@IdEdicion INT
AS
BEGIN


UPDATE [dbo].[tbCategoria]
   SET [categoriaEstado] = 0
 WHERE categoriaId = @IdEdicion


END
GO





--------------------------------------------------------------------


-- Index prooveedores
create or alter procedure UDP_BuscarProveedores
@frASe nvarchar(250)
AS
begin


SELECT   proveedorId,
		 proveedorNombre, 
		 t1.municipioId, 
		 t2.municipioNombre + ', '+ t3.departamentoNombre AS municipioNombre,
		 proveedorDireccionExacta, 
		 proveedorTelefono, 
		 proveedorEmail, 
		 proveedorFechaCreacion, 
		 proveedorUsuarioCreacion, 
		 proveedorFechaModificacion,
		  proveedorUsuarioModificacion, 
		  proveedorEstado     
FROM            tbProveedores t1 INNER JOIN  [dbo].[tbMunicipios]  t2
ON t1.municipioId = t2.municipioId INNER JOIN [dbo].[tbDepartamentos] t3 
ON t2.departamentoId = t3.departamentoId
WHERE  (( proveedorId LIKE '%'+@frASe+'%')
or     (proveedorNombre LIKE '%'+@frASe+'%')
or     (proveedorDireccionExacta LIKE '%'+@frASe+'%')
or     ( proveedorTelefono LIKE '%'+@frASe+'%')
or     ( proveedorEmail LIKE '%'+@frASe+'%'))
AND t1.proveedorEstado = 1
end 
GO




--Procedimiento Editar Proveedor

create or alter procedure UDP_EditarProveedores
@id int,
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioModificacion INT
AS
begin


UPDATE tbProveedores
set proveedorNombre = @Nombre,
    municipioId= @Municipio,
	proveedorDireccionExacta = @Direccion,
    proveedorTelefono= @Telefono,
	proveedorEmail=@Email,
	proveedorFechaModificacion=  GETDATE(),
	proveedorUsuarioModificacion = @UsuarioModificacion
where proveedorId=@id
end

go
--Procedimiento Eliminar Proveedor
create or alter procedure UDP_EliminarProveedores
@id int
AS
begin

UPDATE tbProveedores
set proveedorEstado = 0
where proveedorId=@id

end
go


 --Insertar Proveedores

 
 
create or alter procedure UDP_InsertarProveedores
@Nombre nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioCreacion INT
AS
begin
INSERT INTO [dbo].[tbProveedores]
           ([proveedorNombre]
           ,[municipioId]
           ,[proveedorDireccionExacta]
           ,[proveedorTelefono]
           ,[proveedorEmail]
           ,[proveedorFechaCreacion]
           ,[proveedorUsuarioCreacion]
           ,[proveedorFechaModificacion]
           ,[proveedorUsuarioModificacion]
           ,[proveedorEstado])
     VALUES
           (@Nombre,@Municipio,@Direccion,@Telefono,@Email,GetDate(),1,null,null ,1)

end
go
--Procedimiento Index cliente
create or alter procedure UDP_LlenarCliente
AS
begin
SELECT  clienteId
      ,clienteNombre
      ,clienteApellido
	  ,t1.municipioId
      ,t2.municipioNombre + ', '+ t3.departamentoNombre AS municipioNombre
      ,clienteDireccionExacta
      ,clienteTelefono
      ,clienteCorreoElectronico
      ,clienteFechaCreacion
      ,clienteUsuarioCreacion
      ,clienteFechaModificacion
      ,clienteUsuarioModificacion
      ,clienteEstado
FROM tbClientes t1 INNER JOIN  [dbo].[tbMunicipios]  t2
ON t1.municipioId = t2.municipioId INNER JOIN [dbo].[tbDepartamentos] t3 
ON t2.departamentoId = t3.departamentoId
WHERE  t1.clienteEstado = 1
end 
go
--UDP_LlenarCliente

--Procedimiento Insertar clientes

create or alter procedure UDP_InsertarClientes
@Nombre nvarchar(220),
@Apellido nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioCreacion INT
AS
begin
INSERT INTO  tbClientes
       (
       clienteNombre
      ,clienteApellido
	  ,municipioId
      ,clienteDireccionExacta
      ,clienteTelefono
      ,clienteCorreoElectronico
      ,clienteFechaCreacion
      ,clienteUsuarioCreacion
      ,clienteFechaModificacion
      ,clienteUsuarioModificacion
      ,clienteEstado)
     VALUES
           (@Nombre,@Apellido,@Municipio,@Direccion,@Telefono,@Email,GetDate(),1,null,null ,1)
end
go

--Procedimiento Editar Clientes
create or alter procedure UDP_EditarClientes
@id int,
@Nombre nvarchar(220),
@Apellido nvarchar(220),
@Municipio nvarchar(200),
@Direccion nvarchar(500),
@Telefono nvarchar(20),
@Email  nvarchar(100),
@UsuarioModificacion INT
AS
begin


UPDATE tbClientes
set clienteNombre = @Nombre,
    clienteApellido = @Apellido,
    municipioId= @Municipio,
	clienteDireccionExacta = @Direccion,
    clienteTelefono= @Telefono,
	clienteCorreoElectronico=@Email,
	clienteFechaModificacion=  GETDATE(),
	clienteUsuarioModificacion = @UsuarioModificacion
where clienteId=@id
end
go

--Procedimiento Eliminar Clientes
create or alter procedure UDP_EliminarClientes
@id int
AS
begin

UPDATE tbClientes
set clienteEstado = 0
where clienteId=@id

end
go


--Procedimiento Index Producto
create or alter procedure UDP_LlenarProductos
AS
begin    
SELECT productoId
      ,productoNombre
	  ,productoPrecio
      ,t1.categoriaId
	  ,t3.categoriaDescripcion
	  ,t1.proveedorId
	  ,t2.proveedorNombre 
      ,productoStock
      ,productoFechaCreacion
      ,productoUsuarioCreacion
      ,productoFechaModificacion
      ,productoUsuarioModificacion
	  ,productoEstado 
FROM tbProductos t1 INNER JOIN tbProveedores t2
on t1.proveedorId = t2.proveedorId INNER JOIN tbCategoria t3
on t1.categoriaId = t3.categoriaId
WHERE  t1. productoEstado  = 1
end 
go
--Procedimiento Borrar Producto

create or alter procedure UDP_EliminarProducto
@id int
AS
begin

UPDATE tbProductos
set productoEstado = 0
where productoId=@id

end
go


--Prsocedimiento Insertar Producto
create or alter procedure UDP_InsertarProductos
@Nombre nvarchar(220),
@Precio decimal,
@categoria int,
@Proveedor int,
@Stock int,
@UsuarioCreacion int
AS
begin
INSERT INTO [dbo].[tbProductos]
          ( 
		   productoNombre, 
		   productoPrecio, 
		   categoriaId, 
		   proveedorId, 
		   productoStock,
		   productoFechaCreacion, 
		   productoUsuarioCreacion, 
		   productoFechaModificacion, 
		   productoUsuarioModificacion, 
		   productoEstado)
     VALUES
           (@Nombre,@Precio,@categoria,@Proveedor,@Stock,GetDate(),@UsuarioCreacion,null,null ,1)

end

go
--Procedimiento Editar Producto
create or alter procedure UDP_EditarProducto
@id int,
@Nombre nvarchar(220),
@Precio decimal,
@categoria int,
@Proveedor int,
@Stock int,
@UsuarioModificacion int
AS
begin
UPDATE tbProductos
set  [productoNombre]= @Nombre,
   [productoPrecio] =@Precio,
   [categoriaId] = @categoria,
	[proveedorId] = @Proveedor ,
    [productoStock]= @Stock,
	[productoFechaModificacion]=  GETDATE(),
	[productoUsuarioModificacion] = @UsuarioModificacion
where [productoId]=@id
end