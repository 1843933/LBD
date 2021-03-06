USE [master]
GO
/****** Object:  Database [PuntoDeVenta]    Script Date: 31/03/2020 12:14:16 a. m. ******/
CREATE DATABASE [PuntoDeVenta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PuntoDeVenta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PuntoDeVenta.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PuntoDeVenta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PuntoDeVenta_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PuntoDeVenta] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PuntoDeVenta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ARITHABORT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PuntoDeVenta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PuntoDeVenta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PuntoDeVenta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PuntoDeVenta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET RECOVERY FULL 
GO
ALTER DATABASE [PuntoDeVenta] SET  MULTI_USER 
GO
ALTER DATABASE [PuntoDeVenta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PuntoDeVenta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PuntoDeVenta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PuntoDeVenta] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PuntoDeVenta] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PuntoDeVenta', N'ON'
GO
ALTER DATABASE [PuntoDeVenta] SET QUERY_STORE = OFF
GO
USE [PuntoDeVenta]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[iDomicilioId] [int] NOT NULL,
	[vCalle] [varchar](30) NULL,
	[iNumero] [int] NULL,
	[vColonia] [varchar](30) NULL,
	[vCiudad] [varchar](30) NULL,
	[iCodPostal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iDomicilioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[iEmpleadoId] [int] NOT NULL,
	[vNombre] [varchar](20) NULL,
	[vApPat] [varchar](20) NULL,
	[vApMat] [varchar](20) NULL,
	[vNomCompleto]  AS (((([vNombre]+' ')+[vApPat])+' ')+[vApMat]),
	[cTurno] [char](1) NULL,
	[iTelefono] [int] NULL,
	[dFechaNac] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[dFechaNac],getdate())),
	[iPuesto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iEmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[iInventarioId] [int] NOT NULL,
	[iSucursal] [int] NULL,
	[iProducto] [int] NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iInventarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[iNegocioId] [int] NOT NULL,
	[iResponsable] [int] NULL,
	[iTelefono] [int] NULL,
	[iDomicilio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iNegocioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[iPedidoId] [int] NOT NULL,
	[iProveedor] [int] NULL,
	[dtPedFecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoDetalle]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoDetalle](
	[iPedidoDetalleId] [int] NOT NULL,
	[iPedRef] [int] NULL,
	[vProdPedido] [varchar](50) NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPedidoDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[iProductosId] [int] NOT NULL,
	[vNombre] [varchar](30) NULL,
	[vMarca] [varchar](30) NULL,
	[fPrecio] [float] NULL,
	[iCantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iProductosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[iProveedorId] [int] NOT NULL,
	[iProducto] [int] NULL,
	[vNombre] [varchar](30) NULL,
	[vEmpresa] [varchar](30) NULL,
	[fCosto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[iPuestosId] [int] NOT NULL,
	[vDescripcion] [varchar](50) NULL,
	[fSueldo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iPuestosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[iSucursalId] [int] NOT NULL,
	[iGerente] [int] NULL,
	[iDomiciolio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iSucursalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[iTicketId] [int] NOT NULL,
	[dtFechaCompra] [datetime] NULL,
	[iNegocio] [int] NULL,
	[iEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iTicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDetalle]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDetalle](
	[iTickDetalleId] [int] NOT NULL,
	[iTickRef] [int] NULL,
	[iProducto] [int] NULL,
	[iCantidad] [int] NULL,
	[fPrecio] [float] NULL,
	[fTotal] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[iTickDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPago]    Script Date: 31/03/2020 12:14:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPago](
	[iTipoPagoId] [int] NOT NULL,
	[vDescripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[iTipoPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (1, N'Julián Villagrán', 1102, N'Centro', N' Monterrey', 64000)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (2, N'Vicente Guerrero', 900, N'Centro', N'Monterrey', 64000)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (3, N'Alfonso Reyes', 1581, N'Sarabia', N'Monterrey', 64490)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (4, N'Francisco I. Madero', 508, N'Centro', N'Monterrey', 64000)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (5, N'Coatlicue', 291, N'Fama II', N'Santa Catarina', 66116)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (6, N'Ignacio Morones Prieto', 789, N'Nemesio García Naranjo', N'San Pedro Garza García', 66239)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (7, N'Río Amazonas', 552, N'Del Valle', N'San Pedro Garza García', 66220)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (8, N'Anillo Periferico', 1606, N'San Jeronimo', N'Monterrey', 64634)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (9, N'Vasconcelos Poniente', 725, N'Del Valle', N'San Pedro Garza García', 66220)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (10, N'Las Puentes', 663, N'Paseo de las Puentes', N'San Nicolás de los Garza', 66460)
INSERT [dbo].[Domicilio] ([iDomicilioId], [vCalle], [iNumero], [vColonia], [vCiudad], [iCodPostal]) VALUES (11, N'Cordillera de los Andes', 1230, N'Hacienda de Santo Domingo', N'San Nicolás de los Garza', 66449)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (1, N'José ', N'Sanchéz', N'López', N'M', 56424731, CAST(N'1983-08-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (2, N'Guadalupe', N'González', N'Salas', N'M', 90369126, CAST(N'1976-12-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (3, N'Laura', N'Gomez', N'Estrada', N'M', 94058124, CAST(N'1990-03-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (4, N'Erika', N'Mata', N'Guerra', N'M', 56692334, CAST(N'1994-05-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (5, N'Valentín', N'Elizondo', N'Salas', N'M', 17927054, CAST(N'1967-02-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (6, N'Fernando', N'Arellano', N'Flores', N'M', 66616022, CAST(N'1980-02-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (7, N'María', N'Enriquez', N'Salinas', N'M', 34220999, CAST(N'1996-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (8, N'Enrique', N'Fuentes', N'Huerta', N'M', 23604406, CAST(N'1985-09-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (9, N'Osvaldo', N'Barrera', N'Chapa', N'M', 2609260, CAST(N'1989-12-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (10, N'Antonia', N'Sada', N'Juarez', N'M', 72156688, CAST(N'2000-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (11, N'Rosa', N'Melendez', N'Garza', N'M', 44350786, CAST(N'1998-12-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (12, N'Eduardo', N'Cruz', N'Lomas', N'T', 51532974, CAST(N'2001-06-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (13, N'Guillermo', N'Leyva', N'Torres', N'T', 79973722, CAST(N'1992-03-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (14, N'Gabriel', N'Arredondo', N'Vargas', N'T', 88252688, CAST(N'1996-07-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (15, N'Ramona', N'Llanas', N'Redondo', N'T', 64161158, CAST(N'1966-10-13T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (16, N'Fernanda', N'Esparza', N'Aguirre', N'T', 75376157, CAST(N'1990-02-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (17, N'Cinthya', N'Teniente', N'Lopez', N'T', 86365896, CAST(N'1987-08-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (18, N'Jorge', N'Gaspar', N'Herrera', N'T', 65389998, CAST(N'1989-09-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (19, N'Mariana', N'Zuñiga', N'Cortes', N'T', 28300096, CAST(N'1979-12-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (20, N'Carla', N'Martinez', N'Mendoza', N'T', 60791790, CAST(N'1976-01-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (21, N'Pablo', N'Torres', N'Alva', N'T', 32940954, CAST(N'1991-03-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (22, N'Javier', N'Sosa', N'Nuñez', N'T', 80564689, CAST(N'1983-08-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (23, N'Oscar', N'Guerrero', N'Lopez', N'N', 90442194, CAST(N'1984-07-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (24, N'Elena', N'Oviedo', N'Mendez', N'N', 90067879, CAST(N'1993-10-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (25, N'Carlos', N'Benavides', N'Vazquez', N'N', 87600985, CAST(N'1968-09-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (26, N'Estela', N'Fernandez', N'Gonzalez', N'N', 11834830, CAST(N'1969-03-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (27, N'Juanita', N'Garcia', N'Lomas', N'N', 68735397, CAST(N'1979-09-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (28, N'Ivan', N'Mata', N'Hernandez', N'N', 53038443, CAST(N'1985-03-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (29, N'Esteban', N'Gonzalez', N'Hinojosa', N'N', 85215024, CAST(N'1982-06-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (30, N'Carmela', N'Ramos', N'Guevara', N'N', 80619163, CAST(N'1988-05-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (31, N'Rosa', N'Martinez', N'Santos', N'N', 38585645, CAST(N'1984-12-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (32, N'Sarah', N'Quintero', N'Rojas', N'N', 97280149, CAST(N'1992-06-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (33, N'Raymundo', N'Luevano', N'Mora', N'N', 77168218, CAST(N'1989-07-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (34, N'Omar', N'Salazar', N'Quiroz', N'M', 83266342, CAST(N'2000-12-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (35, N'Dinah', N'Ibarra', N'Garcia', N'M', 60281991, CAST(N'1986-04-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (36, N'Amy', N'Hernandez', N'Roll', N'M', 67402753, CAST(N'1996-08-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (37, N'Edgar', N'Casarez', N'Siller', N'M', 28647669, CAST(N'1995-01-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (39, N'Monica', N'Almendarez', N'Polo', N'M', 30754138, CAST(N'1970-11-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (40, N'Brenda', N'Castro', N'Flores', N'N', 55632045, CAST(N'1998-06-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (41, N'Oswaldo', N'Rivera', N'Montes', N'N', 69544957, CAST(N'1986-05-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (42, N'Claudio', N'Peña', N'Sanchez', N'M', 86816362, CAST(N'2000-07-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Empleados] ([iEmpleadoId], [vNombre], [vApPat], [vApMat], [cTurno], [iTelefono], [dFechaNac], [iPuesto]) VALUES (44, N'Nora', N'Martinez', N'Esquivel', N'M', 18384473, CAST(N'1993-11-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (1, 41, 22498583, 1)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (2, 13, 30439386, 2)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (3, 14, 15518486, 3)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (4, 15, 14598364, 4)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (5, 16, 52043817, 5)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (6, 17, 41766754, 6)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (7, 18, 94151815, 7)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (8, 19, 44778588, 8)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (9, 20, 43021979, 9)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (10, 21, 10777698, 10)
INSERT [dbo].[Negocio] ([iNegocioId], [iResponsable], [iTelefono], [iDomicilio]) VALUES (11, 22, 98850746, 11)
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (2, 2, CAST(N'2020-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (3, 3, CAST(N'2020-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (4, 4, CAST(N'2020-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (5, 5, CAST(N'2020-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (6, 6, CAST(N'2020-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (7, 7, CAST(N'2020-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (8, 8, CAST(N'2020-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (9, 9, CAST(N'2020-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (10, 10, CAST(N'2020-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (11, 11, CAST(N'2020-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (12, 12, CAST(N'2020-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Pedido] ([iPedidoId], [iProveedor], [dtPedFecha]) VALUES (13, 13, CAST(N'2020-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (2, 2, N'Chicharos', 10)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (3, 3, N'Mapple', 18)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (4, 4, N'Saladitas', 12)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (5, 5, N'Lechera', 15)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (6, 6, N'Jugo de manzana', 23)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (7, 7, N'Froot Loops', 18)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (8, 8, N'Rebanadas', 16)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (9, 9, N'Lysol', 15)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (10, 10, N'Mayonesa', 13)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (11, 11, N'Caldo de Pollo', 24)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (12, 12, N'Pizza Peperoni/FUD', 9)
INSERT [dbo].[PedidoDetalle] ([iPedidoDetalleId], [iPedRef], [vProdPedido], [iCantidad]) VALUES (13, 13, N'Galletas Polvorones', 6)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (1, N'Coca-Cola 500ml', N'Coca-Cola', 12.5, 15)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (2, N'Saladitas', N'Gamesa', 11.9, 20)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (3, N'Rebanadas', N'Bimbo', 5.5, 30)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (4, N'Mayonesa', N'HELLMANS', 22.9, 10)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (5, N'Lysol', N'Brand', 89.9, 13)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (6, N'Froot Loops 25g ', N'Kelloggs ', 7.49, 28)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (7, N'Chicharos ', N'Great Value', 7.64, 16)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (8, N'Maple ', N'Great Value', 13.99, 8)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (9, N'Lechera 387g ', N'Nestle ', 19.89, 21)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (10, N'Caldo de Pollo', N'Knor', 21.8, 15)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (11, N'Galletas Polvorones', N'Gamesa ', 13.46, 20)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (12, N'Jugo de Manzana ', N'Jumex ', 16.75, 19)
INSERT [dbo].[Productos] ([iProductosId], [vNombre], [vMarca], [fPrecio], [iCantidad]) VALUES (13, N'Pizza Peperoni/FUD ', N'Sigma', 24.58, 23)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (1, 1, N'Jaime Gonzalez', N'Arca Continental', 187.5)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (2, 7, N'Eduardo Perez', N'Great Value', 132.35)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (3, 8, NULL, N'Great Value', 111.92)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (4, 2, NULL, N'Gamesa', 238)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (5, 9, NULL, N'Nestle', 417.69)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (6, 12, NULL, N'Jumex', 318.25)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (7, 6, NULL, N'Kelloggs', 209.72)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (8, 3, NULL, N'Bimbo', 165)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (9, 5, NULL, N'Brand', 1168.7)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (10, 4, NULL, N'Hellmans', 229)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (11, 10, NULL, N'Knor', 327)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (12, 13, NULL, N'Sigma', 565.34)
INSERT [dbo].[Proveedores] ([iProveedorId], [iProducto], [vNombre], [vEmpresa], [fCosto]) VALUES (13, 11, NULL, N'Gamesa', 269.2)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (1, N'Encargado', 1575.89)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (2, N'Responsable', 1355.9)
INSERT [dbo].[Puestos] ([iPuestosId], [vDescripcion], [fSueldo]) VALUES (3, N'Ayudante General', 1150.5)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (1, 1, 1)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (2, 2, 2)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (3, 3, 3)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (4, 4, 4)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (5, 5, 5)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (6, 6, 6)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (7, 7, 7)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (8, 8, 8)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (9, 9, 9)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (10, 10, 10)
INSERT [dbo].[Sucursales] ([iSucursalId], [iGerente], [iDomiciolio]) VALUES (11, 11, 11)
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (1, N'Tarjeta de Crédito')
INSERT [dbo].[tipoPago] ([iTipoPagoId], [vDescripcion]) VALUES (2, N'Tarjeta')
/****** Object:  Index [indx_dFechaNac]    Script Date: 31/03/2020 12:14:19 a. m. ******/
CREATE NONCLUSTERED INDEX [indx_dFechaNac] ON [dbo].[Empleados]
(
	[dFechaNac] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Productos_vNombre]    Script Date: 31/03/2020 12:14:19 a. m. ******/
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [UC_Productos_vNombre] UNIQUE NONCLUSTERED 
(
	[vNombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Productos]    Script Date: 31/03/2020 12:14:19 a. m. ******/
CREATE NONCLUSTERED INDEX [indx_Productos] ON [dbo].[Productos]
(
	[vNombre] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Proveedores_iProducto]    Script Date: 31/03/2020 12:14:19 a. m. ******/
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [UC_Proveedores_iProducto] UNIQUE NONCLUSTERED 
(
	[iProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_Sucursales_iGerente]    Script Date: 31/03/2020 12:14:19 a. m. ******/
ALTER TABLE [dbo].[Sucursales] ADD  CONSTRAINT [UC_Sucursales_iGerente] UNIQUE NONCLUSTERED 
(
	[iGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([iPuesto])
REFERENCES [dbo].[Puestos] ([iPuestosId])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([iSucursal])
REFERENCES [dbo].[Sucursales] ([iSucursalId])
GO
ALTER TABLE [dbo].[Negocio]  WITH CHECK ADD FOREIGN KEY([iDomicilio])
REFERENCES [dbo].[Domicilio] ([iDomicilioId])
GO
ALTER TABLE [dbo].[Negocio]  WITH CHECK ADD FOREIGN KEY([iResponsable])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([iProveedor])
REFERENCES [dbo].[Proveedores] ([iProveedorId])
GO
ALTER TABLE [dbo].[PedidoDetalle]  WITH CHECK ADD FOREIGN KEY([iPedRef])
REFERENCES [dbo].[Pedido] ([iPedidoId])
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([iDomiciolio])
REFERENCES [dbo].[Domicilio] ([iDomicilioId])
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD FOREIGN KEY([iGerente])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([iEmpleado])
REFERENCES [dbo].[Empleados] ([iEmpleadoId])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([iNegocio])
REFERENCES [dbo].[Negocio] ([iNegocioId])
GO
ALTER TABLE [dbo].[TicketDetalle]  WITH CHECK ADD FOREIGN KEY([iProducto])
REFERENCES [dbo].[Productos] ([iProductosId])
GO
ALTER TABLE [dbo].[TicketDetalle]  WITH CHECK ADD FOREIGN KEY([iTickRef])
REFERENCES [dbo].[Ticket] ([iTicketId])
GO
USE [master]
GO
ALTER DATABASE [PuntoDeVenta] SET  READ_WRITE 
GO
