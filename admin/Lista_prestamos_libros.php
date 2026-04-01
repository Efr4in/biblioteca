<?php
session_start();
include("conexion.php");
if(isset($_SESSION['user'])) { ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biblioteca | Panel Administracion</title>
    <link rel="shortcut icon" href="../images/iconolibreria.ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/morris.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <?php include('navegacion.php'); ?>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">
                        <small><img src="images/logo.png"></small> Listado de Prestamos
                    </h2>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12" style="overflow-x:auto;">
                <?php
                $registro = mysqli_query($con, "
                    SELECT 
                        prestamo_libro.id_prestamo AS prestamo,
                        prestamo_libro.fecha_prestamo AS fecha1,
                        prestamo_libro.fecha_entrega AS fecha2,
                        libros.nombre AS nombre,
                        usuario_estudiante.nombre AS estudiante,
                        prestamo_libro.estado AS estado
                    FROM prestamo_libro
                    INNER JOIN libros ON prestamo_libro.id_libro = libros.id_libro
                    INNER JOIN usuario_estudiante ON prestamo_libro.id_usuario_estudiante = usuario_estudiante.id_usuario_estudiante
                    ORDER BY prestamo_libro.id_prestamo DESC
                ");

                echo '<table class="table table-striped table-condensed table-hover" style="width:100%; table-layout:auto;">
                    <tr>
                        <th>Prestamo</th>
                        <th>Fecha Prestamo</th>
                        <th>Fecha Entrega</th>
                        <th>Libro</th>
                        <th>Estudiante</th>
                        <th>Estado</th>
                        <th>Opciones</th>
                    </tr>';

                if (mysqli_num_rows($registro) > 0) {
                    while ($registro2 = mysqli_fetch_assoc($registro)) {
                        $id     = $registro2['prestamo'];
                        $estado = $registro2['estado'];

                        $color    = ($estado == 1) ? 'background:red; color:white;' : 'background:green; color:white;';
                        $etiqueta = ($estado == 1) ? 'Prestado' : 'Devuelto';

                        echo '<tr style="' . $color . '">
                            <td>' . $registro2['prestamo']   . '</td>
                            <td>' . $registro2['fecha1']     . '</td>
                            <td>' . $registro2['fecha2']     . '</td>
                            <td>' . $registro2['nombre']     . '</td>
                            <td>' . $registro2['estudiante'] . '</td>
                            <td>' . $etiqueta                . '</td>
                            <td>';

                        if ($estado == 1) {
                            echo '<a href="prestamos_libros/entregar_libro.php?id=' . $id . '">
                                    <button class="btn btn-success btn-xs">Devolver</button>
                                  </a>';
                        }

                        echo '</td></tr>';
                    }
                } else {
                    echo '<tr><td colspan="7">No se encontraron resultados</td></tr>';
                }

                echo '</table>';
                ?>
                </div>
            </div>
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