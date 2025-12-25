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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO categorias VALUES("1","Programacion Avanzada II","3");
INSERT INTO categorias VALUES("2","Aplicaciones web","2");
INSERT INTO categorias VALUES("4","Estadisticas","2");
INSERT INTO categorias VALUES("8","Python","2");
INSERT INTO categorias VALUES("9","PHP avanzado","4");
INSERT INTO categorias VALUES("10","HTML 5","3");
INSERT INTO categorias VALUES("11","Base de datos","2");
INSERT INTO categorias VALUES("12","Ingenieria de Sistemas","3");
INSERT INTO categorias VALUES("13","Informatica","2");
INSERT INTO categorias VALUES("16","Categoria de Prueba","2");



DROP TABLE IF EXISTS comentarios;

CREATE TABLE `comentarios` (
  `id_comentario` int(10) NOT NULL AUTO_INCREMENT,
  `remitente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO comentarios VALUES("2","Elier Javier Rocha","elier.aries@gmail.com","Prueba","Esto es una prueba","2016-02-05");
INSERT INTO comentarios VALUES("3","Elier Javier Rocha Solano","elier.aries@gmail.com","Saludos","Hola","2018-09-15");



DROP TABLE IF EXISTS libros;

CREATE TABLE `libros` (
  `id_libro` int(10) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `disponible` varchar(2) CHARACTER SET latin1 NOT NULL,
  `id_categoria` int(10) NOT NULL,
  `id_subcategoria` int(10) NOT NULL,
  `id_proveedor` int(10) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `url_descarga` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO libros VALUES("3","images/mysql.jpg","Mysql","Para crear aplicaciones dinamicas","si","4","2","1","2016-01-07","http://mediafire.com/id=203044","mysql");
INSERT INTO libros VALUES("4","images/product2.jpg","HTML5 2da Edicion","Para crear aplicaciones dinamicas","si","2","0","1","2016-01-07","http://mediafire.com/id=203044","html");
INSERT INTO libros VALUES("5","images/product1.jpg","Java 8","Libro de Programacion","si","1","0","1","2016-01-06","http://mega.co.nz/sldldldlffkf","java");
INSERT INTO libros VALUES("6","images/product5.jpg","ASP.NET","Crea aplicaciones dinamicas","si","2","0","1","2016-01-07","http://mega.co.nz/sldldldlffkf","asp");
INSERT INTO libros VALUES("8","images/product6.jpg","Ajax","lenguaje de programacion","no","2","0","1","2016-01-07","http://mediafire.com/id=203044","ajax");
INSERT INTO libros VALUES("9","images/product4.jpg","JQuery 2da Edicion","Sincronizacion con la base de datos","no","2","0","2","2016-01-14","http://mediafire.com/id=203044","jquery");
INSERT INTO libros VALUES("10","images/php.jpg","PHP","Para crear aplicaciones dinamicas","no","2","0","1","2016-01-07","http://mediafire.com/id=203044","mysql");
INSERT INTO libros VALUES("11","images/pyton.jpg","Python","Para crear aplicaciones dinamicas","no","1","0","1","2016-01-07","http://mediafire.com/id=203044","html");
INSERT INTO libros VALUES("12","images/visualbasic.jpg","Visual Basic","Libro de Programacion","si","1","0","1","2016-01-06","http://mega.co.nz/sldldldlffkf","java");
INSERT INTO libros VALUES("13","images/java7.jpg","Java 7","Crea aplicaciones dinamicas","no","1","0","1","2016-01-07","http://mega.co.nz/sldldldlffkf","asp");
INSERT INTO libros VALUES("16","images/javascript.jpg","JavaScript para principiantes","Excelente libro para aprender Javascript","si","2","8","2","2016-02-05","http://mega.co.nz/sldldldlffkf","aplication/pdf");
INSERT INTO libros VALUES("17","images/csharp.jpg","C# Avanzado","para programacion","si","1","2","2","2016-02-05","http://mega.co.nz/sldldldlffkf","aplication/pdf");
INSERT INTO libros VALUES("18","images/db1.jpg","Postgre Sql","Para almacenar datos","si","11","0","1","2016-01-07","http://mediafire.com/id=203044","Postgresql");
INSERT INTO libros VALUES("19","images/db2.jpg","SYBAse","Para almacenar datos","no","11","0","1","2016-01-07","http://mediafire.com/id=203044","SYBAse");
INSERT INTO libros VALUES("20","images/db3.jpg","dBASE III","Para almacenar datos","si","11","0","1","2016-01-06","http://mega.co.nz/sldldldlffkf","dBASE");
INSERT INTO libros VALUES("21","images/db4.jpg","IBM Informix","Para almacenar datos","no","11","0","1","2016-01-07","http://mega.co.nz/sldldldlffkf","Informix");
INSERT INTO libros VALUES("22","images/db5.jpg","SQL Server 2012","Para almacenar datos","si","11","0","1","2016-01-07","http://mediafire.com/id=203044","sqlserver");
INSERT INTO libros VALUES("23","images/db6.jpg","Oracle 11g","Para almacenar datos","si","11","0","2","2016-01-14","http://mediafire.com/id=203044","Oracle");
INSERT INTO libros VALUES("24","images/sistemas1.jpg","Libro de Sistemas","Para aprender mas","si","12","0","1","2016-01-07","http://mediafire.com/id=203044","sistemas");
INSERT INTO libros VALUES("25","images/sistemas2.jpg","Libro de Sistemas","Para aprender mas","no","12","0","1","2016-01-07","http://mediafire.com/id=203044","sistemas");
INSERT INTO libros VALUES("26","images/sistemas3.jpg","Libro de Sistemas","Para aprender mas","si","12","0","1","2016-01-06","http://mega.co.nz/sldldldlffkf","sistemas");
INSERT INTO libros VALUES("27","images/sistemas4.jpg","Libro de Sistemas","Para aprender mas","no","12","0","1","2016-01-07","http://mega.co.nz/sldldldlffkf","sistemas");
INSERT INTO libros VALUES("28","images/sistemas5.jpg","Libro de Sistemas","Para aprender mas","si","12","0","1","2016-01-07","http://mediafire.com/id=203044","sistemas");
INSERT INTO libros VALUES("29","images/sistemas6.jpg","Libro de Sistemas","Para aprender mas","si","12","0","2","2016-01-14","http://mediafire.com/id=203044","sistemas");
INSERT INTO libros VALUES("30","images/informatica1.jpg","Libro de informatica","Para aprender mas","si","13","0","1","2016-01-07","http://mediafire.com/id=203044","informatica");
INSERT INTO libros VALUES("31","images/informatica2.jpg","Libro de informatica","Para aprender mas","no","13","0","1","2016-01-07","http://mediafire.com/id=203044","informatica");
INSERT INTO libros VALUES("32","images/informatica3.jpg","Libro de informatica","Para aprender mas","si","13","0","1","2016-01-06","http://mega.co.nz/sldldldlffkf","informatica");
INSERT INTO libros VALUES("33","images/informatica4.jpg","Libro de informatica","Para aprender mas","no","13","0","1","2016-01-07","http://mega.co.nz/sldldldlffkf","informatica");
INSERT INTO libros VALUES("34","images/informatica5.jpg","Libro de informatica","Para aprender mas","si","13","0","1","2016-01-07","http://mediafire.com/id=203044","informatica");
INSERT INTO libros VALUES("35","images/informatica6.jpg","Libro de informatica","Para aprender mas","si","13","0","2","2016-01-14","http://mediafire.com/id=203044","informatica");
INSERT INTO libros VALUES("36","images/mysql.jpg","Libro de Mysql 3","Es de buena calidad","si","1","1","1","2018-09-11","www.googledrive.com","");
INSERT INTO libros VALUES("37","images/mysql.jpg","Libro de SQL Server 234","Es de buena calidad","si","1","1","1","2018-09-28","www.googledrive.com","");



DROP TABLE IF EXISTS pdf;

CREATE TABLE `pdf` (
  `id_pdf` int(10) NOT NULL AUTO_INCREMENT,
  `id_libro` int(10) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext,
  `tamanio` int(10) unsigned DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pdf`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `pdf_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO pdf VALUES("1","5","javascript","Buen Libro","13311","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("2","3","Mysql Avanzado","Para conectar base de datos","970475","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("3","4","HTML 5","Para aplicaciones web","635134","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("4","5","Java Enterprise Edition","Para aplicaciones moviles y de escritorio","294261","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("5","9","Jquery","Sincronizacion con el servidor","405398","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("6","10","php","Buen Libro","13311","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("7","11","pyton","Para conectar base de datos","970475","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("8","12","Visual Basic","Para aplicaciones web","635134","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("9","6","Asp. Net","Para aplicaciones moviles y de escritorio","294261","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("10","17","C#","Sincronizacion con el servidor","405398","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("11","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("12","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("13","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("14","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("15","4","HTML 5","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("16","17","C# Avanzado","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("17","30","informatica2","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("18","31","dkfk","dkkf","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("19","28","prueba","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("20","8","Libro pdf de ajax","es bueno","403835","application/pdf","art08.pdf");
INSERT INTO pdf VALUES("21","9","Libro de Ejemplo para Angel","Es de buena calidad","915929","application/pdf","slidex.tips_catalogo-de-celulares.pdf");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO prestamo_libro VALUES("1","2016-02-07","2016-02-23","3","1","1");
INSERT INTO prestamo_libro VALUES("2","2016-02-07","2016-02-10","33","2","1");



DROP TABLE IF EXISTS proveedor;

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO proveedor VALUES("1","Libreria COPASA","Managgua","234955","gomper23@gmail.com");
INSERT INTO proveedor VALUES("2","Libreria COPASA","Managgua","234955","gomper23@gmail.com");



DROP TABLE IF EXISTS subcategorias;

CREATE TABLE `subcategorias` (
  `id_subcategoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO subcategorias VALUES("1","C");
INSERT INTO subcategorias VALUES("2","C#");
INSERT INTO subcategorias VALUES("3","C++");
INSERT INTO subcategorias VALUES("4","php");
INSERT INTO subcategorias VALUES("5","java");
INSERT INTO subcategorias VALUES("6","python");
INSERT INTO subcategorias VALUES("7","html");
INSERT INTO subcategorias VALUES("8","Javascript 3");



DROP TABLE IF EXISTS suscriptores;

CREATE TABLE `suscriptores` (
  `id_suscriptor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(30) DEFAULT NULL,
  `correo` varchar(30) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `fecha_suscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_suscriptor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO suscriptores VALUES("4","Elli","elier.aries@gmail.com","nada","2016-01-08");
INSERT INTO suscriptores VALUES("5","carlos jose","carloslslslsl","nada","2016-01-08");
INSERT INTO suscriptores VALUES("6","german","german@gmail.com","nada","2016-01-08");
INSERT INTO suscriptores VALUES("13","Carlos","elier.aries@gmail.com","nada","2018-09-14");
INSERT INTO suscriptores VALUES("15","Jose Roa","neltonelcerebro@gmail.com","nada","2018-09-14");
INSERT INTO suscriptores VALUES("16","","","","2018-10-05");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO usuario_estudiante VALUES("1","2012-43355","Elier","Rocha","elier.aries@gmail.com","4to","Ingenieria de Sistemas");
INSERT INTO usuario_estudiante VALUES("2","2012-43356","Alex ","jarquin","alexjqr@gmail.com","5to.","Ingenieria Civil");
INSERT INTO usuario_estudiante VALUES("6","2012-4356","Juan Carlos","perez","juanperez@gmail.com","4to.","Ingenieria Agroindustrial");
INSERT INTO usuario_estudiante VALUES("7","2012-0394J","Carlos Jose","Gomez","elier.aries@gmail.com","5to.","Ingenieria de Sistemas");



DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(180) DEFAULT NULL,
  `password` varchar(180) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `id_extreme` varchar(180) DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `imagen` blob,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO usuarios VALUES("10","elier","elier123","elier.aries@gmail.com","","admin","","");



DROP TABLE IF EXISTS visitantes;

CREATE TABLE `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO visitantes VALUES("1","elier","elier123","1");
INSERT INTO visitantes VALUES("2","javier","javier123","1");



DROP TABLE IF EXISTS visitas;

CREATE TABLE `visitas` (
  `utc` int(10) NOT NULL,
  `fecha_visita` date NOT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `pagina` varchar(255) NOT NULL,
  PRIMARY KEY (`utc`),
  UNIQUE KEY `utc` (`utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO visitas VALUES("1536953675","2018-09-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1536953681","2018-09-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1536954390","2018-09-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537023751","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537023900","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537023915","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537024064","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537024334","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537024373","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537024447","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537025081","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537025083","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/plist.php?cat=1");
INSERT INTO visitas VALUES("1537025121","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/plist.php?cat=1");
INSERT INTO visitas VALUES("1537025656","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/plist.php?cat=1");
INSERT INTO visitas VALUES("1537025930","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1537025940","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537025946","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537025975","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537025979","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026014","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026017","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026018","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026046","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026049","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026090","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026105","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026128","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026189","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026212","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026214","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026454","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537026484","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537034440","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537034442","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537034459","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537034472","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=13");
INSERT INTO visitas VALUES("1537034555","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=13");
INSERT INTO visitas VALUES("1537034576","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537034826","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537034846","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537034904","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=12");
INSERT INTO visitas VALUES("1537034923","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=10");
INSERT INTO visitas VALUES("1537035146","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=10");
INSERT INTO visitas VALUES("1537035149","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035156","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537035167","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537035213","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035458","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035469","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035508","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035518","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537035529","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537035568","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=4");
INSERT INTO visitas VALUES("1537035589","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537035597","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537035655","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537035669","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035705","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035708","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035730","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537035742","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537035753","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=4");
INSERT INTO visitas VALUES("1537035763","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537035773","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=10");
INSERT INTO visitas VALUES("1537035794","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537035953","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537035962","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036025","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036048","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036148","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036161","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036275","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036279","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036308","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537036330","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537036340","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537036355","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=4");
INSERT INTO visitas VALUES("1537036528","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537036658","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537036666","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537037112","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537037119","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537037174","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537037183","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537037189","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=4");
INSERT INTO visitas VALUES("1537038005","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537038021","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537038093","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537038105","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537038115","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537038128","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=10");
INSERT INTO visitas VALUES("1537038135","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038277","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038302","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038396","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038491","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038506","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038515","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038548","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038842","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038940","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537038953","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1537039190","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537039192","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1537039253","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1537039266","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1537039271","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1537039278","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1537039333","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1537039473","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1537039539","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_bd.php");
INSERT INTO visitas VALUES("1537039566","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_bd.php");
INSERT INTO visitas VALUES("1537039583","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_bd.php");
INSERT INTO visitas VALUES("1537039597","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_bd.php");
INSERT INTO visitas VALUES("1537039606","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537039614","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537039789","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537039937","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537039940","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537039941","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040002","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040085","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040114","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040201","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040238","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040294","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040304","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040437","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?buscar=&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040467","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040468","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040482","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040488","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=Ordenador&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040837","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=Ordenador&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040844","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040850","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040858","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040865","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040886","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=html&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040915","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=html&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537040917","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537040993","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041270","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041286","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041295","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041311","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041375","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041377","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041394","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041919","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537041931","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042009","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042023","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537042035","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537042038","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042053","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042085","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042088","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042335","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042629","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537042637","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042644","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042921","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042929","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537042943","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043711","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043732","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043763","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043783","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043801","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043816","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537043910","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1537043914","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1537043916","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044047","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044050","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044053","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044055","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044075","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537044084","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537044093","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044098","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=py&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044108","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=python&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044116","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=php&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044121","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044131","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044136","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=ajax&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044141","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044183","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044197","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044204","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044215","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044240","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044247","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044286","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044332","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044342","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044354","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044372","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044387","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044419","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044421","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=visual&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044422","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044432","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044456","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044468","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044473","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044479","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=mysql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044689","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=mysql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537044700","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537044728","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1537044731","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537044875","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537044903","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537048058","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=mysql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537048065","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537048072","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537048081","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=10");
INSERT INTO visitas VALUES("1537048086","2018-09-15","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537121670","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537124925","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537124986","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125129","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125259","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125277","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125282","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125329","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537125350","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537125542","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537125685","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537125697","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537125998","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537126023","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537126158","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537126169","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=13");
INSERT INTO visitas VALUES("1537126201","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537126215","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537126229","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1537126316","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1537126328","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1537126338","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_sistemas.php");
INSERT INTO visitas VALUES("1537126457","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126558","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126623","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537126632","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537126638","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126700","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126706","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126758","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537126771","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537126777","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537126812","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537126851","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537126895","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537126910","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537126916","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=1");
INSERT INTO visitas VALUES("1537126923","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537126930","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=4");
INSERT INTO visitas VALUES("1537126934","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=8");
INSERT INTO visitas VALUES("1537126943","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=9");
INSERT INTO visitas VALUES("1537126948","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537126955","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=12");
INSERT INTO visitas VALUES("1537126976","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=11");
INSERT INTO visitas VALUES("1537126980","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=13");
INSERT INTO visitas VALUES("1537126984","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=16");
INSERT INTO visitas VALUES("1537126988","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537127137","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537127212","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127289","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127293","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127297","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127315","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127318","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127407","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127410","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127416","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127721","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php?cat=2");
INSERT INTO visitas VALUES("1537127739","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1537127743","2018-09-16","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537138282","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537139314","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537139349","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537139969","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537139973","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140037","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140039","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140041","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140737","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140740","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140746","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=3");
INSERT INTO visitas VALUES("1537140753","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=4");
INSERT INTO visitas VALUES("1537140760","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=5");
INSERT INTO visitas VALUES("1537140766","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537140780","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537140787","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537140795","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=2");
INSERT INTO visitas VALUES("1537140803","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=5");
INSERT INTO visitas VALUES("1537141108","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=5");
INSERT INTO visitas VALUES("1537141111","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=5");
INSERT INTO visitas VALUES("1537141124","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=4");
INSERT INTO visitas VALUES("1537152822","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1537152872","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1537152893","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?=pagina=3");
INSERT INTO visitas VALUES("1537152909","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=php&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537152918","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537153021","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537153023","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1537153026","2018-09-17","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1538698987","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1538698993","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1538701773","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538702222","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1538706309","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706340","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706387","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706404","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706500","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706613","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706796","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1538706849","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538706972","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538707009","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538707027","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538707136","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538707140","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/index.php");
INSERT INTO visitas VALUES("1538707150","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/");
INSERT INTO visitas VALUES("1538707280","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708192","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708343","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708350","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708353","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708356","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1538708359","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708525","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708546","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708550","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1538708558","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708613","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538708615","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1538708621","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1538709002","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=pc&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1538709005","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1538709008","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1538709010","2018-10-05","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1539313768","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314274","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314324","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314486","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314510","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314616","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314619","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1539314623","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314628","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=1");
INSERT INTO visitas VALUES("1539314634","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1539314640","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=11");
INSERT INTO visitas VALUES("1539314648","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1539314654","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539314745","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=php&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539314751","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539314757","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1539314761","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314802","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314810","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=1");
INSERT INTO visitas VALUES("1539314814","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=11");
INSERT INTO visitas VALUES("1539314821","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1539314834","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539314837","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1539314842","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539314847","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539314851","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1539315518","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315637","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315640","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315696","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315724","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315745","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315880","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315902","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539315959","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539316013","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539316062","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539316086","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1539316093","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1539316097","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php?cat=11");
INSERT INTO visitas VALUES("1539316105","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1539316110","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=sql&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539316118","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1539316127","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/busqueda.php?buscar=java&enviar=Buscar+Libro");
INSERT INTO visitas VALUES("1539316146","2018-10-12","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36","/biblioteca/inicio.php");



SET FOREIGN_KEY_CHECKS=1;