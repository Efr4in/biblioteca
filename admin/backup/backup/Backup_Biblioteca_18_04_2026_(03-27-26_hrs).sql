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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
INSERT INTO categorias VALUES("26","Ciencias Sociales","");
INSERT INTO categorias VALUES("27","Aymara","");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO comentarios VALUES("8","andres","efrasilva2001@gmail.com","peticion de libro para leer","podrian poner X libro para que pueda saber mas sobre X tema?, es necesario para saber lo basico, gracias","2026-03-24","");
INSERT INTO comentarios VALUES("9","efra","efrasilva2001@gmail.com","solicitud de ujn libro para el conocimineot genera","quiero un libro sobre lo basio ce las matematicas","2026-03-24","");



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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO libros VALUES("3","images/1775104104_Algebra_de_Baldor_Portada.jpg","Libro Algebra de Baldor","El libro de matemáticas ideal para aprender sobre el bello mundo de los numeros y letras unidas","Aurelio Baldor","si","14","9","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/1lewXL9CH33DothZqZvJMTQLan8ynxXxY/view?usp=drive_link","");
INSERT INTO libros VALUES("4","images/1772027843_La_Santa_Biblia_Portada.jpg","La Biblia","La Biblia es una colección sagrada de 66 a 73 libros, dividida en Antiguo y Nuevo Testamento","Contribución Grupal","si","15","10","Encargado del Proyecto - Efraín","2026-02-25","https://drive.google.com/file/d/1AZIGiQzNiDyDHNXM1Bcd4LONxl0I12ai/view?usp=sharing","");
INSERT INTO libros VALUES("6","images/1772461430_Portada_Biologa-Origenycontinuidaddelosseresvivos.jpg","Biología - Origen y continuidad de los seres vivos","Este libro trata sobre el conocimiento básico de la biología en general","Kapelusz Norma","si","16","11","Encargado del Proyecto - Efraín","2026-03-02","https://drive.google.com/file/d/1fRLnRitzSMZm1rEHOW_reQE0Z5hA9XE0/view?usp=sharing","");
INSERT INTO libros VALUES("7","images/1772776963_Portada_del_libro_Fisica_General.jpg","Física General","Este libro te enseñara todo lo básico y necesario para lograr en tener que es la Física","Ignacio Martín Bragado","si","18","13","Encargado del Proyecto - Efraín","2026-03-05","https://drive.google.com/file/d/162bpGptryXwhtekPt9CiQudmT7bdg5Se/view?usp=sharing","");
INSERT INTO libros VALUES("8","images/1772777527_Imagen1.jpg","Química - Conceptos Básicos","Este es ideal para comprender y entender sobre que es la química y sus elementos.","Rosel Quispe Herrera, Yony Flora Fernández Herrera, Larry Oscar Chañi Paucar","si","19","15","Encargado del Proyecto - Efraín","2026-03-05","https://drive.google.com/file/d/1qEm9E4ZLEHSJNL5T9EqQViLEMPJn3Trc/view?usp=sharing","");
INSERT INTO libros VALUES("9","images/1775113238_BastadeHistorias-AndrsOppenheimer.jpg","¡Basta de Historias!","Ensayo que urge a Latinoamérica a priorizar educación e innovación sobre el pasado.","Andrés Oppenheimer","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-01","https://drive.google.com/file/d/1rkGs-oFX9PfQ1PJ-3EP8OkPFQf7UbV4m/view?usp=drive_link","");
INSERT INTO libros VALUES("10","images/1775113057_AuschwitzltimaParada-EddydeWind.jpg","Auschwitz Última Parada","Testimonio autobiográfico de un médico judío sobreviviente del campo de Auschwitz.","Eddy de Wind","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-01","https://drive.google.com/file/d/1MkTx8xIwnzXuM2_v9eBEqfBsyuyWxgGh/view?usp=drive_link","");
INSERT INTO libros VALUES("11","images/1775113218_Cienaosdesoledad-GabrielGarciaMarquez.jpg","Cien años de soledad","Saga familiar de siete generaciones en Macondo, obra cumbre del realismo mágico.","Gabriel Garcia Marquez","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-01","https://drive.google.com/file/d/1JVXUcJll8Mo2hpjhlJaLV6VEHfcfFSMB/view?usp=drive_link","");
INSERT INTO libros VALUES("12","images/1775113324_Cronicadeunamuerteanunciada-GabrielGarciaMarquez.jpg","Cronica de una muerte anunciada","Un crimen que todos conocían pero nadie evitó. Intriga y crítica social en un pueblo.","Gabriel Garcia Marquez","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1PF148M9GcMu_nzlIBiJaLmvJrV8TyVcM/view?usp=drive_link","");
INSERT INTO libros VALUES("13","images/1775113446_CuentosdelaSelva-HoracioQuiroga.jpg","Cuentos de la Selva","Cuentos con animales de la selva sudamericana, con moralejas y narrativa vívida.","Horacio Quiroga","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/11f4hcjm1QjentSRksrfodfp2CeH5J8ph/view?usp=drive_link","");
INSERT INTO libros VALUES("14","images/1775113516_ElAmorenlosTiemposdeClera-GarciaMarquezGabriel.jpg","El Amor en los Tiempos de Cólera","Un amor que espera más de cincuenta años para consumarse. Pasión y envejecimiento.","Garcia Marquez Gabriel","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1LbT4SKxU4Hc1UotJrQvdzpIIhmuLy-AN/view?usp=drive_link","");
INSERT INTO libros VALUES("15","images/1775113580_Elartedelaguerra-SunTzu.jpg","El arte de la guerra","Tratado chino sobre estrategia y liderazgo, aplicable en guerra y vida cotidiana.","Sun Tzu","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1ih_274ZNNvGaLM5jQjkVUGCWVNtj70e6/view?usp=drive_link","");
INSERT INTO libros VALUES("16","images/1775113656_EldiariodeAnaFrank-AnaFrank.jpg","El diario de Ana Frank","Diario de una niña judía escondida del nazismo. Uno de los testimonios más humanos del Holocausto.","Ana Frank","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1O7OemsZY9suw0g2WhrBFvjDXq-9_Wsgf/view?usp=drive_link","");
INSERT INTO libros VALUES("17","images/1775113732_ElFeo-CarlosCuauhtmocSnchez.jpg","El Feo","Novela sobre un joven rechazado por su apariencia que descubre el valor de la autoestima.","Carlos Cuauhtémoc Sánchez","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1Ci4JjyM7ORtXL6vA0BS41dkjopxaSaET/view?usp=drive_link","");
INSERT INTO libros VALUES("18","images/1775113793_ElPrincipe-NicolasMaquiavelo.png","El Principe","Tratado político clásico sobre cómo conquistar y mantener el poder.","Nicolas Maquiavelo","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1BNJzvKIPt_v-h6SYJ-1O7dvj7Jj_qT6K/view?usp=drive_link","");
INSERT INTO libros VALUES("19","images/1775113862_ElPrincipito-AntoniodeSaint.jpg","El Principito","Fábula filosófica sobre la amistad, el amor y lo verdaderamente esencial en la vida.","Antonio de Saint-Exupéry","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1zONFhzDYbGPRRllma6NxY-YW-zdemKBN/view?usp=drive_link","");
INSERT INTO libros VALUES("20","images/1775113935_GeometraAnaltica-CharlesLehmann.png","Geometría Analítica","Texto académico de referencia para cursos universitarios de matemáticas y geometría.","Charles Lehmann","si","14","9","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/13mCpdUYWk4SNkXt8sJYZRyCx-s8yHAb6/view?usp=drive_link","");
INSERT INTO libros VALUES("21","images/1775113989_Lariquezadelasnaciones-AdamSmith.png","La riqueza de las naciones","Obra fundacional de la economía moderna sobre el mercado libre y la generación de riqueza.","Adam Smith","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1xpS8lXg7ZwpGNltrBbb9ACyqrt2kYZrG/view?usp=drive_link","");
INSERT INTO libros VALUES("22","images/1775114028_LasVenasAbiertasdeAmrica-EduardoGaleano.jpg","Las Venas Abiertas de América","Denuncia histórica de siglos de explotación económica y política en América Latina.","Eduardo Galeano","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1v_xHQpjedOnqGyxdtH0_SRTWG3npj105/view?usp=drive_link","");
INSERT INTO libros VALUES("23","images/1775114113_MemoriademisPutasTristes-GarcaMrquez.jpg","Memoria de mis AmoresTristes","Un anciano de noventa años descubre el amor por primera vez. Vejez, deseo y ternura.","García Márquez","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1K_UbvaiYw9xmw0MRGQjTkmRqGefJnOfU/view?usp=drive_link","");
INSERT INTO libros VALUES("24","images/1775114157_RazadeBronce-AlcidesArguedas.jpg","Raza de Bronce","Novela boliviana que denuncia la opresión de los pueblos indígenas del altiplano.","Alcides Arguedas","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1lPav1jxB7Pjc_Vjy02X3sBOGQhN86T8_/view?usp=drive_link","");
INSERT INTO libros VALUES("25","images/1775114199_SangredeCampen-CarlosCuauhtmocSnchez.png","Sangre de Campeón","Novela juvenil sobre esfuerzo y trabajo en equipo a través del fútbol.","Carlos Cuauhtémoc Sánchez","si","26","20","Unidad Educativa Privada Boliviano Holandes","2026-04-02","https://drive.google.com/file/d/1yN88U9t90ll3tcTJZgUfTdCxOh1CbOEi/view?usp=drive_link","");



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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO prestamo_libro VALUES("26","2026-03-30","2026-04-01","3","11","0","");
INSERT INTO prestamo_libro VALUES("27","2026-03-31","2026-04-02","3","11","0","");
INSERT INTO prestamo_libro VALUES("28","2026-03-31","2026-04-02","3","12","0","");
INSERT INTO prestamo_libro VALUES("29","2026-03-31","2026-04-02","3","11","0","");
INSERT INTO prestamo_libro VALUES("30","2026-04-02","2026-04-03","3","12","1","");
INSERT INTO prestamo_libro VALUES("31","2026-04-15","2026-04-16","3","12","1","");
INSERT INTO prestamo_libro VALUES("32","2026-04-15","2026-04-15","3","12","1","");



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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO subcategorias VALUES("9","Matemáticas Avanzadas");
INSERT INTO subcategorias VALUES("10","Historias Biblicas");
INSERT INTO subcategorias VALUES("11","Biología - Anatomía - Fisiología");
INSERT INTO subcategorias VALUES("12","Fisica Avanzada");
INSERT INTO subcategorias VALUES("13","Física Básica");
INSERT INTO subcategorias VALUES("14","Química Avanzada");
INSERT INTO subcategorias VALUES("15","Química Básica");
INSERT INTO subcategorias VALUES("16","Música de Conocimiento Básico");
INSERT INTO subcategorias VALUES("17","Música de Conocimiento Avanzado");
INSERT INTO subcategorias VALUES("18","Física - Astrofísica");
INSERT INTO subcategorias VALUES("19","Comunicación y Lenguajes");
INSERT INTO subcategorias VALUES("20","Ciencias Sociales");



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
  PRIMARY KEY (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO usuario_estudiante VALUES("11","14483095","Efra","Silva","efrasilva2001@gmail.com");
INSERT INTO usuario_estudiante VALUES("12","47395739","Andres","Gonzales","andresgonzales2005@gmail.com");



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
INSERT INTO visitas VALUES("1774319988","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1774320041","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1774320382","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774320895","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774321428","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774321688","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774323451","2026-03-24","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774597297","2026-03-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774597303","2026-03-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774647270","2026-03-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774647277","2026-03-27","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774665127","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774665146","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774665150","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774665163","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774666244","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774666270","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774666283","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=algebra&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1774666793","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774666812","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774667055","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774667064","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774667537","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774667775","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774667777","2026-03-28","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1774934062","2026-03-31","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1774935006","2026-03-31","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775011605","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775011629","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775011678","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775011685","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775011687","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1775011736","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775011753","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775018424","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775018429","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775018458","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775018674","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775018686","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775019183","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775019184","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775019551","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775019553","2026-04-01","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775103941","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775104120","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775104123","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775104725","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775104846","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775104858","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775104862","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=baldor&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1775104864","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775104866","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775104868","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775111368","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775113063","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775113066","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775114206","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775115306","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775115737","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775116090","2026-04-02","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775116092","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775138303","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775138306","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775143740","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775145464","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775145487","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1775145512","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775145533","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=baldor&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1775145621","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=baldor&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1775146607","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1775147386","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775147387","2026-04-02","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775946596","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775946600","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775951118","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775951121","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775951439","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775951637","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775951639","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775981771","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1775981774","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775982236","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775982423","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775983138","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775983378","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775984405","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775984595","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775984816","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775985290","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775985671","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1775988299","2026-04-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776039100","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776039105","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776040186","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776040648","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041010","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041018","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041322","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041555","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041714","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776041877","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776059336","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776059343","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776059350","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776063981","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776063982","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776064379","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/asesor/asesor.php");
INSERT INTO visitas VALUES("1776064602","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/asesor/asesor.php");
INSERT INTO visitas VALUES("1776064614","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/asesor/asesor.php");
INSERT INTO visitas VALUES("1776064725","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776064994","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776105428","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776105449","2026-04-13","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776129879","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776129887","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776130383","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776131007","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776131381","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776131502","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776131830","2026-04-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776290249","2026-04-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776290250","2026-04-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776290530","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776291269","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776304891","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776304895","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776313297","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776313317","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776313592","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776313599","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php?buscar=blador&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1776313602","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776314295","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776314298","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776315186","2026-04-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776315196","2026-04-16","::1","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776414451","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776414454","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776414664","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776414714","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776414939","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776415670","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776416836","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776416884","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776417026","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776417443","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776418425","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776418785","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776418939","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776419140","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776419787","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776420041","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776420189","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/asesor/asesor.php");
INSERT INTO visitas VALUES("1776420641","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776420644","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776420683","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776420685","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776449211","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776449241","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776450277","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776454835","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776458370","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776458380","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776458419","2026-04-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776468134","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776468139","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776468194","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776468845","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776468882","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776468888","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776468891","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776469038","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776469122","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776470021","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776470162","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776470586","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776470837","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776470881","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776473183","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776473269","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776473451","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776473519","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1776475292","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1776475303","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1776475585","2026-04-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36","/biblioteca/busqueda.php");



SET FOREIGN_KEY_CHECKS=1;