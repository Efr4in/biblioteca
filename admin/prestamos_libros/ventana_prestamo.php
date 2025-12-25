<?php
session_start();
include("../conexion.php");
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
    <link rel="shortcut icon" href="../../images/iconolibreria.ico">
    <link href="../css/bootstrap.min.css" rel="stylesheet">  
    <link href="../css/sb-admin.css" rel="stylesheet">
    <link href="../css/morris.css" rel="stylesheet">
    <link href="admin_productos/css/estilo.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="..7comentarios/Mis_funciones.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
      <script src="visitas/visitas.js"></script>
 
</head>
<body>
      <?php include('../navegacion.php');?>

        <div id="page-wrapper">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            <small><img src="../images/logo.png"></small>Visitas de la Tienda
                        </h2>
                    </div>
                </div>
                <!-- /.row -->
                <div class='row'>   <!-- /.Inicia el primer row -->
   <a href="../prestar_libro.php"> <input type="button" value="Cancelar" class="btn btn-danger" id="reg"/></a>
                                <?php include "../conexion.php" ?>
                <?php
                 $id = $_GET['id'];

                        $consulta3="select id_usuario_estudiante, nombre from usuario_estudiante";
                        $estudiante=mysqli_query($con, $consulta3);

                ?>
              
               <form class="form-group" method="post" action="recibir_prestamo_estudiante.php" enctype="multipart/form-data">
            <div class="modal-body">
                <table border="0" width="50%">
                     <tr>
           <td colspan="2"><input type="text" class="form-control" required readonly id="id-prod" name="id-prod" readonly="readonly" style="visibility:hidden; height:5px;"/></td>
                    </tr>
                    <input name="id" type="hidden" value="<?php echo $id ?>" />
                    <tr>
                        <td>fecha de Entrega:</td>
              <td><input type="date" class="form-control" required name="fecha1"/></td>
                    </tr>
                     <tr>
                        <td>fecha de Devolucion:</td>
              <td><input type="date" class="form-control" required name="fecha2"/></td>
                    </tr>

                    <tr>
                        <td>Estudiante:</td>
                          <td>
                             <select name="estudiante" class="form-control" requerid>
                      <?php 
                      while($fila=mysqli_fetch_row($estudiante)){
                      echo "<option value='".$fila['0']."'>".$fila['1']."</option>";
                      }
                      ?>
                     </select>
                      </td>
                    </tr>
                    <tr>
                        <td></td>
                         <td>
                         <input type="submit" value="Prestar Libro" class="btn btn-success"/></form>

                         </td>
                    </tr>
                </table>
               </div>  <!-- /. fin de row -->              
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
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