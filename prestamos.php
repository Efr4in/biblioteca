<?php
session_start();
include("admin/conexion.php");
if(isset($_SESSION['usuario']))
 {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="biblioteca virtual UNI">
    <title>Libros Web</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">     
    <link rel="shortcut icon" href="images/iconolibreria.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<!--barra de correo, telefono y login-->
<?php include ('includes/header.php');?>
<!--slider de imagenes-->
<?php //include ('includes/slider.php');?>	
	<br>
			<div class="container">
			     <div class="row">

			         <div class="col-md-7">
			          <img src="images/prestamos.jpg" width="600" height="300">
			         </div>

			         <div class="col-md-5">
			            <h3>Prestamo de Libros</h3>
			            <p>
			            	En la Biblioteca Virtual del U.E.P. Boliviano Holandés puedes acceder a nuestro
			            	catálogo de libros de dos formas: consultando el material digital disponible
			            	directamente desde la plataforma, o solicitando el préstamo físico del libro
			            	en la biblioteca del colegio.
			            </p>
			            <p>
			            	Para el préstamo físico, acércate a la biblioteca con tu carnet estudiantil y
			            	el encargado te asistirá con la entrega y registro del libro. Recuerda que la
			            	disponibilidad del material físico se refleja en tiempo real en esta plataforma.
			            </p>
			            <a href="busqueda.php" class="btn btn-primary">Ver Catálogo Completo</a>
			            <a href="contacto.php" class="btn btn-default">Contactar Biblioteca</a>
			         </div>

			     </div>

			     <div class="row">
			         <div class="col-md-12">
			            <h3 class="text-center">¿Cómo funciona?</h3>
			            <div class="row">
			                <div class="col-sm-3 text-center">
			                    <h4>1</h4>
			                    <p>Busca el libro en el catálogo o por categoría.</p>
			                </div>
			                <div class="col-sm-3 text-center">
			                    <h4>2</h4>
			                    <p>Si tiene versión digital, puedes verlo o descargarlo directamente.</p>
			                </div>
			                <div class="col-sm-3 text-center">
			                    <h4>3</h4>
			                    <p>Si necesitas el ejemplar físico, acércate a la biblioteca con tu carnet estudiantil.</p>
			                </div>
			                <div class="col-sm-3 text-center">
			                    <h4>4</h4>
			                    <p>El encargado de biblioteca registra el préstamo y te indica la fecha de devolución.</p>
			                </div>
			            </div>
			         </div>
			     </div>
			</div>
	<br>
	<br>
	<!--pie de pagina-->
<?php include ('includes/footer.php');?>
	 <!--Librerias de Jquery, Bootstrap y otras mas--> 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

<?php include "log.php"; ?>
<?php
}else{
    echo '<script> window.location="index.php"; </script>';
}
?>