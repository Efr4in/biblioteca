<?php
session_start();
include("../conexion.php");
if(isset($_SESSION['user'])) { ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteca UNI | Panel Administracion</title>
    <link rel="shortcut icon" href="../../images/iconolibreria.ico">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/sb-admin.css" rel="stylesheet">
    <link href="../css/morris.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
    <?php include('../navegacion.php'); ?>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">
                        <small><img src="../images/logo.png"></small> Visitas de la Tienda
                    </h2>
                </div>
            </div>

            <div class="row">
                <a href="../prestar_libro.php">
                    <input type="button" value="Cancelar" class="btn btn-danger" id="reg"/>
                </a>

                <?php
                // Validar que llegó el ID del libro
                if (!isset($_GET['id']) || empty($_GET['id'])) {
                    echo '<script>alert("Error: no se especificó el libro."); window.location="../prestar_libro.php";</script>';
                    exit;
                }

                $id = intval($_GET['id']);

                $consulta3 = "SELECT id_usuario_estudiante, nombre FROM usuario_estudiante";
                $resultEstudiantes = mysqli_query($con, $consulta3);

                if (!$resultEstudiantes) {
                    echo '<div class="alert alert-danger">Error al cargar estudiantes: ' . mysqli_error($con) . '</div>';
                }
                ?>

                <form class="form-group" method="post" action="recibir_prestamo_estudiante.php">
                    <div class="modal-body">
                        <input type="hidden" name="id" value="<?php echo $id; ?>" />

                        <table border="0" width="50%">
                            <tr>
                                <td>Fecha de Entrega:</td>
                                <td><input type="date" class="form-control" required name="fecha1"/></td>
                            </tr>
                            <tr>
                                <td>Fecha de Devolucion:</td>
                                <td><input type="date" class="form-control" required name="fecha2"/></td>
                            </tr>
                            <tr>
                                <td>Estudiante:</td>
                                <td>
                                    <select name="estudiante" class="form-control" required>
                                        <?php
                                        $count = 0;
                                        while ($fila = mysqli_fetch_row($resultEstudiantes)) {
                                            echo "<option value='" . $fila[0] . "'>" . $fila[1] . "</option>";
                                            $count++;
                                        }
                                        if ($count === 0) {
                                            echo "<option value=''>-- No hay estudiantes registrados --</option>";
                                        }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <?php if ($count > 0): ?>
                                        <input type="submit" value="Prestar Libro" class="btn btn-success"/>
                                    <?php else: ?>
                                        <button class="btn btn-secondary" disabled>No hay estudiantes disponibles</button>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>

<?php
} else {
    echo '<script> window.location="../login/login.php"; </script>';
}
?>