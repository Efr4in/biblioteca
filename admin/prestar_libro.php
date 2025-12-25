
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
    <link href="css/estilo.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="prestamos_libros/myjava.js"></script>
</head>
<body>
      <?php include('navegacion.php');?>
        <div id="page-wrapper">
            <div class="container-fluid">
             <br>
                         <h1 class="page-header">
                            <small><img src="images/logo.png"></small> Prestamos de Libros
                        </h1>

                <table border="0" align="center">
                     <tr>
                        <td><B> Buscar Libros: </B></td>
                        <td>&nbsp; &nbsp;</td>
                        <td width="335"><input type="text" placeholder="Buscar" id="bs-prod" style="border-radius:10px; padding-left:5px; heigth:25px; width:90%" /></td>
                        <td width="116"></td>
                        <td>&nbsp;</td>
                       <td width="100"></td>  
                   </tr>
                </table>
              <br>
               <div class="registros" style="width:100%;" id="agrega-registros"></div>
                 <center>
                      <ul class="pagination" id="pagination"></ul>
                </center>
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
