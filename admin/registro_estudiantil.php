<?php
session_start();
include("conexion.php");
if(isset($_SESSION['user'])) { ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteca | Registro Estudiantil</title>
    <link rel="shortcut icon" href="../images/favicon-escudo.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <style>
        .registro-card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 650px;
            margin: 0 auto;
            overflow: hidden;
        }
        .registro-card-header {
            background: #064589;
            padding: 22px 28px;
            color: #fff;
        }
        .registro-card-header h3 {
            margin: 0;
            font-weight: 600;
        }
        .registro-card-header p {
            margin: 4px 0 0 0;
            font-size: 13px;
            color: rgba(255,255,255,0.8);
        }
        .registro-card-body {
            padding: 26px 28px;
        }
        .registro-nota {
            background: #F0F9F0;
            border-left: 4px solid #2E7D32;
            padding: 12px 16px;
            font-size: 13px;
            color: #444;
            border-radius: 4px;
            margin-bottom: 22px;
        }
        .registro-card-body label {
            font-weight: 500;
            color: #333;
        }
        .registro-card-body .form-control {
            border-radius: 5px;
        }
        .btn-registrar {
            background: #064589;
            color: #fff;
            border: none;
            padding: 10px 28px;
            border-radius: 5px;
            font-weight: 500;
        }
        .btn-registrar:hover {
            background: #05356b;
            color: #fff;
        }
    </style>
</head>
<body>
    <?php include('navegacion.php'); ?>

    <div id="page-wrapper">
        <div class="container-fluid">
            <br>
            <h1 class="page-header">
                <small><img src="../images/home/escudo-boliviano-holandes.png" height="34"></small> Registro Estudiantil
            </h1>

            <div class="registro-card">
                <div class="registro-card-header">
                    <h3><i class="fa fa-user-plus"></i> Nuevo Acceso de Estudiante</h3>
                    <p>Crea el usuario y contraseña con los que el estudiante podrá ingresar a la Biblioteca Virtual.</p>
                </div>
                <div class="registro-card-body">
                    <div class="registro-nota">
                        <i class="fa fa-check-circle"></i>
                        <b>Sí, este formulario da acceso funcional de inmediato.</b> El usuario y contraseña que
                        definas aquí quedan guardados y el estudiante puede iniciar sesión en la Biblioteca Virtual
                        al instante. Es distinto del directorio en <a href="estudiantes.php">"Estudiantes"</a>, que
                        solo guarda un registro/carnet sin credenciales de acceso.
                    </div>

                    <form name="user" method="post" action="../funciones_php/validarVisitante.php">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nombre Completo</label>
                                    <input type="text" class="form-control" name="nombre" required placeholder="Nombre Completo">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" required placeholder="Email">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Teléfono</label>
                                    <input type="number" class="form-control" name="telefono" required placeholder="Teléfono">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Edad</label>
                                    <input type="number" class="form-control" name="edad" required placeholder="Edad">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Dirección</label>
                                    <input type="text" class="form-control" name="direccion" required placeholder="Dirección">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Provincia</label>
                                    <input type="text" class="form-control" name="provincia" required placeholder="Provincia">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Ciudad / Estado</label>
                                    <input type="text" class="form-control" name="estado" required placeholder="Ciudad / Estado">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>País</label>
                                    <input type="text" class="form-control" name="pais" required placeholder="País">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Sexo</label>
                                    <select class="form-control" name="sexo">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Usuario (para iniciar sesión)</label>
                                    <input type="text" class="form-control" name="alias" required placeholder="Nombre de Usuario">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input type="text" class="form-control" name="pass" required placeholder="Contraseña">
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn-registrar"><i class="fa fa-check"></i> Registrar Estudiante</button>
                    </form>
                </div>
            </div>
            <br>
        </div>
    </div>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
<?php
} else {
    echo '<script> window.location="../login/login.php"; </script>';
}
?>
