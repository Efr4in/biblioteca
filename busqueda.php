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
	$result2=mysqli_query($con, "SELECT count(utc) as visitas from visitas WHERE fecha_visita = CURDATE( )");
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
    <title>Biblioteca | Inicio</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">     
    <link rel="shortcut icon" href="images/iconolibreria.ico">
</head>
<body>
            <?php include ('includes/header.php');?>	
<section>
          <div class="container">
		     <div class="row">
		     	       <br>
						<div class="col-md-3">
					     <form name="busqueda" method="get" action="busqueda.php">				
							<div class="search_box pull-right">
								<input type="text" placeholder="Buscar" name="buscar" required="true" />
							</div>	
						</div>
						<div class="col-md-1">
						<input type="submit" name="enviar" value="Buscar Libro" class="btn btn-success">
					    </div>	
					     </form>
					<div class="col-md-2">
						<a href="busqueda.php"><button class="btn btn-danger">Ver Todos</button></a>
					    </div>	
              </div> 

                <div class="features_items">
                	<br><br>

                <!-- PESTAÑAS -->
                <ul class="nav nav-tabs" style="margin-bottom:20px;">
                    <li class="active"><a href="#catalogo" data-toggle="tab"><i class="fa fa-book"></i> Catálogo</a></li>
                    <li><a href="#asesor" data-toggle="tab"><i class="fa fa-lightbulb-o"></i> Asesor IA</a></li>
                </ul>

                <div class="tab-content">

                <!-- TAB CATALOGO -->
                <div class="tab-pane active" id="catalogo">

				<h2 class="title text-center">Listado de Libros</h2>
			   <?php

        if (isset($_GET['enviar'])) {
         $busqueda=$_GET['buscar'];
         $query=mysqli_query($con, "select * from libros where nombre like '%$busqueda%' and disponible='si'");
		if (mysqli_num_rows($query) < 1) {
		 echo "<div class='col-sm-3'>";  
		 echo "<p style='color:red;'><b>No tenemos libros que coincidan con este nombre</b></p>"; 
		 echo "</div>";   	
		}
		else{
		while($row=mysqli_fetch_array($query)){
			
		        $id=$row['id_libro'];
				$foto=$row['foto'];
				$nombre=$row['nombre'];
				$descripcion=$row['descripcion']; 	
			?>
		<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
						<img src="admin/<?php echo $foto ?>" width="100" heigth="90">	 <p><?php echo $nombre ?></p>
						    <p><?php //echo $descripcion ?></p>
						    </div>
							    <div class="product-overlay">
									<div class="overlay-content">
						<img src="admin/<?php echo $foto ?>" width="150" heigth="150">
									<p><?php echo $nombre ?></p>
									<a href="admin/pdf/archivo.php?id=<?php echo $row['id_libro']?>" class="btn btn-default add-to-cart">
									<i class="fa fa-download"></i>Ver</a>
                                     </div>
								</div>
					    </div>
					</div>
			   </div>
         <?php } } ?>
         <?php	
        }
        else{
        $query=mysqli_query($con, "select * from libros where disponible='si'");
           while($row=mysqli_fetch_array($query)){
			
		        $id=$row['id_libro'];
				$foto=$row['foto'];
				$nombre=$row['nombre'];
				$descripcion=$row['descripcion']; 	
			?>
		<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
						<img src="admin/<?php echo $foto ?>" width="100" heigth="90">	 <p><?php echo $nombre ?></p>
						    <p><?php //echo $descripcion ?></p>
						    </div>
							    <div class="product-overlay">
									<div class="overlay-content">
						<img src="admin/<?php echo $foto ?>" width="150" heigth="150">
									<p><?php echo $nombre ?></p>
									<a href="admin/pdf/archivo.php?id=<?php echo $row['id_libro']?>" class="btn btn-default add-to-cart">
									<i class="fa fa-download"></i>Ver</a>
                                     </div>
								</div>
					    </div>
					</div>
			   </div>
         <?php
        }}
		
  ?>

                </div> <!-- cierre tab catalogo -->

                <!-- TAB ASESOR IA -->
                <div class="tab-pane" id="asesor">
                    <div class="col-md-8 col-md-offset-2" style="margin-top:20px; margin-bottom:40px;">
                        <h3><i class="fa fa-lightbulb-o"></i> Asesor Inteligente de Biblioteca</h3>
                        <p>Escribe lo que necesitas aprender y el asesor te recomendará el libro ideal de nuestro catálogo.</p>
                        <div class="form-group">
                            <input type="text" id="consultaAsesor" class="form-control" 
                                placeholder="Ej: quiero aprender matemáticas..." 
                                style="border-radius:10px; padding:10px; font-size:15px;">
                        </div>
                        <button onclick="consultarAsesor()" class="btn btn-primary">
                            <i class="fa fa-search"></i> Consultar Asesor
                        </button>
                        <div id="cargando" style="display:none; margin-top:20px; font-size:15px;">
                            <i class="fa fa-spinner fa-spin"></i> Consultando asesor inteligente...
                        </div>
                        <div id="respuesta" style="display:none; margin-top:20px; 
                            padding:20px; background:#f9f9f9; border-radius:10px; 
                            border-left:4px solid #2E75B6;">
                            <h4><i class="fa fa-comment"></i> Recomendación:</h4>
                            <p id="textoRespuesta" style="font-size:15px; line-height:1.6;"></p>
                        </div>
                    </div>
                </div>

                </div> <!-- cierre tab-content -->

		</div>
	</section>
	<!--pie de pagina-->
<?php include ('includes/footer.php');?>
	 <!--Librerias de Jquery, Bootstrap y otras mas--> 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>

<script>
function consultarAsesor() {
    var consulta = document.getElementById('consultaAsesor').value;
    if(consulta.trim() === '') {
        alert('Por favor escribe una consulta.');
        return;
    }
    document.getElementById('cargando').style.display = 'block';
    document.getElementById('respuesta').style.display = 'none';

    fetch('asesor/procesar_consulta.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ consulta: consulta })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('cargando').style.display = 'none';
        document.getElementById('textoRespuesta').innerText = data.respuesta;
        document.getElementById('respuesta').style.display = 'block';
    })
    .catch(error => {
        document.getElementById('cargando').style.display = 'none';
        alert('Error al consultar el asesor. Intenta de nuevo.');
    });
}

document.getElementById('consultaAsesor').addEventListener('keypress', function(e) {
    if(e.key === 'Enter') {
        consultarAsesor();
    }
});
</script>

</body>
</html>
<?php include "log.php"; ?>
<?php
}else{
    echo '<script> window.location="index.php"; </script>';
}
?>
