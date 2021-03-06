USE [master]
GO
/****** Object:  Database [tfi_1er_parcial]    Script Date: 9/22/2021 7:59:06 PM ******/
CREATE DATABASE [tfi_1er_parcial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tfi_1er_parcial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\tfi_1er_parcial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tfi_1er_parcial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\tfi_1er_parcial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
ALTER DATABASE [tfi_1er_parcial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tfi_1er_parcial] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tfi_1er_parcial] SET QUERY_STORE = OFF
GO
USE [tfi_1er_parcial]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaCabecera]    Script Date: 9/22/2021 7:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaCabecera](
	[Id] [uniqueidentifier] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[FechaFacturacion] [date] NOT NULL,
	[MontoTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_FacturaCabecera] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LLamada]    Script Date: 9/22/2021 7:59:06 PM ******/
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
	[Importe] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_LLamada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 9/22/2021 7:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[Id] [uniqueidentifier] NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[TelefonoTipoId] [uniqueidentifier] NOT NULL,
	[ClienteId] [uniqueidentifier] NOT NULL,
	[EmpresaId] [uniqueidentifier] NULL,
	[Habilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefonoTipo]    Script Date: 9/22/2021 7:59:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', N'Tito', N'Puente', N'55555555555', 1)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'73817cfa-8f20-436c-88bf-6249c5e6e372', N'Ben', N'Stiller', N'445666713', 1)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'c4e86592-5ff5-445e-ac59-e23dc8c1fe8d', N'John', N'Travolta', N'789456123', 1)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'850ee411-4aaf-4e3b-9264-ff0a6dbf7fc1', N'Susan', N'Sarandon', N'26448877', 1)
