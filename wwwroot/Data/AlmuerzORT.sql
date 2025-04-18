USE [master]
GO
/****** Object:  Database [AlmuerzORT]    Script Date: 5/12/2024 09:55:22 ******/
CREATE DATABASE [AlmuerzORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmuerzORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmuerzORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AlmuerzORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlmuerzORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmuerzORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmuerzORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmuerzORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmuerzORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmuerzORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmuerzORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlmuerzORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmuerzORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmuerzORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmuerzORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmuerzORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmuerzORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmuerzORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmuerzORT] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmuerzORT] SET  MULTI_USER 
GO
ALTER DATABASE [AlmuerzORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmuerzORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmuerzORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmuerzORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmuerzORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmuerzORT', N'ON'
GO
ALTER DATABASE [AlmuerzORT] SET QUERY_STORE = OFF
GO
USE [AlmuerzORT]
GO
/****** Object:  User [alumno]    Script Date: 5/12/2024 09:55:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ComidaxMenu]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComidaxMenu](
	[id_plato] [int] IDENTITY(1,1) NOT NULL,
	[nombre_plato] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[precio] [float] NOT NULL,
	[id_restriccion] [int] NULL,
 CONSTRAINT [PK_ComidaxMenu] PRIMARY KEY CLUSTERED 
(
	[id_plato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimientos]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimientos](
	[id_lugar] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[calificacion] [int] NOT NULL,
	[horarios] [varchar](100) NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[fotos] [text] NULL,
 CONSTRAINT [PK_Establecimientos] PRIMARY KEY CLUSTERED 
(
	[id_lugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos](
	[id_favorito] [int] IDENTITY(1,1) NOT NULL,
	[dni_usuario] [int] NOT NULL,
	[id_lugar] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_favorito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlatoxLugar]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatoxLugar](
	[id_lugar] [int] NOT NULL,
	[id_plato] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseñas]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseñas](
	[Id_reseña] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](200) NOT NULL,
	[id_lugar] [int] NOT NULL,
	[dni_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Reseñas] PRIMARY KEY CLUSTERED 
(
	[Id_reseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restricciones]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restricciones](
	[id_restriccion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[foto] [text] NULL,
 CONSTRAINT [PK_Restricciones] PRIMARY KEY CLUSTERED 
(
	[id_restriccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/12/2024 09:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[dni] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ComidaxMenu] ON 

INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (7, N'Pollo teriyaqui', N'Pollo adobado con salsa dulce.', 3500, 5)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (9, N'Ñoquis', N'Pequeñas porciones de pasta hechas a base de patata, harina y huevo, que se caracterizan por su forma redondeada y su textura suave y tierna.', 3600, 4)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (11, N'Empanadas celiacas', N'Fina masa de pan, masa quebrada u hojaldre rellena con una preparación salada o dulce y cocida al horno o frita, apta para celiacos.', 2000, 2)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (12, N'Papas fritas', N'Papas que se preparan cortándose en rodajas o en forma de palitos y friéndose en aceite caliente hasta que queden doradas, retirándolas del aceite.', 1500, 3)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (15, N'Fideos', N'Pasta alimenticia de harina en forma de cuerda delgada.', 3800, 4)
INSERT [dbo].[ComidaxMenu] ([id_plato], [nombre_plato], [descripcion], [precio], [id_restriccion]) VALUES (16, N'Manzana', N'Fruto de estructura firme, carnoso, derivado del receptáculo de la flor. ', 600, 6)
SET IDENTITY_INSERT [dbo].[ComidaxMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Establecimientos] ON 

INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (1, N'Dalton', N'Yatay 260', N'011 4028-5500', 4, N'8am-7pm', N' ¡Hola! Somos Dalton y vendemos una gran variedad de comidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos para que disfrutes de nuestros platos especiales!', N'https://scontent.faep24-2.fna.fbcdn.net/v/t39.30808-6/302611925_567457101745301_3555152033939010327_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Qjdi08qUfL8Q7kNvgEy0CIa&_nc_zt=23&_nc_ht=scontent.faep24-2.fna&_nc_gid=AmhvFHzvndYBAt27qXlb5iP&oh=00_AYBJRBLTUweYhozszIJo8z_9zECYd6X-hXAxEW3bXaLwNA&oe=673BD0D9')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (3, N'Abuela Amasa', N'C. Dr. Juan Felipe Aranguren 19', N'011 5833-7469', 4, N'9am-6pm', N'¡Hola! Somos La Abuela Amasa y vendemos una gran variedad de pastas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos para que disfrutes de nuestras mejores recetas!', NULL)
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (5, N'La Matildita', N'Av. Díaz Vélez 4602', N'011 4982-1373', 4, N'8:30am-8:30pm', N'¡Hola! Somos La Matildita y vendemos una gran variedad de pastas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos para que disfrutes de nuestras mejores recetas!', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh5dbrpvfbmOZhnCMzxZvIx5aQHQauqtYnEQ&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (7, N'
La Nueva Fragola', N'Av. Díaz Vélez 4505', N'011 4981-0442', 5, N'7:30am-8pm', N'¡Hola! Somos La Nueva Fragola y vendemos una gran variedad de sandwiches preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5TKHvQa67CfSCgJD22AvvHeHYFj-uaeiOZA&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (10, N'El Vasquito', N'Río de Janeiro 310', N'011 4982-2220', 4, N'11am-11pm', N'¡Hola! Somos El Vasquito y vendemos una gran variedad de empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7KZaboiBMSHH1YIK6GMgXfc7IRSig4HRUBQ&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (11, N'Via Veneto', N'Av. Díaz Vélez 4459', N'011 7365-0005', 4, N'9:30am-8:30pm', N'¡Hola! Somos Via Veneto y vendemos una gran variedad de pastas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://lh3.googleusercontent.com/p/AF1QipMCOvvUUNT-qaUEPw6pSiQCRDcFrCKX6X5sGu2_=s680-w680-h510')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (13, N'Green Deli', N'Av. Díaz Vélez 4501', N'-', 4, N'11am-9:30pm', N'¡Hola! Somos Green Deli y vendemos una gran variedad de comida vegetariana preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (14, N'Impanato', N'Av. Díaz Vélez 4509', N'-', 4, N'9am-11pm', N'¡Hola! Somos Impanato y vendemos una gran variedad de empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUG0kzIwVl1bjkGbmlJS2DC_WyicDqgopyyw&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (15, N'Cumen-Cumen', N'Av. Díaz Vélez 4615', N'011 4982-5310', 3, N'11am-11pm', N'¡Hola! Somos Cumen-Cumen y vendemos una gran variedad de empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNmaRd60pgIjXvSzj0p3dQ_t2N-0oQnwl5w&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (16, N'Gra-Hu', N'Río de Janeiro 320', N'011 4981-3487', 5, N'11:30am-10pm', N' ¡Hola! Somos Gra-Hu y vendemos una gran variedad de sándwiches de milanesa preparados con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCLr_pfUtfTVjnLE1cYgZc_qcHF5AalYYjw&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (17, N'Aieka', N'Bartolomé Mitre 4390', N'011 7508-3317', 5, N'9am-5pm', N'¡Hola! Somos Aieka y vendemos una gran variedad de Comidas Kosher preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (19, N'Big Pizza', N'Yatay 287', N'011 2601-4579', 3, N'11am-11pm', N'¡Hola! Somos Big Pizza y vendemos una gran variedad de pizzas y empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrNjdJkI4IZbNTYQEBzYTZ9HoEO1GZzioCWg&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (20, N'Panadería Roel', N'Av. Avellaneda 99', N'011 4982-0829', 4, N'8am-8pm', N'¡Hola! Somos Panaderia Roel y vendemos una gran variedad de comidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToncW7qiKE-m9QbBHYG7ABE8A5_1Gcn_VzAA&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (22, N'McDonald''s', N'Av. Rivadavia 5730', N'-', 4, N'Abierto las 24hs', N'¡Hola! Somos Mc Donald’s y vendemos una gran variedad de comidas rapidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-2.fna.fbcdn.net/v/t39.30808-6/459343728_904570048370346_5558129961621781147_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=7jwkjNbIRrMQ7kNvgFqDJLW&_nc_zt=23&_nc_ht=scontent.faep24-2.fna&_nc_gid=AUW9-mkSPNxaItc8ZY8wKlP&oh=00_AYBvi0uW9MO33gqPJyZR2K2H-2siZ64Q1EfduX728Bjvig&oe=673BAB81')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (24, N'
Burger King', N'Av. Rivadavia 4355', N'-', 4, N'7am-1am', N'¡Hola! Somos Burger King y vendemos una gran variedad de comidas rapidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Burger_King_2020.svg/640px-Burger_King_2020.svg.png')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (25, N'
Il Nonno Pibe', N'Av. Avellaneda 96', N'011 4982-9333', 5, N'12am-11:30pm', N'¡Hola! Somos Il nonno pibe y vendemos una gran variedad de pizzas y empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-1.fna.fbcdn.net/v/t39.30808-6/308505106_514258617377399_646400589028961785_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=J_M6A5_uL7kQ7kNvgGp4IuE&_nc_zt=23&_nc_ht=scontent.faep24-1.fna&_nc_gid=AvXo9roILn6erI_Q3sDNnff&oh=00_AYAtR8Y5d6qx1Aba2opq8Dlqbnuwi0iApJL3g255qzAIkQ&oe=673BDB9E')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (26, N'Parrilla 83', N'Av. Díaz Vélez 4293', N'011 5370-5634', 4, N'8am-11pm', N'¡Hola! Somos Pariila 83 y vendemos una gran variedad de Carne asada preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwMviIntXLTt_0CGbfVXoaQiN6DEiSyJogzw&s')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (27, N'
Menora House', N'Yatay 226', N'011 4958-2258', 4, N'8am-5pm', N'¡Hola! Somos Menora House y vendemos una gran variedad de Comida Kosher preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-1.fna.fbcdn.net/v/t39.30808-6/307013182_466742898831705_9037910425488815766_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=EILS5SNrr6kQ7kNvgFl6h4i&_nc_zt=23&_nc_ht=scontent.faep24-1.fna&_nc_gid=A1c3HWZcRy175Nd3VS2JVm0&oh=00_AYDgcisnc_IBQ93i4e0FMkSRORqgyiHCIGEs7vkDi5wLRg&oe=673BA764')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (28, N'
Lo del Negro Bar', N'Av. Díaz Vélez 4902', N'011 4982-5107', 4, N'6am-9pm', N'¡Hola! Somos Lo del negro bar y vendemos una gran variedad de todo tipo de comidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', NULL)
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (29, N'Mundo Argentino', N'Av. Díaz Vélez 4502', N'5253-2965', 4, N'6am-2am', N'¡Hola! Somos Mundo Argentino y vendemos una gran variedad de pizzas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-1.fna.fbcdn.net/v/t39.30808-6/307013182_466742898831705_9037910425488815766_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=EILS5SNrr6kQ7kNvgFl6h4i&_nc_zt=23&_nc_ht=scontent.faep24-1.fna&_nc_gid=A1c3HWZcRy175Nd3VS2JVm0&oh=00_AYDgcisnc_IBQ93i4e0FMkSRORqgyiHCIGEs7vkDi5wLRg&oe=673BA764')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (30, N'Kwom Yuen Rotisería China', N'Yatay 213', N'011 4958-7733', 4, N'11:30am-11pm', N'¡Hola! Somos Kwom Yuen Rotisería China y vendemos una gran variedad de comida asiatica preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', NULL)
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (32, N'
Restaurante Teamim', N'Av. Díaz Vélez 4431', N'011 5114-1555', 4, N'11am-10pm', N'¡Hola! Somos Teamim y vendemos una gran variedad de comida arabe preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-1.fna.fbcdn.net/v/t39.30808-6/409188028_885943070207026_6760970253710785292_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=AwCZ4bcVtmMQ7kNvgEf_Coq&_nc_zt=23&_nc_ht=scontent.faep24-1.fna&_nc_gid=A1DVYfnWYxqaEhkJ4oGV7PT&oh=00_AYBLj-x6Momvsb44VkfcIgeGo9T_9OqDEHViNG5jIpge2Q&oe=673BDC6C')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (33, N'Antigua Querencia', N'Yatay 602', N'011 4861-4502', 4, N'12am-12pm', N'¡Hola! Somos Antigua Querencia y vendemos una gran variedad de comida preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-1.fna.fbcdn.net/v/t39.30808-6/295252397_464199755708843_3146120272273270317_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=vHWZ1kq0r8UQ7kNvgGgf83c&_nc_zt=23&_nc_ht=scontent.faep24-1.fna&_nc_gid=AnAb0fssddOsyevwTFUzwBA&oh=00_AYBtWS_pyHsC2wYczYs220_4j7bjmOxRqOrugc1g3_1GaA&oe=673BC3CD')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (34, N'Satoshi Sushi', N'Av. Díaz Vélez 4493', N'011 6929-8969', 4, N'11:30am-12pm', N'¡Hola! Somos Satoshi sushi y vendemos una gran variedad de comida asiática preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://images.rappi.com.ar/restaurants_logo/logo-1688496394793.png')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (35, N'ZEROGLUTEN
', N'Río de Janeiro 346', N'011 15-2355-9838', 5, N'12am-11pm', N'¡Hola! Somos ZeroGluten y vendemos una gran variedad de comida apta para celiacos preparada con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://d2nagnwby8accc.cloudfront.net/companies/logos/ec0e9bc6-ec2b-4435-b4e1-41e3e30dcb34.jpg')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (36, N'Ugi''s', N'Querandíes 4395', N'-', 4, N'10am-11:30pm', N'¡Hola! Somos Ugi’s y vendemos una gran variedad pizzas y empanadas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.ffdo24-3.fna.fbcdn.net/v/t39.30808-6/302175989_413005910944861_3244886736202602971_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=_-VRAmpqJAQQ7kNvgGuzO0L&_nc_zt=23&_nc_ht=scontent.ffdo24-3.fna&_nc_gid=AnfRiu55o1cPeLczgMH25pd&oh=00_AYCRg2KBCdRjRjeasjTFjhaWJzwq6yg_GnW4tHtUFlBDyA&oe=673BAEA1')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (38, N'Jalá', N'Río de Janeiro 692', N'011 15-7121-2074', 5, N'12am-11pm', N'¡Hola! Somos Jalá y vendemos una gran variedad de sandwiches preparados con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', NULL)
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (39, N'Black Clover', N'Avellaneda 1', N'-', 3, N'7am-10pm', N'¡Hola! Somos Black Clover y vendemos una gran variedad de sándwiches de miga preparados con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://lh3.googleusercontent.com/p/AF1QipMGyVIAYFm2HxLoVmZMzsb96CvqIdXeWcXPL86G=s680-w680-h510')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (41, N'Disfruta', N'Yatay 290', N'011 7123-6730', 4, N'9am-9pm', N'¡Hola! Somos Disfruta y vendemos una gran variedad de frutas y verduras de la mejor calidad. ¡Te esperamos! ', N'https://scontent.ffdo24-3.fna.fbcdn.net/v/t39.30808-6/432106974_122127375986210463_7487711118960511622_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=iQIhq1SPh_IQ7kNvgHfVZt8&_nc_zt=23&_nc_ht=scontent.ffdo24-3.fna&_nc_gid=A47qEdu2kKFfteRFQ2Zg_Q5&oh=00_AYATf92WO7cZCnNHkdRcX4cu0VjBtYzki_or8dcker9SQQ&oe=673BDD02')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (42, N'Cri Cri', N'Av. Díaz Vélez 4401', N'-', 5, N'10am-11:30pm', N'¡Hola! Somos Cri Cri y vendemos una gran variedad de sándwiches de fiambre preparados con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', NULL)
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (43, N'Puerto López', N'Tte. Gral. Juan Domingo Perón 4486', N'011 7544-1699', 5, N'12am-8pm', N'¡Hola! Somos Puerto Lopez y vendemos una gran variedad de Hamburguesas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://lh3.googleusercontent.com/a-/ALV-UjUNXd5erolxZd9J6C_VGQ1NXtfOSNK1mMNm_UEBSIi798seLwZA=s100-p-k-no-mo')
INSERT [dbo].[Establecimientos] ([id_lugar], [nombre], [direccion], [telefono], [calificacion], [horarios], [descripcion], [fotos]) VALUES (44, N'Mostaza', N'Av. Díaz Vélez 5001', N'-', 4, N'7am-1am', N'¡Hola! Somos Mostaza y vendemos una gran variedad de comidas rapidas preparadas con ingredientes frescos y de la mejor calidad. ¡Te esperamos! ', N'https://scontent.faep24-2.fna.fbcdn.net/v/t39.30808-6/269913531_10159995594980908_9094711227896747716_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=KwYwi_kFvboQ7kNvgGcMN5o&_nc_zt=23&_nc_ht=scontent.faep24-2.fna&_nc_gid=Alkttq2t5Wjug6y2A3Yfs_w&oh=00_AYDPRs0DEI7V1-X3xpNjN8mBKWApytJmXgYBiV9wCG7jog&oe=673BB6B8')
SET IDENTITY_INSERT [dbo].[Establecimientos] OFF
GO
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (3, 15)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (13, 12)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (5, 9)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (35, 11)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (27, 7)
INSERT [dbo].[PlatoxLugar] ([id_lugar], [id_plato]) VALUES (41, 16)
GO
SET IDENTITY_INSERT [dbo].[Reseñas] ON 

INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (2, N'Muy buenos precios y mejor la atención.', 1, 48043270)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (3, N'La comida muy sabrosa, los precios un poco elevados, pero en general, todo bien.', 3, 48240825)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (8, N'Pesimo lugar, muy sucio, poca higiene, pero la comida zafa.', 33, 48796333)
INSERT [dbo].[Reseñas] ([Id_reseña], [contenido], [id_lugar], [dni_usuario]) VALUES (10, N'Comida para celíacos, rica y sabrosa. Precios un tanto elevados.', 35, 48043270)
SET IDENTITY_INSERT [dbo].[Reseñas] OFF
GO
SET IDENTITY_INSERT [dbo].[Restricciones] ON 

INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (1, N'intolerante a la lactosa', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHSXNCT6AvQf9AVkbq_UXZAfdqR3ANwqxmEQ&s')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (2, N'celiaco', N'https://static.wixstatic.com/media/f3948f_0c40aa8b7685415497fbcff9958dbbe6~mv2.png/v1/fill/w_568,h_642,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/f3948f_0c40aa8b7685415497fbcff9958dbbe6~mv2.png')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (3, N'vegano', N'https://i0.wp.com/vegargentina.com/wp-content/uploads/2021/09/sellos-veg-argentina-liaf-2020-03-003.png?fit=647%2C647&ssl=1')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (4, N'vegetariano', N'https://images.vexels.com/content/207374/preview/vegetarian-round-green-badge-faec81.png')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (5, N'kosher', N'https://upload.wikimedia.org/wikipedia/commons/1/15/Kosher_certification_logo.png')
INSERT [dbo].[Restricciones] ([id_restriccion], [nombre], [foto]) VALUES (6, N'diabetico', N'https://cdn-icons-png.flaticon.com/512/5935/5935561.png')
SET IDENTITY_INSERT [dbo].[Restricciones] OFF
GO
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (23789555, N'Leo', N'Kristal', N'Leo22.kk', N'leo@gmail.com', N'Hola me llamo Leo!', N'leoK')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (48043270, N'Indiana', N'Sasson', N'12345678Is', N'48043270@est.ort.edu.ar', N'Alumno', N'indiSasson')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (48240825, N'Joaquin Ignacio', N'Ordoñez', N'12345678Jo', N'48240825@est.ort.edu.ar', N'Alumno', N'joacoo')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (48313547, N'Tomás Alan', N'Sassón', N'12345678Ts', N'48313547@est.ort.edu.ar', N'Alumno', N'TomasSasson')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (48796333, N'Sol Diana', N'Izraelewicz', N'12345678Si', N'48796333@est.ort.edu.ar', N'Alumno', N'SolDiana')
INSERT [dbo].[Usuario] ([dni], [nombre], [apellido], [contraseña], [mail], [descripcion], [usuario]) VALUES (48796505, N'Carmen', N'Solares', N'Carmen22.K', N'Carmen@gmail.com', N'Hola me llamo Carmen!', N'carmen22')
GO
ALTER TABLE [dbo].[ComidaxMenu]  WITH CHECK ADD  CONSTRAINT [FK_ComidaxMenu_Restricciones] FOREIGN KEY([id_restriccion])
REFERENCES [dbo].[Restricciones] ([id_restriccion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComidaxMenu] CHECK CONSTRAINT [FK_ComidaxMenu_Restricciones]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Establecimientos]
GO
ALTER TABLE [dbo].[Favoritos]  WITH CHECK ADD  CONSTRAINT [FK_Favoritos_Usuarios] FOREIGN KEY([dni_usuario])
REFERENCES [dbo].[Usuario] ([dni])
GO
ALTER TABLE [dbo].[Favoritos] CHECK CONSTRAINT [FK_Favoritos_Usuarios]
GO
ALTER TABLE [dbo].[PlatoxLugar]  WITH CHECK ADD  CONSTRAINT [FK_PlatoxLugar_ComidaxMenu] FOREIGN KEY([id_plato])
REFERENCES [dbo].[ComidaxMenu] ([id_plato])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlatoxLugar] CHECK CONSTRAINT [FK_PlatoxLugar_ComidaxMenu]
GO
ALTER TABLE [dbo].[PlatoxLugar]  WITH CHECK ADD  CONSTRAINT [FK_PlatoxLugar_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlatoxLugar] CHECK CONSTRAINT [FK_PlatoxLugar_Establecimientos]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Establecimientos] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[Establecimientos] ([id_lugar])
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Establecimientos]
GO
ALTER TABLE [dbo].[Reseñas]  WITH CHECK ADD  CONSTRAINT [FK_Reseñas_Usuario] FOREIGN KEY([dni_usuario])
REFERENCES [dbo].[Usuario] ([dni])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reseñas] CHECK CONSTRAINT [FK_Reseñas_Usuario]
GO
USE [master]
GO
ALTER DATABASE [AlmuerzORT] SET  READ_WRITE 
GO
