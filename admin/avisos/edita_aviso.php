<?php
include('../conexion.php');
$id = $_POST['id'];
$valores = mysqli_query($con, "SELECT * FROM avisos WHERE id_aviso = '$id'");
$valores2 = mysqli_fetch_array($valores);

$datos = array(
    0 => $valores2['imagen'],
    1 => $valores2['titulo'],
    2 => $valores2['subtitulo'],
    3 => $valores2['contenido'],
    4 => $valores2['orden'],
    5 => $valores2['activo'],
);
echo json_encode($datos);
?>