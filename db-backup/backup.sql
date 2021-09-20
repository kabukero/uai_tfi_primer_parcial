USE [master]
GO
/****** Object:  Database [tfi_1er_parcial]    Script Date: 9/19/2021 11:18:27 PM ******/
CREATE DATABASE [tfi_1er_parcial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tfi_1er_parcial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\tfi_1er_parcial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tfi_1er_parcial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\tfi_1er_parcial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tfi_1er_parcial] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tfi_1er_parcial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tfi_1er_parcial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET ARITHABORT OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tfi_1er_parcial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tfi_1er_parcial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tfi_1er_parcial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tfi_1er_parcial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tfi_1er_parcial] SET  MULTI_USER 
GO
ALTER DATABASE [tfi_1er_parcial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tfi_1er_parcial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tfi_1er_parcial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tfi_1er_parcial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [tfi_1er_parcial]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[DNI] [varchar](50) NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[EmpresaId] [uniqueidentifier] NOT NULL,
	[PrefijoInternacional] [varchar](50) NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaCabecera]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaCabecera](
	[Id] [uniqueidentifier] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[FechaFacturacion] [date] NOT NULL,
 CONSTRAINT [PK_FacturaCabecera] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalle](
	[Id] [uniqueidentifier] NOT NULL,
	[FacturaCabeceraId] [uniqueidentifier] NOT NULL,
	[LlamadaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FacturaCabeceraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LLamada]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LLamada](
	[Id] [uniqueidentifier] NOT NULL,
	[TelefonoOrigenId] [uniqueidentifier] NOT NULL,
	[DestinoOrigenId] [uniqueidentifier] NOT NULL,
	[TelefonoDestinoId] [uniqueidentifier] NOT NULL,
	[DestinoDestinoId] [uniqueidentifier] NOT NULL,
	[DuracionMinutos] [int] NOT NULL,
	[PromocionId] [uniqueidentifier] NOT NULL,
	[FechaLlamada] [datetime] NOT NULL,
 CONSTRAINT [PK_LLamada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
	[CostoMinuto] [decimal](18, 2) NOT NULL,
	[CostoAdicional] [decimal](18, 2) NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_LlamadaTipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[Id] [uniqueidentifier] NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[TelefonoTipoId] [uniqueidentifier] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefonoTipo]    Script Date: 9/19/2021 11:18:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefonoTipo](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TelefonoTipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', N'Tio', N'Coco', N'55555555555', 0)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'73817cfa-8f20-436c-88bf-6249c5e6e372', N'Pepe', N'Argento', N'46565654', 0)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'c4e86592-5ff5-445e-ac59-e23dc8c1fe8d', N'Pepe', N'Argento', N'46565654', 1)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'c231e2ce-655b-47de-a04b-ffcfdd8be01d', N'Pepe', N'Argento', N'46565654', 1)
GO
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'26a37710-9cca-474c-9a35-1cc61cc21174', N'USA', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'001', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'Argentina', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'054', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'2a18dd6c-bc97-4b99-ac7b-ffcc589bce1c', N'England', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', N'002', 0)
GO
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', N'Claro', 1)
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'Movistar', 1)
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'0ac5cd2e-9cba-479a-9d3e-c87efd14c828', N'Telecentro', 0)
GO
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'3427456a-9727-4850-b862-2895c86f52b0', N'Llamada Nacional - Misma Compañías', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'52f6908b-e48e-40ca-ba6a-51b419581644', N'Llamada Nacional - Diferentes Compañías - Entre Celulares', CAST(0.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'0f10602f-9b81-4e0c-99b8-8ee15e08ca6d', N'Llamada Internacionales', CAST(0.95 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'd4dbaf52-fb20-4ed0-818d-be0f59cf9a98', N'Llamada Nacional - Diferentes Compañías - Entre Teléfonos Fijos', CAST(0.95 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [Habilitado]) VALUES (N'fe88578d-4e16-4279-bb16-01c724d9767c', N'654654654465', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'73817cfa-8f20-436c-88bf-6249c5e6e372', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [Habilitado]) VALUES (N'b3597f58-f662-4ae5-8fa1-08731700cd13', N'777777777777', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'73817cfa-8f20-436c-88bf-6249c5e6e372', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [Habilitado]) VALUES (N'df39ca92-7080-4037-b358-5197873206a4', N'654654654465', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [Habilitado]) VALUES (N'6ff6fb91-844c-4fd7-ab85-743245561e16', N'777777777777', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'73817cfa-8f20-436c-88bf-6249c5e6e372', 1)
GO
INSERT [dbo].[TelefonoTipo] ([Id], [Nombre]) VALUES (N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'Teléfono Fijo')
INSERT [dbo].[TelefonoTipo] ([Id], [Nombre]) VALUES (N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'Celular')
GO
ALTER TABLE [dbo].[Destino]  WITH CHECK ADD  CONSTRAINT [FK_Destino_Empresa] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Destino] CHECK CONSTRAINT [FK_Destino_Empresa]
GO
ALTER TABLE [dbo].[FacturaCabecera]  WITH CHECK ADD  CONSTRAINT [FK_FacturaCabecera_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[FacturaCabecera] CHECK CONSTRAINT [FK_FacturaCabecera_Cliente]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_FacturaCabecera] FOREIGN KEY([FacturaCabeceraId])
REFERENCES [dbo].[FacturaCabecera] ([Id])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_FacturaCabecera]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_LLamada] FOREIGN KEY([LlamadaId])
REFERENCES [dbo].[LLamada] ([Id])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_LLamada]
GO
ALTER TABLE [dbo].[LLamada]  WITH CHECK ADD  CONSTRAINT [FK_LLamada_Destino] FOREIGN KEY([DestinoOrigenId])
REFERENCES [dbo].[Destino] ([Id])
GO
ALTER TABLE [dbo].[LLamada] CHECK CONSTRAINT [FK_LLamada_Destino]
GO
ALTER TABLE [dbo].[LLamada]  WITH CHECK ADD  CONSTRAINT [FK_LLamada_Destino1] FOREIGN KEY([DestinoDestinoId])
REFERENCES [dbo].[Destino] ([Id])
GO
ALTER TABLE [dbo].[LLamada] CHECK CONSTRAINT [FK_LLamada_Destino1]
GO
ALTER TABLE [dbo].[LLamada]  WITH CHECK ADD  CONSTRAINT [FK_LLamada_Promocion] FOREIGN KEY([PromocionId])
REFERENCES [dbo].[Promocion] ([Id])
GO
ALTER TABLE [dbo].[LLamada] CHECK CONSTRAINT [FK_LLamada_Promocion]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Cliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Cliente]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TelefonoTipo] FOREIGN KEY([TelefonoTipoId])
REFERENCES [dbo].[TelefonoTipo] ([Id])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TelefonoTipo]
GO
/****** Object:  StoredProcedure [dbo].[ClienteCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClienteCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@Apellido AS VARCHAR(50),
	@DNI AS VARCHAR(50),
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Cliente (Id,Nombre,Apellido,DNI,Habilitado) VALUES (@Id,@Nombre,@Apellido,@DNI,@Habilitado)
END
GO
/****** Object:  StoredProcedure [dbo].[ClienteDelete]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClienteDelete]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE Cliente SET Habilitado=0 WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[ClienteGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClienteGetAll]
AS
BEGIN
	SELECT * FROM Cliente ORDER BY Apellido
END

GO
/****** Object:  StoredProcedure [dbo].[ClienteGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClienteGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM Cliente WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[ClienteUpdate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClienteUpdate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@Apellido AS VARCHAR(50),
	@DNI AS VARCHAR(50),
	@Habilitado AS VARCHAR(50)
AS
BEGIN
	UPDATE Cliente SET Nombre=@Nombre,Apellido=@Apellido,DNI=@DNI,Habilitado=@Habilitado WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[DestinoCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DestinoCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@EmpresaId AS UNIQUEIDENTIFIER,
	@PrefijoInternacional AS VARCHAR(50),
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Destino (Id,Nombre,EmpresaId,PrefijoInternacional,Habilitado) VALUES (@Id,@Nombre,@EmpresaId,@PrefijoInternacional,@Habilitado)
END
GO
/****** Object:  StoredProcedure [dbo].[DestinoDelete]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DestinoDelete]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE Destino SET Habilitado=0 WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[DestinoGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DestinoGetAll]
AS
BEGIN
	SELECT * FROM Destino ORDER BY Nombre
END

GO
/****** Object:  StoredProcedure [dbo].[DestinoGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DestinoGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM Destino WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[DestinoUpdate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DestinoUpdate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@EmpresaId AS UNIQUEIDENTIFIER,
	@PrefijoInternacional AS VARCHAR(50),
	@Habilitado AS VARCHAR(50)
AS
BEGIN
	UPDATE Destino SET Nombre=@Nombre,EmpresaId=@EmpresaId,PrefijoInternacional=@PrefijoInternacional,Habilitado=@Habilitado WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[EmpresaCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpresaCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Empresa (Id,Nombre,Habilitado) VALUES (@Id,@Nombre,@Habilitado)
END
GO
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[EmpresaDelete]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE Empresa SET Habilitado=0 WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[EmpresaGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresaGetAll]
AS
BEGIN
	SELECT * FROM Empresa ORDER BY Nombre
END

GO
/****** Object:  StoredProcedure [dbo].[EmpresaGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpresaGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM Empresa WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[EmpresaUpdate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpresaUpdate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(50),
	@Habilitado AS VARCHAR(50)
AS
BEGIN
	UPDATE Empresa SET Nombre=@Nombre,Habilitado=@Habilitado WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[LLamadaCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LLamadaCreate]
	@Id AS UNIQUEIDENTIFIER,
	@TelefonoOrigenId AS UNIQUEIDENTIFIER,
	@DestinoOrigenId AS UNIQUEIDENTIFIER,
	@TelefonoDestinoId AS UNIQUEIDENTIFIER,
	@DestinoDestinoId AS UNIQUEIDENTIFIER,
	@DuracionMinutos AS INT,
	@PromocionId AS UNIQUEIDENTIFIER,
	@FechaLlamada AS DATETIME
AS
BEGIN
	INSERT INTO Llamada (Id,TelefonoOrigenId,DestinoOrigenId,TelefonoDestinoId,DestinoDestinoId,DuracionMinutos,PromocionId,FechaLlamada) VALUES
	(@Id,@TelefonoOrigenId,@DestinoOrigenId,@TelefonoDestinoId,@DestinoDestinoId,@DuracionMinutos,@PromocionId,@FechaLlamada)
END
GO
/****** Object:  StoredProcedure [dbo].[LLamadaGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LLamadaGetAll]
AS
BEGIN
	SELECT * FROM Llamada ORDER BY FechaLlamada DESC
END

GO
/****** Object:  StoredProcedure [dbo].[PromocionCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PromocionCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(500),
	@CostoMinuto AS decimal(18, 2),
	@CostoAdicional AS decimal(18, 2),
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Promocion (Id,Nombre,CostoMinuto,CostoAdicional,Habilitado) VALUES (@Id,@Nombre,@CostoMinuto,@CostoAdicional,@Habilitado)
END
GO
/****** Object:  StoredProcedure [dbo].[PromocionDelete]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[PromocionDelete]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE Promocion SET Habilitado=0 WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[PromocionGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PromocionGetAll]
AS
BEGIN
	SELECT * FROM Promocion ORDER BY Nombre
END

GO
/****** Object:  StoredProcedure [dbo].[PromocionGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PromocionGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM Promocion WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[PromocionUpdate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PromocionUpdate]
	@Id AS UNIQUEIDENTIFIER,
	@Nombre AS VARCHAR(500),
	@CostoMinuto AS decimal(18, 2),
	@CostoAdicional AS decimal(18, 2),
	@Habilitado AS VARCHAR(50)
AS
BEGIN
	UPDATE Promocion SET Nombre=@Nombre,CostoMinuto=@CostoMinuto,CostoAdicional=@CostoAdicional,Habilitado=@Habilitado WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[TelefonoCreate]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Numero AS VARCHAR(50),
	@ClienteId AS UNIQUEIDENTIFIER,
	@TelefonoTipoId AS UNIQUEIDENTIFIER,
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Telefono (Id,Numero,ClienteId,TelefonoTipoId,Habilitado) VALUES (@Id,@Numero,@ClienteId,@TelefonoTipoId,@Habilitado)
END
GO
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoDelete]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE Telefono SET Habilitado=0 WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[TelefonoGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoGetAll]
AS
BEGIN
	SELECT * FROM Telefono ORDER BY Numero
END

GO
/****** Object:  StoredProcedure [dbo].[TelefonoGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT t.*, c.*
	FROM Telefono t
	INNER JOIN Cliente c ON c.Id=t.ClienteId
	WHERE t.Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoGetAll]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoTipoGetAll]
AS
BEGIN
	SELECT * FROM TelefonoTipo ORDER BY Nombre
END

GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoGetOne]    Script Date: 9/19/2021 11:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TelefonoTipoGetOne]
	@Id AS UNIQUEIDENTIFIER
AS
BEGIN
	SELECT * FROM TelefonoTipo WHERE Id=@Id
END
GO
USE [master]
GO
ALTER DATABASE [tfi_1er_parcial] SET  READ_WRITE 
GO
