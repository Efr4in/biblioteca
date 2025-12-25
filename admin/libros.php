
 
<?php
session_start();
include("conexion.php");
if(isset($_SESSION['user']))
 {?>

<?php 
$consulta1="select id_categoria, nombre_categoria from categorias";
$categoria=mysqli_query($con, $consulta1);

$consulta2="select id_proveedor, nombre_proveedor from proveedor";
$proveedor=mysqli_query($con, $consulta2);

$consulta3="select id_subcategoria, nombre_subcategoria from subcategorias";
$subcategoria=mysqli_query($con, $consulta3);
?>
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
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Morris Charts CSS -->

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   <link href="css/estilo.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="libros/myjava.js"></script>

</head>
<body>
      <?php include('navegacion.php');?>

        <div id="page-wrapper">

            <div class="container-fluid">
             <br>
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        
                    </div>
                </div>
                <h1 class="page-header">
                            <small><img src="images/logo.png"></small> Libros
                        </h1>
                <!-- /.row -->
    <section>
    <table border="0" align="left">
        <tr>
        <td style="margin-rigth:20px;"><B> Buscar Libro: </B></td>
        <td>&nbsp; &nbsp;</td>
        <td width="335"><input type="text" placeholder="Busca por Nombre" id="bs-prod" style="border-radius:10px; padding-left:5px; heigth:25px; width:90%" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="100"><button id="nuevo-producto" class="btn btn-success">Nuevo Libro</button></td>
            <td>&nbsp; &nbsp;</td>
            <td width="200"></td>
        </tr>
    </table>
    </section>
 <br>
 <br>
    <div class="registros" style="width:100%;" id="agrega-registros"></div>
    <center>
        <ul class="pagination" id="pagination"></ul>
    </center>
    <!-- MODAL PARA EL REGISTRO-->
    <div class="modal fade" id="registra-producto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header" style="background:#839ca9;">
              <button type="button" class="close" style="color:white; font-size: 20px;" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" style="color:white;" id="myModalLabel"><b>Mantenimiento de Libros</b></h4>
            </div>
            <form id="formulario" class="form-group" onsubmit="return agregaLibro();">
            <div class="modal-body">
                <table border="0" width="100%">
                     <tr>
           <td colspan="2"><input type="text" class="form-control" required readonly id="id-prod" name="id-prod" readonly="readonly" style="visibility:hidden; height:5px;"/></td>
                    </tr>
                     <tr>
                        <td width="150">Proceso: </td>
                        <td><input type="text" class="form-control" required readonly id="pro" name="pro"/></td>
                    </tr>
                    <tr>
                        <td>Foto: </td>
                        <td><input type="text" class="form-control" required name="foto" id="foto" maxlength="100"/></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" class="form-control" required name="nombre" id="nombre" maxlength="100"/></td>
                    </tr>
                    <tr>
                        <td>Descripcion: </td>
                        <td><input type="text" class="form-control" required name="descripcion" id="descripcion" maxlength="100"/></td>
                    </tr>
                    <tr>
                        <td>Disponible: </td>
                        <td><input type="text" class="form-control" required name="disponible" id="disponible" maxlength="100"/></td>
                    </tr>
                    <tr>
                        <td>Categoria:</td>
                      <td>
                      <select name="categoria" id="categoria" class="form-control" requerid>
                      <?php 
                      while($fila=mysqli_fetch_row($categoria)){
                      echo "<option value='".$fila['0']."'>".$fila['1']."</option>";
                      }
                      ?>
                     </select>
                      </td>
                    </tr>
                      <tr>
                        <td>Subcategoria:</td>
                      <td>
                      <select name="subcategoria" id="subcategoria" class="form-control" requerid>
                      <?php 
                      while($fila=mysqli_fetch_row($subcategoria)){
                      echo "<option value='".$fila['0']."'>".$fila['1']."</option>";
                      }
                      ?>
                     </select>
                      </td>
                    </tr>
                     <tr>
                        <td>Proveedor:</td>
                      <td>
                      <select name="proveedor" id="proveedor" class="form-control" requerid>
                      <?php 
                      while($fila2=mysqli_fetch_row($proveedor)){
                      echo "<option value='".$fila2['0']."'>".$fila2['1']."</option>";
                      }
                      ?>
                     </select>
                      </td>
                    </tr>
                    <tr>
                        <td>Fecha Ingreso: </td>
                        <td><input type="date" class="form-control" required name="fecha" id="fecha"/></td>
                    </tr>
                    <tr>
                        <td>URL Descarga: </td>
                        <td><input type="text" class="form-control" required name="descarga" id="descarga" maxlength="250"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="mensaje"></div>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="modal-footer">
                <input type="submit" value="Registrar" class="btn btn-success" id="reg"/>
                <input type="submit" value="Editar" class="btn btn-warning"  id="edi"/>
            </div>
            </form>
          </div>
        </div>
      </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->

</body>
</html>
<?php
}else{
    echo '<script> window.location="../login/login.php"; </script>';
}
?>
