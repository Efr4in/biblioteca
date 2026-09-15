<?php
session_start();
include("admin/conexion.php");
if(isset($_SESSION['usuario']))
 {

$consulta=mysqli_query($con, "select * from libros limit 0,6");
$nro_reg=mysqli_num_rows($consulta);
    if ($nro_reg==0){
	echo 'No Tienes Productos en la Base de Datos';
	}
	$result=mysqli_query($con, "SELECT count(utc) as visitas from visitas");
   $row = mysqli_fetch_array($result);
    $numero_visitas = $row["visitas"];
    $fechaMensaje =date("Y-m-d");
	$result2=mysqli_query($con, "SELECT count(utc) as visitas from visitas WHERE fecha_visita = '".$fechaMensaje."'");
    $row2 = mysqli_fetch_array($result2);
    $visitas_hoy = $row2["visitas"];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="biblioteca virtual UNI">
    <title>Biblioteca UNI | Inicio</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">     
	<link rel="shortcut icon" href="images/favicon-escudo.ico">
</head>
<body>
<!--barra de correo, telefono y login-->
<?php include ('includes/header.php');?>
<!--slider de imagenes-->
<?php include ('includes/slider.php');?>	
<section>
   <div class="container">
		<div class="row">
		<!--Menu lateral Izquierdo-->
			<?php //include ('includes/sidebarIzquierdo.php'); ?>
			<div class="col-sm-3"> <!--/Inicio de barra lateral izquierda-->
	<div class="left-sidebar">				
	    <div class="brands_products"><!--brands_products-->
			<h2>Categorias</h2>
			<div class="brands-name">
				<ul class="nav nav-pills nav-stacked">
			  
				<?php
							$caq=mysqli_query($con,"select * from categorias");
							while($catrow=mysqli_fetch_array($caq)){
								?>
								<li class="divider"></li>
								<li><a href="inicio.php?cat=<?php echo $catrow['id_categoria']; ?>"><?php echo $catrow['nombre_categoria']; ?></a></li>
								<?php
							}
						
						?>
				</ul>
			</div>
		</div><!--/brands_products-->
		    <div class="price-range"><!--price-range-->
				<h2>Visitas</h2>
				<div class="col-md-4">
				    <img src="images/home/visitas.png" width="60" height="60">
				</div>
				<div class="col-md-8">
					<h5><b><?php  echo $numero_visitas;?> Visitas Totales</b></h5>
					<h6><b><?php  echo $visitas_hoy;?> Visitas Hoy</b></h6>
				</div>
			</div><!--/price-range-->					
	</div>
</div> <!--fin de barra lateral izquierda-->
			<div class="col-sm-9 padding-right">
				<!--Contenido Central donde se muestran los libros-->
                <div class="features_items">
				<h2 class="title text-center">Listado de Libros</h2>
			   <?php

        if (isset($_GET['cat'])) {
         $cat=$_GET['cat'];
         $query=mysqli_query($con,"select nombre, autor from libros where id_categoria='$cat' order by nombre asc");
        }
        else{
         // Sin categoria seleccionada: listado completo, alfabetico por nombre
         $query=mysqli_query($con,"select nombre, autor from libros order by nombre asc");
        }
		if (mysqli_num_rows($query) < 1) {
		 echo "<div class='col-sm-3'>";  
		 echo "<p style='color:red;'><b>No tenemos Libros para esta Categoria</b></p>"; 
		 echo "</div>";   	
		}
		else{
		echo "<ul class='book-list'>";
		while($row=mysqli_fetch_array($query)){

				$nombre=$row['nombre'];
				$autor=$row['autor'];
			?>

            <li class="book-list-item">
                <span class="book-list-nombre"><?php echo $nombre ?></span>
                <span class="book-list-autor"><?php echo $autor ?></span>
            </li>

         <?php } echo "</ul>"; } ?>
         <br>
					<!--Tabs-->
				 <div class="row">	<?php // include ('includes/tabs.php');?> </div>
					<?php //include ('includes/sliderInferior.php');?> 
					<?php //include ('includes/tabs.php');?> 					
				</div>
			</div>
		</div>
	</section>
	<!--pie de pagina-->
<?php include ('includes/footer.php');?>
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