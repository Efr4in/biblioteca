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
    <link rel="shortcut icon" href="images/favicon-escudo.ico">
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
			            <div style="display:flex; align-items:center; gap:12px; margin-top:15px;">
			                <a href="busqueda.php" class="btn btn-primary" style="margin:0; box-sizing:border-box; display:inline-block; padding:6px 12px; line-height:1.42857143; border:1px solid transparent; border-radius:4px;">Ver Catálogo Completo</a>
			                <a href="contacto.php" class="btn" style="margin:0; box-sizing:border-box; display:inline-block; padding:6px 12px; line-height:1.42857143; border:1px solid #064589; border-radius:4px; color:#064589; background:#fff;">Contactar Biblioteca</a>
			            </div>
			         </div>

			     </div>

			     <div class="row" style="margin-top:30px;">
			         <div class="col-md-6">
			            <h3 style="color:#064589;">Misión</h3>
			            <p>
			            	La Unidad Educativa Boliviano Holandés tiene como misión formar integralmente a sus
			            	estudiantes, promoviendo valores de respeto, responsabilidad y solidaridad, cuenta
			            	con personal docente de amplia experiencia y calificados en el ámbito educativo.
			            	Brinda una educación de calidad en concordancia al currículo del ministerio de
			            	educación complementado con contenidos actualizados y revisados aplicando
			            	metodologías y estrategias acordes a las características de los estudiantes
			            	basados en principios y valores atendiendo las necesidades del mundo moderno
			            	para formar personas críticas, responsables, respetuosas y capaces de enfrentar
			            	los retos en sus vidas.
			            </p>
			         </div>
			         <div class="col-md-6">
			            <h3 style="color:#C81C28;">Visión</h3>
			            <p>
			            	Mantener el liderazgo en el campo educativo dentro de la comunidad con
			            	metodologías y contenidos acordes a los avances tecnológicos, formando
			            	estudiantes protagonista de su propio aprendizaje con la capacidad de
			            	investigar, innovar, tener un sentido crítico y una conciencia democrática
			            	comprometidos con el desarrollo social, ambiental y económico de nuestro país.
			            </p>
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