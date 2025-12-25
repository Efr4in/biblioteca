
<?php
session_start();
include("conexion.php");
if(isset($_SESSION['user']))
 {?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Biblioteca UNI | Panel Administracion</title>
    <link rel="shortcut icon" href="../images/iconolibreria.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">  
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/morris.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="comentarios/Mis_funciones.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
      <?php include('navegacion.php');?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            <small><img src="images/logo.png"></small> Listado de Prestamos
                        </h2>
                    </div>
                </div>
                <!-- /.row -->
                <div class='row'>   <!-- /.Inicia el primer row -->
                <div align="center">
                <?php
$registro = mysqli_query($con, "select prestamo_libro.id_prestamo as prestamo, libros.disponible as disponible, prestamo_libro.fecha_prestamo as fecha1, prestamo_libro.fecha_entrega as fecha2, 
                         libros.nombre as nombre, usuario_estudiante.nombre as estudiante,
                          prestamo_libro.estado as estado
                          from prestamo_libro
                          inner join libros on prestamo_libro.id_libro = libros.id_libro
                         inner join usuario_estudiante on prestamo_libro.id_usuario_estudiante = usuario_estudiante.id_usuario_estudiante") or die(mysql_error());

echo '<table width="900" class="table table-striped table-condensed table-hover">
                           <tr>    
                                    <td><p> <p></td>
                                    <td><p>Prestamo<p></td>
                                    <td><p>Fecha Prestamo<p></td>
                                    <td><p>Fecha Entrega</p></td>
                                    <td ><p>Libro</p></td>
                                    <td><p>Estudiante</p></td>
                                    <td><p>Estado</p></td>
                                    <td><p>Opciones</p></td>
                                  
                            
                          </tr>';
if(mysqli_num_rows($registro)>0){
  while($registro2 = mysqli_fetch_assoc($registro)){
         $id=$registro2['prestamo'];
         $estado=$registro2['estado'];
         $disponible=$registro2['disponible'];

    switch($estado){
      case 0:$diestado = "Prestado";break;
      case 1:$diestado = "Libre";break;
      }
    echo '<tr';
   switch($estado){
    case 0:echo ' style="background:red; color:white;"';break;
    case 1:echo ' style="background:green; color:white;"';break;



     }
    echo'>
        <td> </td>
        <td>'.$registro2['prestamo'].'</td>
        <td>'.$registro2['fecha1'].'</td>
        <td>'.$registro2['fecha2'].'</td>
        <td>'.$registro2['nombre'].'</td>
        <td>'.$registro2['estudiante'].'</td>
        <td>'.$registro2['estado'].'</td>
        '
        ?>
        <?php 
                if(($estado)==0){
                 echo'
              <td><a href="prestamos_libros/entregar_libro.php?id='.$registro2['prestamo'].'"><button class="btn btn-success btn-xs">Devolver</button></a></td>
        </tr>';
      }
      
      
  }
}else{
  echo '<tr>
        <td colspan="6">No se encontraron resultados</td>
      </tr>';
}
echo '</table>'; ?>
</div>

                         <script src="js/jquery.js"></script>
                      <script src="js/bootstrap.min.js"></script>

               </div>  <!-- /. fin de row -->
            </div>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</body>
</html>
<?php
}else{
    echo '<script> window.location="../login/login.php"; </script>';
}
?>