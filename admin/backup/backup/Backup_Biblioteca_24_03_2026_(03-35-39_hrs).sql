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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO administrador_biblioteca VALUES("8","efra","$2y$10$/LlaFT/PK16x3ciHhMQ5uOpmC31ivURwN9tyKan.r9BNKqHfbqQK6","");
INSERT INTO administrador_biblioteca VALUES("9","admin","$2y$10$d58J0FJIuUXrjlorszE00u2GCz7GFEO/0gTqHhA7gZ3FdpXr.d3PW","");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id_categoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `id_subcategoria` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_subcategoria` (`id_subcategoria`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO categorias VALUES("14","Matemáticas","");
INSERT INTO categorias VALUES("15","Religión","");
INSERT INTO categorias VALUES("16","Biología","");
INSERT INTO categorias VALUES("18","Física","");
INSERT INTO categorias VALUES("19","Química","");
INSERT INTO categorias VALUES("20","Música","");
INSERT INTO categorias VALUES("21","Idiomas","");
INSERT INTO categorias VALUES("22","Filosofía","");
INSERT INTO categorias VALUES("23","Lenguaje","");
INSERT INTO categorias VALUES("24","Educaión Física","");
INSERT INTO categorias VALUES("25","Artes Plasticas y Visuales","");



DROP TABLE IF EXISTS comentarios;

CREATE TABLE `comentarios` (
  `id_comentario` int(10) NOT NULL AUTO_INCREMENT,
  `remitente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `id_visitante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_comentarios_visitante` (`id_visitante`),
  CONSTRAINT `fk_comentarios_visitante` FOREIGN KEY (`id_visitante`) REFERENCES `visitantes` (`idvisitante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO comentarios VALUES("8","andres","efrasilva2001@gmail.com","peticion de libro para leer","podrian poner X libro para que pueda saber mas sobre X tema?, es necesario para saber lo basico, gracias","2026-03-24","");



DROP TABLE IF EXISTS consultas_ia;

CREATE TABLE `consultas_ia` (
  `id_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_estudiante` int(11) DEFAULT NULL,
  `consulta` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `fecha_consulta` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_consulta`),
  KEY `fk_consultas_visitante` (`id_usuario_estudiante`),
  CONSTRAINT `fk_consultas_visitante` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `visitantes` (`idvisitante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE IF EXISTS libros;

CREATE TABLE `libros` (
  `id_libro` int(10) NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `autor` varchar(150) DEFAULT NULL,
  `disponible` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_categoria` int(10) NOT NULL,
  `id_subcategoria` int(10) NOT NULL,
  `proveedor` varchar(150) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `url_descarga` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_proveedor` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`proveedor`),
  KEY `fk_libros_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_libros_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO libros VALUES("3","images/1772027621_Algebra_de_Baldor_Portada.jpg","Libro Algebra de Baldor","El libro de matemáticas ideal para aprender sobre el bello mundo de los numeros y letras unidas","Aurelio Baldor","si","14","9","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/10UAy-sTsf-afTwXPf7pUTMIumrCP4H-N/view?usp=sharing","");
INSERT INTO libros VALUES("4","images/1772027843_La_Santa_Biblia_Portada.jpg","La Biblia","La Biblia es una colección sagrada de 66 a 73 libros, dividida en Antiguo y Nuevo Testamento","Contribución Grupal","si","15","10","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/1AZIGiQzNiDyDHNXM1Bcd4LONxl0I12ai/view?usp=sharing","");
INSERT INTO libros VALUES("6","images/1772461430_Portada_Biologa-Origenycontinuidaddelosseresvivos.jpg","Biología - Origen y continuidad de los seres vivos","Este libro trata sobre el conocimiento básico de la biología en general","Kapelusz Norma","si","16","11","Encargado del Proyecto - Efraín","2026-03-02","https://drive.google.com/file/d/1fRLnRitzSMZm1rEHOW_reQE0Z5hA9XE0/view?usp=sharing","");
INSERT INTO libros VALUES("7","images/1772776963_Portada_del_libro_Fisica_General.jpg","Física General","Este libro te enseñara todo lo básico y necesario para lograr en tener que es la Física","Ignacio Martín Bragado","si","18","13","Encargado del Proyecto - Efraín","2026-03-05","https://drive.google.com/file/d/162bpGptryXwhtekPt9CiQudmT7bdg5Se/view?usp=sharing","");
INSERT INTO libros VALUES("8","images/1772777527_Imagen1.jpg","Química - Conceptos Básicos","Este es ideal para comprender y entender sobre que es la química y sus elementos.","Rosel Quispe Herrera, Yony Flora Fernández Herrera, Larry Oscar Chañi Paucar","si","19","15","Encargado del Proyecto - Efraín","2026-03-05","https://drive.google.com/file/d/1qEm9E4ZLEHSJNL5T9EqQViLEMPJn3Trc/view?usp=sharing","");



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
  `id_bibliotecario` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_libro` (`id_libro`),
  KEY `id_usuario_estudiante` (`id_usuario_estudiante`),
  KEY `fk_prestamo_bibliotecario` (`id_bibliotecario`),
  CONSTRAINT `fk_prestamo_bibliotecario` FOREIGN KEY (`id_bibliotecario`) REFERENCES `administrador_biblioteca` (`id_bibliotecario`),
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO subcategorias VALUES("9","Matemáticas Avanzadas");
INSERT INTO subcategorias VALUES("10","Historias Biblicas");
INSERT INTO subcategorias VALUES("11","Biología - Anatomía - Fisiología");
INSERT INTO subcategorias VALUES("12","Fisica Avanzada");
INSERT INTO subcategorias VALUES("13","Física Básica");
INSERT INTO subcategorias VALUES("14","Química Avanzada");
INSERT INTO subcategorias VALUES("15","Química Básica");
INSERT INTO subcategorias VALUES("16","Música de Conocimiento Básico");
INSERT INTO subcategorias VALUES("17","Música de Conocimiento Avanzado");



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




DROP TABLE IF EXISTS visitantes;

CREATE TABLE `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO visitantes VALUES("13","Efrain Andres","efra","$2y$10$du16cMY3ZmKmn77uZO0v1u10YUrdbafhAWUwtaAjDbPjiLLnOoNmK","efrasilva2001@gmail.com","60683706","Kollasuyo","Murillo","Soltero","efra","23","Masculino","La Paz","1","2026-03-09 00:16:41");
INSERT INTO visitantes VALUES("14","andres","andres","$2y$10$fdiyb7pOXxqAGMWtmmtW1egKW/yl3htSKwTOQfqHV4gLboyOftHD2","efrasilva2001@gmail.com","60683706","Kollasuyo","Murillo","Soltero","andres","16","Masculino","La Paz","1","2026-03-18 10:19:14");



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
INSERT INTO visitas VALUES("1772350196","2026-03-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772459254","2026-03-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772459547","2026-03-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772459550","2026-03-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772461492","2026-03-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772461495","2026-03-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772590982","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772591000","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772591333","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772591337","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772591338","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1772591340","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1772617016","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772617030","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772617033","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772617541","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772617620","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772617621","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772617623","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772618336","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772618345","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772618699","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772619161","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772619170","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772619823","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772634575","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1772634611","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772635049","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772635550","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772636184","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772636469","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772637243","2026-03-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1772776130","2026-03-06","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773038347","2026-03-09","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773040605","2026-03-09","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773040924","2026-03-09","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773041105","2026-03-09","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773041273","2026-03-09","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773118102","2026-03-10","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773119116","2026-03-10","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773761599","2026-03-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773761643","2026-03-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773803251","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773803254","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773803258","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773803259","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773803261","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773803266","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773803314","2026-03-18","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773803714","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773805216","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773805339","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=Qu%C3%ADmica+-+Conceptos+B%C3%A1sicos&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1773805361","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=Qu%C3%ADmica+-+Conceptos+B%C3%A1sicos&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1773853311","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773853313","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773853482","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773854228","2026-03-18","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773854298","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773854361","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1773854368","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php?cat=14");
INSERT INTO visitas VALUES("1773854372","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773854800","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773855350","2026-03-18","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773858327","2026-03-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1773858660","2026-03-18","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774153637","2026-03-22","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774307177","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774307257","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774307269","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1774307339","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1774307377","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774307435","2026-03-24","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774307657","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774307659","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1774307660","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774307663","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php?cat=22");
INSERT INTO visitas VALUES("1774307665","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php?cat=14");
INSERT INTO visitas VALUES("1774319546","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774319558","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php?cat=14");
INSERT INTO visitas VALUES("1774319567","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774319574","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=baldor&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1774319588","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");



SET FOREIGN_KEY_CHECKS=1;