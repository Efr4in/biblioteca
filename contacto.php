<?php
session_start();
include("admin/conexion.php");
if(isset($_SESSION['usuario']))
{
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Contacto - Biblioteca Virtual">
    <title>Biblioteca Virtual | Contacto</title>

    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <link rel="shortcut icon" href="images/ico/favicon.ico">
</head>

<body>

<?php include ('includes/header.php'); ?>

<br>

<div id="contact-page" class="container">
    <div class="bg">
        
        <!-- ================= MAPA ================= -->
        <div class="row">
            <div class="col-sm-12">
                <h2 class="title text-center">Nuestra Ubicación</h2>

                <div class="contact-map" style="box-shadow:0 4px 15px rgba(0,0,0,0.2); border-radius:12px; overflow:hidden;">
                    
                    <!-- Embed oficial del lugar -->
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3825.565282055187!2d-68.1490103!3d-16.530801!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x915edf63f46946a9%3A0xba61babe2fd49823!2sBoliviano%20Holand%C3%A9s!5e0!3m2!1ses!2sbo!4v1708830000000"
                        width="100%"
                        height="450"
                        style="border:0;"
                        allowfullscreen
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>

                </div>

                <br>

                <div class="text-center">
                    <a href="https://www.google.com/maps/place/Boliviano+Holand%C3%A9s/@-16.530801,-68.1490103,19z"
                       class="btn btn-primary"
                       target="_blank">
                       Ver en Google Maps
                    </a>
                </div>
            </div>
        </div>

        <br><br>

        <!-- ================= FORMULARIO ================= -->
        <div class="row">
            <div class="col-sm-8">
                <div class="contact-form">
                    <h2 class="title text-center">Escríbenos</h2>

                    <form action="funciones_php/validar_mensaje.php"
                          class="contact-form row"
                          method="post">

                        <div class="form-group col-md-6">
                            <input type="text" name="nombre"
                                   class="form-control"
                                   required
                                   placeholder="Nombre">
                        </div>

                        <div class="form-group col-md-6">
                            <input type="email" name="email"
                                   class="form-control"
                                   required
                                   placeholder="Email">
                        </div>

                        <div class="form-group col-md-12">
                            <input type="text" name="asunto"
                                   class="form-control"
                                   required
                                   placeholder="Asunto">
                        </div>

                        <div class="form-group col-md-12">
                            <textarea name="mensaje"
                                      required
                                      class="form-control"
                                      rows="6"
                                      placeholder="Escribe tu mensaje"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <input type="submit"
                                   class="btn btn-success pull-right"
                                   value="Enviar Mensaje">
                        </div>

                    </form>
                </div>
            </div>

            <!-- ================= INFORMACIÓN ================= -->
            <div class="col-sm-4">
                <div class="contact-info">
                    <h2 class="title text-center">Información</h2>
                    <address>
                        <p><strong>Biblioteca Virtual</strong></p>
                        <p>Unidad Educativa Boliviano Holandés</p>
                        <p>FV92+PCG, Diego de Ocaña</p>
                        <p>El Alto, La Paz - Bolivia</p>
                        <p><strong>Email:</strong> contacto@biblioteca.com</p>
                    </address>
                </div>
            </div>

        </div>
    </div>
</div>

<?php include ('includes/footer.php'); ?>

<!-- JS -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>

<?php include "log.php"; ?>
<?php
}else{
    echo '<script> window.location="index.php"; </script>';
}
?>