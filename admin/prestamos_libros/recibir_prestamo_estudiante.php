<?php
require_once '../conexion.php';

// Validar que llegaron todos los datos necesarios
if (!isset($_POST["id"], $_POST["fecha1"], $_POST["fecha2"], $_POST["estudiante"])) {
    echo '<script>alert("Error: faltan datos del formulario."); window.location="../prestar_libro.php";</script>';
    exit;
}

$id         = intval($_POST["id"]);
$fecha1     = $_POST["fecha1"];
$fecha2     = $_POST["fecha2"];
$estudiante = intval($_POST["estudiante"]);

$sql = "INSERT INTO prestamo_libro (fecha_prestamo, fecha_entrega, id_libro, id_usuario_estudiante, estado) 
        VALUES ('$fecha1', '$fecha2', '$id', '$estudiante', '1')";

$resultado = mysqli_query($con, $sql);

if ($resultado) {
    $peticion2 = "UPDATE libros SET disponible = 'no' WHERE id_libro = '$id'";
    mysqli_query($con, $peticion2);
    echo '<script>alert("Prestamo Exitoso."); window.location="../prestar_libro.php";</script>';
} else {
    echo '<script>alert("Error al procesar el prestamo: ' . mysqli_error($con) . '"); window.location="../prestar_libro.php";</script>';
}
?>