USE [master]
GO
/****** Object:  Database [DBESCOLASTICO]    Script Date: 3/8/2020 17:20:35 ******/
CREATE DATABASE [DBESCOLASTICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBESCOLASTICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBESCOLASTICO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBESCOLASTICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBESCOLASTICO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBESCOLASTICO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBESCOLASTICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBESCOLASTICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBESCOLASTICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBESCOLASTICO] SET  MULTI_USER 
GO
ALTER DATABASE [DBESCOLASTICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBESCOLASTICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBESCOLASTICO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBESCOLASTICO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBESCOLASTICO', N'ON'
GO
ALTER DATABASE [DBESCOLASTICO] SET QUERY_STORE = OFF
GO
USE [DBESCOLASTICO]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NULL,
	[lugar_nacimiento] [varchar](50) NULL,
	[sexo] [nchar](10) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idarea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[cordinador] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calificación]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificación](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [int] NULL,
	[fecha] [date] NULL,
	[unidad] [nchar](2) NULL,
	[idmatricula] [int] NULL,
 CONSTRAINT [PK_calificación] PRIMARY KEY CLUSTERED 
(
	[idcalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[categoria] [varchar](25) NULL,
	[edadMin] [int] NULL,
	[edadMax] [int] NULL,
	[tipo] [varchar](25) NULL,
	[ubicacion] [varchar](50) NULL,
	[administrador] [varchar](25) NULL,
	[cupos] [nchar](10) NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[idmateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](75) NULL,
	[nrc] [varchar](5) NULL,
	[creditos] [smallint] NULL,
	[idarea] [int] NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[idmateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 3/8/2020 17:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[costo] [decimal](18, 2) NULL,
	[estado] [nchar](1) NULL,
	[tipo] [nchar](1) NULL,
	[idalumno] [int] NULL,
	[idmateria] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1, N'luis armando', N'chicaiza Conteron', N'1726741489', CAST(N'1995-02-15' AS Date), N'Quito sur', N'H         ')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (3, N'Armando', N'chicai ', N'1726741499', CAST(N'1995-02-15' AS Date), N'Quito sur', N'H         ')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (4, N'kladj', N'jsdsnj', N'1234567895', CAST(N'2020-07-09' AS Date), NULL, N'H         ')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idarea], [nombre], [cordinador]) VALUES (1, N'Programacion', N'Ing javier')
INSERT [dbo].[Area] ([idarea], [nombre], [cordinador]) VALUES (2, N'Software', N'Ing Fabian')
INSERT [dbo].[Area] ([idarea], [nombre], [cordinador]) VALUES (3, N'Patrones', N'Ing Ruben')
INSERT [dbo].[Area] ([idarea], [nombre], [cordinador]) VALUES (4, N'Laboratorio web', N'Ing Ruben')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([id], [nombre], [categoria], [edadMin], [edadMax], [tipo], [ubicacion], [administrador], [cupos]) VALUES (1, N'Breakers', N'bailes', 28, 18, N'Intermedio', N'Quito sur', N'Luis Chicaiza', N'20        ')
INSERT [dbo].[Club] ([id], [nombre], [categoria], [edadMin], [edadMax], [tipo], [ubicacion], [administrador], [cupos]) VALUES (2, N'Platos Tipicos', N'Gastronomia Y Turismo', 20, 15, N'Experto', N'salesiana', N'Ruth Chizaguano', N'26        ')
INSERT [dbo].[Club] ([id], [nombre], [categoria], [edadMin], [edadMax], [tipo], [ubicacion], [administrador], [cupos]) VALUES (6, N'clusb', N'deportes', 15, 23, N'Intermedio', NULL, N'luis', N'12        ')
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (1, N'Laboratorio', N'5000', 4, 1)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (2, N'Programacion2', N'5023', 2, 2)
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
ALTER TABLE [dbo].[calificación]  WITH CHECK ADD  CONSTRAINT [FK_calificación_Matricula] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[Matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[calificación] CHECK CONSTRAINT [FK_calificación_Matricula]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Area] FOREIGN KEY([idarea])
REFERENCES [dbo].[Area] ([idarea])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Area]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([idalumno])
REFERENCES [dbo].[Alumno] ([idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Materia] FOREIGN KEY([idmateria])
REFERENCES [dbo].[Materia] ([idmateria])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Materia]
GO
USE [master]
GO
ALTER DATABASE [DBESCOLASTICO] SET  READ_WRITE 
GO
