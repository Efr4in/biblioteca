SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS bibliotecauni;

USE bibliotecauni;

DROP TABLE IF EXISTS administrador_biblioteca;

CREATE TABLE `administrador_biblioteca` (
  `id_bibliotecario` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `id_extreme` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bibliotecario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO administrador_biblioteca VALUES("3","carlos","ab5e2bca84933118bbc9d48ffaccce3bac4eeb64","");
INSERT INTO administrador_biblioteca VALUES("4","elier","8af8cd209bfe5b981ac7ce0e4c8e55464aceb494","");
INSERT INTO administrador_biblioteca VALUES("5","javier","828c1a17681e8566a17a1a4801ea67306010b273","");
INSERT INTO administrador_biblioteca VALUES("6","eduardo","81f705dc2ce1a61a2621e0e4b442a9474e1d0c70","");
INSERT INTO administrador_biblioteca VALUES("7","admin","d033e22ae348aeb5660fc2140aec35850c4da997","");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id_categoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `id_subcategoria` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_subcategoria` (`id_subcategoria`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO categorias VALUES("14","Matemáticas","");
INSERT INTO categorias VALUES("15","Religión","");
INSERT INTO categorias VALUES("16","Biología","");



DROP TABLE IF EXISTS comentarios;

CREATE TABLE `comentarios` (
  `id_comentario` int(10) NOT NULL AUTO_INCREMENT,
  `remitente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS libros;

CREATE TABLE `libros` (
  `id_libro` int(10) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `autor` varchar(150) DEFAULT NULL,
  `disponible` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_categoria` int(10) NOT NULL,
  `id_subcategoria` int(10) NOT NULL,
  `proveedor` varchar(150) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `url_descarga` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`proveedor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO libros VALUES("3","images/1772027621_Algebra_de_Baldor_Portada.jpg","Libro Algebra de Baldor","El libro de matemáticas ideal para aprender sobre el bello mundo de los numeros y letras unidas","Aurelio Baldor","si","14","9","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/10UAy-sTsf-afTwXPf7pUTMIumrCP4H-N/view?usp=sharing");
INSERT INTO libros VALUES("4","images/1772027843_La_Santa_Biblia_Portada.jpg","La Biblia","La Biblia es una colección sagrada de 66 a 73 libros, dividida en Antiguo y Nuevo Testamento","Contribución Grupal","si","15","10","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/1AZIGiQzNiDyDHNXM1Bcd4LONxl0I12ai/view?usp=sharing");



DROP TABLE IF EXISTS pdf;

CREATE TABLE `pdf` (
  `id_pdf` int(10) NOT NULL AUTO_INCREMENT,
  `id_libro` int(10) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext DEFAULT NULL,
  `tamanio` int(10) unsigned DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pdf`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `pdf_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS prestamo_libro;

CREATE TABLE `prestamo_libro` (
  `id_prestamo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `id_libro` int(10) NOT NULL,
  `id_usuario_estudiante` int(10) NOT NULL,
  `estado` int(10) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_libro` (`id_libro`),
  KEY `id_usuario_estudiante` (`id_usuario_estudiante`),
  CONSTRAINT `prestamo_libro_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `prestamo_libro_ibfk_2` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `usuario_estudiante` (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




DROP TABLE IF EXISTS proveedor;

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO proveedor VALUES("1","Libreria COPASA","Managgua","234955","gomper23@gmail.com");
INSERT INTO proveedor VALUES("2","Libreria COPASA","Managgua","234955","gomper23@gmail.com");



DROP TABLE IF EXISTS subcategorias;

CREATE TABLE `subcategorias` (
  `id_subcategoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO subcategorias VALUES("9","Matemáticas Avanzadas");
INSERT INTO subcategorias VALUES("10","Historias Biblicas");
INSERT INTO subcategorias VALUES("11","Biología - Anatomía - Fisiología");



DROP TABLE IF EXISTS suscriptores;

CREATE TABLE `suscriptores` (
  `id_suscriptor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(30) DEFAULT NULL,
  `correo` varchar(30) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `fecha_suscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_suscriptor`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO suscriptores VALUES("17","efra","unandes@gmail.com","prueba","2025-12-23");



DROP TABLE IF EXISTS usuario_estudiante;

CREATE TABLE `usuario_estudiante` (
  `id_usuario_estudiante` int(10) NOT NULL AUTO_INCREMENT,
  `carnet` varchar(15) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `anio` varchar(10) NOT NULL,
  `carrera` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO usuario_estudiante VALUES("1","2012-43355","Elier Javier","Rocha","elier.aries@gmail.com","3ro.","Ingenieria de Sistemas");
INSERT INTO usuario_estudiante VALUES("2","2012-43356","Alex ","jarquin","alexjqr@gmail.com","5to.","Ingenieria Civil");
INSERT INTO usuario_estudiante VALUES("8","2012-0394J","Jaime Jose","Roa","elier.aries@gmail.com","1ro.","Ingenieria de Sistemas");
INSERT INTO usuario_estudiante VALUES("9","14483095","Efrain Andres","Quispe Silva","efrasilva2001@gmail.com","5to.","Ingenieria de Sistemas");



DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(180) DEFAULT NULL,
  `password` varchar(180) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `id_extreme` varchar(180) DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO usuarios VALUES("10","elier","elier123","elier.aries@gmail.com","","admin","","");



DROP TABLE IF EXISTS visitantes;

CREATE TABLE `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `estadoPais` varchar(50) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `edad` varchar(10) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO visitantes VALUES("4","Elier Javier Rocha Solano","aries","aries123","elier.aries@gmail.com","84076105","Ciudad de Juigalpa","Barrio Nuevo Amanecer","Chontales","aries","23","Masculino","MÃ©xico","1","2018-10-21 18:27:55");
INSERT INTO visitantes VALUES("8","efra","efra","1234","efrasilva2001@gmail.com","606833706","Kollasuyo","Murillo","Soltero","efra","24","Masculino","La Paz","1","2025-07-28 05:44:06");
INSERT INTO visitantes VALUES("9","andres","andres","andres","andressilva2001@gmail.com","60683706","Kollasuyo","Murillo","Soltero","andres","15","Masculino","La Paz","1","2026-02-25 02:28:56");



DROP TABLE IF EXISTS visitas;

CREATE TABLE `visitas` (
  `utc` int(10) NOT NULL,
  `fecha_visita` date NOT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `pagina` varchar(255) NOT NULL,
  PRIMARY KEY (`utc`),
  UNIQUE KEY `utc` (`utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO visitas VALUES("1772230668","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772230672","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772230714","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772230715","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772230717","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772230720","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=dsa&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1772230722","2026-02-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=libro&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1772324898","2026-03-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");



SET FOREIGN_KEY_CHECKS=1;