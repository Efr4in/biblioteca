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
    <link rel="shortcut icon" href="../images/favicon-escudo.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/estilo.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="avisos/myjava.js"></script>
</head>
<body>
      <?php include('navegacion.php');?>

        <div id="page-wrapper">
            <div class="container-fluid">
             <br>
                <div class="row">
                    <div class="col-lg-12"></div>
                </div>
                <h1 class="page-header">
                    <small><img src="images/logo.png"></small> Avisos del Inicio
                </h1>
                <p style="margin-bottom:20px;">Estos avisos se muestran en el carrusel de la página de inicio. El campo "Orden" decide en qué posición aparece cada uno (menor número va primero).</p>
    <section>
    <table border="0" align="left">
        <tr>
        <td style="margin-right:20px;"><B> Buscar Aviso: </B></td>
        <td>&nbsp; &nbsp;</td>
        <td width="335"><input type="text" placeholder="Busca por Título" id="bs-prod" style="border-radius:10px; padding-left:5px; height:25px; width:90%" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="130"><button id="nuevo-producto" class="btn btn-success">Nuevo Aviso</button></td>
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

    <div class="modal fade" id="registra-producto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header" style="background:#839ca9;">
              <button type="button" class="close" style="color:white; font-size: 20px;" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" style="color:white;" id="myModalLabel"><b>Mantenimiento de Avisos</b></h4>
            </div>
            <form id="formulario" class="form-group" enctype="multipart/form-data" onsubmit="return agregaAviso();">
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
                        <td>Imagen: </td>
                        <td>
                            <input type="file" class="form-control" name="imagen" id="imagen" accept="image/png, image/jpeg, image/jpg, image/webp" />
                            <small id="imagenActualTxt" style="display:none;">Deja este campo vacío si no quieres cambiar la imagen actual.</small>
                        </td>
                    </tr>
                    <tr>
                        <td>Título: </td>
                        <td><input type="text" class="form-control" required name="titulo" id="titulo" maxlength="150"/></td>
                    </tr>
                    <tr>
                        <td>Subtítulo: </td>
                        <td><input type="text" class="form-control" name="subtitulo" id="subtitulo" maxlength="200"/></td>
                    </tr>
                    <tr>
                        <td>Contenido: </td>
                        <td><textarea class="form-control" required name="contenido" id="contenido" rows="4" maxlength="600"></textarea></td>
                    </tr>
                    <tr>
                        <td>Orden: </td>
                        <td><input type="number" class="form-control" name="orden" id="orden" value="0" min="0" required/></td>
                    </tr>
                    <tr>
                        <td>Activo: </td>
                        <td>
                            <label style="margin-right: 20px;">
                                <input type="radio" name="activo" value="si" checked required> Sí
                            </label>
                            <label>
                                <input type="radio" name="activo" value="no"> No
                            </label>
                        </td>
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
                <input type="submit" value="Editar" class="btn btn-warning" id="edi"/>
            </div>
            </form>
          </div>
        </div>
      </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
<?php
}else{
    echo '<script> window.location="../login/login.php"; </script>';
}
?>