INSERT [dbo].[Cliente] ([Id], [Nombre], [Apellido], [DNI], [Habilitado]) VALUES (N'c231e2ce-655b-47de-a04b-ffcfdd8be01d', N'Pepe', N'Argento', N'46565654', 1)
GO
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'26a37710-9cca-474c-9a35-1cc61cc21174', N'USA', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'001', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'd4c118c9-6258-4c64-81e9-292f4f96c13a', N'Uruguay', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'598', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'Argentina', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'054', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'ab2729ba-bb70-49f0-bc10-62af8c4610d5', N'Brasil', N'd2676f2c-0642-428a-9543-b49cbe1c2e8f', N'055', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'5696ff70-0ae3-4938-960f-d101c135e1d4', N'Chile', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', N'056', 1)
INSERT [dbo].[Destino] ([Id], [Nombre], [EmpresaId], [PrefijoInternacional], [Habilitado]) VALUES (N'2a18dd6c-bc97-4b99-ac7b-ffcc589bce1c', N'Reino Unido', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', N'002', 1)
GO
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', N'Claro', 1)
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', N'Movistar', 1)
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'd2676f2c-0642-428a-9543-b49cbe1c2e8f', N'Personal', 1)
INSERT [dbo].[Empresa] ([Id], [Nombre], [Habilitado]) VALUES (N'0ac5cd2e-9cba-479a-9d3e-c87efd14c828', N'Telecentro', 1)
GO
INSERT [dbo].[FacturaCabecera] ([Id], [ClienteId], [FechaFacturacion], [MontoTotal]) VALUES (N'c65a2044-1352-4b89-922a-1f81108ca5d3', N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', CAST(N'2021-09-01' AS Date), CAST(1141.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaCabecera] ([Id], [ClienteId], [FechaFacturacion], [MontoTotal]) VALUES (N'8cec0b76-9129-444c-9691-2b6e08949f9c', N'c231e2ce-655b-47de-a04b-ffcfdd8be01d', CAST(N'2021-09-01' AS Date), CAST(1229.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaCabecera] ([Id], [ClienteId], [FechaFacturacion], [MontoTotal]) VALUES (N'32476bc0-b348-4b24-822e-3045a8bd5bfa', N'850ee411-4aaf-4e3b-9264-ff0a6dbf7fc1', CAST(N'2021-09-01' AS Date), CAST(1000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'ba54fd9e-0ad5-44da-9f52-0636f823c5e7', N'8cec0b76-9129-444c-9691-2b6e08949f9c', N'1baad075-1dd4-47c9-8ab2-61809981d2b5')
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'51e57950-1d31-4c76-92d4-47abb017650f', N'c65a2044-1352-4b89-922a-1f81108ca5d3', N'd94e4aa8-fceb-4206-abac-29a75b3fce47')
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'1715a699-462c-4b4b-8b0c-b743004fd86e', N'c65a2044-1352-4b89-922a-1f81108ca5d3', N'3f27ce31-610c-4856-afef-aaa86bfd9a68')
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'bbf9e424-09a7-42ea-854d-dbed73fcacb9', N'8cec0b76-9129-444c-9691-2b6e08949f9c', N'2f4ba118-a338-406b-8e13-9ac8dc6c5540')
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'dffda186-2707-45c4-9649-e8b9c4e74f46', N'8cec0b76-9129-444c-9691-2b6e08949f9c', N'cacd1ebb-2a1b-4b2b-9f5c-ea9da1e0978f')
INSERT [dbo].[FacturaDetalle] ([Id], [FacturaCabeceraId], [LlamadaId]) VALUES (N'779deeac-79ed-40d6-b1fb-f54f0d6541b2', N'8cec0b76-9129-444c-9691-2b6e08949f9c', N'3bd1549c-e91b-45f7-9c2f-d2a5a99c82ca')
GO
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'd94e4aa8-fceb-4206-abac-29a75b3fce47', N'377d50a2-146d-4993-8033-51aacbd8f8ae', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'eab0d138-d79c-4c20-89c8-b51b7190a439', N'ab2729ba-bb70-49f0-bc10-62af8c4610d5', 120, N'0f10602f-9b81-4e0c-99b8-8ee15e08ca6d', CAST(N'2021-09-16T00:00:00.000' AS DateTime), CAST(117.00 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'1baad075-1dd4-47c9-8ab2-61809981d2b5', N'07bcdcdd-71a5-4226-962b-6efdb112d164', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'e9b78f2a-b8f8-4075-ba3a-6791eaf63cb1', N'd4c118c9-6258-4c64-81e9-292f4f96c13a', 120, N'0f10602f-9b81-4e0c-99b8-8ee15e08ca6d', CAST(N'2021-09-28T00:00:00.000' AS DateTime), CAST(117.00 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'2f4ba118-a338-406b-8e13-9ac8dc6c5540', N'07bcdcdd-71a5-4226-962b-6efdb112d164', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'dc712a70-6f10-4399-baf1-910721e9679a', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', 30, N'52f6908b-e48e-40ca-ba6a-51b419581644', CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'3f27ce31-610c-4856-afef-aaa86bfd9a68', N'377d50a2-146d-4993-8033-51aacbd8f8ae', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'e9b78f2a-b8f8-4075-ba3a-6791eaf63cb1', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', 30, N'52f6908b-e48e-40ca-ba6a-51b419581644', CAST(N'2021-09-22T00:00:00.000' AS DateTime), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'3bd1549c-e91b-45f7-9c2f-d2a5a99c82ca', N'07bcdcdd-71a5-4226-962b-6efdb112d164', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'd1c2bb06-cdfa-431c-8e33-c939fbc7653c', N'ab2729ba-bb70-49f0-bc10-62af8c4610d5', 45, N'0f10602f-9b81-4e0c-99b8-8ee15e08ca6d', CAST(N'2021-09-21T00:00:00.000' AS DateTime), CAST(45.75 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'cacd1ebb-2a1b-4b2b-9f5c-ea9da1e0978f', N'4157c394-4085-438b-8a73-d1957c70d1fb', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'd1c2bb06-cdfa-431c-8e33-c939fbc7653c', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', 45, N'd4dbaf52-fb20-4ed0-818d-be0f59cf9a98', CAST(N'2021-09-30T00:00:00.000' AS DateTime), CAST(42.75 AS Decimal(18, 2)))
INSERT [dbo].[LLamada] ([Id], [TelefonoOrigenId], [DestinoOrigenId], [TelefonoDestinoId], [DestinoDestinoId], [DuracionMinutos], [PromocionId], [FechaLlamada], [Importe]) VALUES (N'72535476-63b6-4041-bab6-efa2036489d8', N'aa441e30-8a17-481a-bd16-1d5a4f280ffa', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', N'eab0d138-d79c-4c20-89c8-b51b7190a439', N'd5482f90-d3e9-471c-9fcb-30c3a48e5ee5', 45, N'3427456a-9727-4850-b862-2895c86f52b0', CAST(N'2021-09-17T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'3427456a-9727-4850-b862-2895c86f52b0', N'Llamada Nacional - Misma Compañías', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'52f6908b-e48e-40ca-ba6a-51b419581644', N'Llamada Nacional - Diferentes Compañías - Entre Celulares', CAST(0.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'0f10602f-9b81-4e0c-99b8-8ee15e08ca6d', N'Llamada Internacionales', CAST(0.95 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Promocion] ([Id], [Nombre], [CostoMinuto], [CostoAdicional], [Habilitado]) VALUES (N'd4dbaf52-fb20-4ed0-818d-be0f59cf9a98', N'Llamada Nacional - Diferentes Compañías - Entre Teléfonos Fijos', CAST(0.95 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'34a612ea-6e4a-4b03-8e05-0896584337f5', N'35457866', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'c4e86592-5ff5-445e-ac59-e23dc8c1fe8d', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'aa441e30-8a17-481a-bd16-1d5a4f280ffa', N'98123645', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'c4e86592-5ff5-445e-ac59-e23dc8c1fe8d', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'377d50a2-146d-4993-8033-51aacbd8f8ae', N'65451122', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'e9b78f2a-b8f8-4075-ba3a-6791eaf63cb1', N'56084422', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'850ee411-4aaf-4e3b-9264-ff0a6dbf7fc1', N'210ade9a-788c-4ca4-85ae-86d7b7bea4d9', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'07bcdcdd-71a5-4226-962b-6efdb112d164', N'1536058899', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'c231e2ce-655b-47de-a04b-ffcfdd8be01d', N'd2676f2c-0642-428a-9543-b49cbe1c2e8f', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'dc712a70-6f10-4399-baf1-910721e9679a', N'47896655', N'089884ea-cfbe-4ab4-a24b-fc0c09f90dbe', N'73817cfa-8f20-436c-88bf-6249c5e6e372', N'0ac5cd2e-9cba-479a-9d3e-c87efd14c828', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'eab0d138-d79c-4c20-89c8-b51b7190a439', N'78453388', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'850ee411-4aaf-4e3b-9264-ff0a6dbf7fc1', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'293cde33-9ca9-4bf3-8c13-c4523cb48bbe', N'11226578', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'73817cfa-8f20-436c-88bf-6249c5e6e372', N'd2676f2c-0642-428a-9543-b49cbe1c2e8f', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'd1c2bb06-cdfa-431c-8e33-c939fbc7653c', N'43082256', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'e556bfbe-52d2-475d-a28b-52aa5acdcb5a', N'0ac5cd2e-9cba-479a-9d3e-c87efd14c828', 1)
INSERT [dbo].[Telefono] ([Id], [Numero], [TelefonoTipoId], [ClienteId], [EmpresaId], [Habilitado]) VALUES (N'4157c394-4085-438b-8a73-d1957c70d1fb', N'43217894', N'7aab1fc8-63a7-4879-a65d-c08fdb35bb73', N'c231e2ce-655b-47de-a04b-ffcfdd8be01d', N'ef1befc7-660d-401c-8c64-1e8b65d8b2fd', 1)
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
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Empresa] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Empresa]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TelefonoTipo] FOREIGN KEY([TelefonoTipoId])
REFERENCES [dbo].[TelefonoTipo] ([Id])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TelefonoTipo]
GO
/****** Object:  StoredProcedure [dbo].[ClienteCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteDelete]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteUpdate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DestinoCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DestinoDelete]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DestinoGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DestinoGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DestinoUpdate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaDelete]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EmpresaUpdate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FacturaCabeceraCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FacturaCabeceraCreate]
	@Id AS UNIQUEIDENTIFIER,
	@ClienteId AS UNIQUEIDENTIFIER,
	@FechaFacturacion AS DATETIME,
	@MontoTotal AS DECIMAL(18,2)
AS
BEGIN
	INSERT INTO FacturaCabecera (Id,ClienteId,FechaFacturacion,MontoTotal) VALUES (@Id,@ClienteId,@FechaFacturacion,@MontoTotal)
END
GO
/****** Object:  StoredProcedure [dbo].[FacturaCabeceraGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FacturaCabeceraGetAll]
AS
BEGIN
	SELECT * FROM FacturaCabecera ORDER BY FechaFacturacion,ClienteId
END

GO
/****** Object:  StoredProcedure [dbo].[FacturaDetalleCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FacturaDetalleCreate]
	@Id AS UNIQUEIDENTIFIER,
	@FacturaCabeceraId AS UNIQUEIDENTIFIER,
	@LlamadaId AS UNIQUEIDENTIFIER
AS
BEGIN
	INSERT INTO FacturaDetalle (Id,FacturaCabeceraId,LlamadaId) VALUES (@Id,@FacturaCabeceraId,@LlamadaId)
END
GO
/****** Object:  StoredProcedure [dbo].[LLamadaCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
	@FechaLlamada AS DATETIME,
	@Importe AS DECIMAL(18,2)
AS
BEGIN
	INSERT INTO Llamada (Id,TelefonoOrigenId,DestinoOrigenId,TelefonoDestinoId,DestinoDestinoId,DuracionMinutos,PromocionId,FechaLlamada,Importe) VALUES
	(@Id,@TelefonoOrigenId,@DestinoOrigenId,@TelefonoDestinoId,@DestinoDestinoId,@DuracionMinutos,@PromocionId,@FechaLlamada,@Importe)
END
GO
/****** Object:  StoredProcedure [dbo].[LLamadaGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PromocionCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PromocionDelete]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PromocionGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PromocionGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PromocionUpdate]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ReporteCargosMesCliente]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteCargosMesCliente] 
	@ClienteId AS UNIQUEIDENTIFIER,
	@Mes AS INT
AS
BEGIN
	SELECT ClienteId,MONTH(l.FechaLlamada) AS Mes,SUM(Importe) AS Importe
	FROM LLamada l
	INNER JOIN Telefono t ON t.Id=l.TelefonoOrigenId
	INNER JOIN Cliente c ON c.Id=t.ClienteId
	WHERE c.Id=@ClienteId AND MONTH(l.FechaLlamada)=@Mes
	GROUP BY ClienteId,MONTH(l.FechaLlamada)
	ORDER BY SUM(Importe) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ReportePorcentajeLlamadasTipoGeneralCliente]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportePorcentajeLlamadasTipoGeneralCliente]
@ClienteId AS UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @QTY AS INT

	SELECT @QTY=COUNT(*) FROM LLamada l
	INNER JOIN Telefono t ON t.Id=l.TelefonoOrigenId
	INNER JOIN Cliente c ON c.Id=t.ClienteId
	WHERE c.Id=@ClienteId

	SELECT t.ClienteId,l.PromocionId,COUNT(*) AS CANT_LLAMADAS,COUNT(*) * 100.0 / @QTY AS PORCENTAJE
	FROM LLamada l
	INNER JOIN Telefono t ON t.Id=l.TelefonoOrigenId
	INNER JOIN Cliente c ON c.Id=t.ClienteId
	INNER JOIN Promocion p ON p.Id=l.PromocionId
	WHERE c.Id=@ClienteId
	GROUP BY t.ClienteId,l.PromocionId
	ORDER BY t.ClienteId,l.PromocionId,COUNT(*) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteRecMesPromocion]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteRecMesPromocion] 
	@PromocionId AS UNIQUEIDENTIFIER,
	@Mes AS INT
AS
BEGIN
	SELECT l.PromocionId,MONTH(l.FechaLlamada) AS Mes,SUM(Importe) AS Importe
	FROM LLamada l
	INNER JOIN Promocion p ON p.Id=l.PromocionId
	WHERE p.Id=@PromocionId AND MONTH(l.FechaLlamada)=@Mes
	GROUP BY PromocionId,MONTH(l.FechaLlamada)
	ORDER BY SUM(Importe) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ReporteRecTotalMes]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteRecTotalMes] 
	@Mes AS INT
AS
BEGIN
	SELECT MONTH(l.FechaLlamada) AS Mes,SUM(Importe) AS Importe
	FROM LLamada l
	INNER JOIN Telefono t ON t.Id=l.TelefonoOrigenId
	WHERE MONTH(l.FechaLlamada)=@Mes
	GROUP BY MONTH(l.FechaLlamada)
	ORDER BY SUM(Importe) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[TelefonoCreate]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoCreate]
	@Id AS UNIQUEIDENTIFIER,
	@Numero AS VARCHAR(50),
	@ClienteId AS UNIQUEIDENTIFIER,
	@TelefonoTipoId AS UNIQUEIDENTIFIER,
	@EmpresaId AS UNIQUEIDENTIFIER,
	@Habilitado AS BIT
AS
BEGIN
	INSERT INTO Telefono (Id,Numero,ClienteId,TelefonoTipoId,Habilitado,EmpresaId) VALUES (@Id,@Numero,@ClienteId,@TelefonoTipoId,@Habilitado,@EmpresaId)
END
GO
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TelefonoGetAll]
AS
BEGIN
	SELECT t.*
	FROM Telefono t INNER JOIN Cliente c ON c.Id=t.ClienteId
	ORDER BY c.Apellido
END

GO
/****** Object:  StoredProcedure [dbo].[TelefonoGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoGetAll]    Script Date: 9/22/2021 7:59:15 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoGetOne]    Script Date: 9/22/2021 7:59:15 PM ******/
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
