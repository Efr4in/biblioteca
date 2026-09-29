<?php
include('../conexion.php');

$id = $_POST['id-prod'];
$proceso = $_POST['pro'];
$titulo = $_POST['titulo'];
$subtitulo = $_POST['subtitulo'];
$contenido = $_POST['contenido'];
$orden = $_POST['orden'];
$activo = $_POST['activo'];
$fecha = date("Y-m-d");

// Procesamiento de imagen
$imagen = '';

if(isset($_FILES['imagen']) && $_FILES['imagen']['error'] === 0 && !empty($_FILES['imagen']['name'])) {
    $extension = strtolower(pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION));
    $extensionesPermitidas = array('jpg', 'jpeg', 'png', 'webp', 'gif');

    if(in_array($extension, $extensionesPermitidas)) {
        $nuevoNombre = time() . '_' . preg_replace('/[^a-zA-Z0-9._-]/', '', $_FILES['imagen']['name']);
        $rutaDestino = __DIR__ . '/../images/avisos/' . $nuevoNombre;

        if(move_uploaded_file($_FILES['imagen']['tmp_name'], $rutaDestino)) {
            $imagen = 'images/avisos/' . $nuevoNombre;
        }
    }
}

// Si es edición y no se subió nueva imagen, mantener la actual
if($proceso == 'Edicion' && empty($imagen)) {
    $query = mysqli_query($con, "SELECT imagen FROM avisos WHERE id_aviso = '$id'");
    if($row = mysqli_fetch_array($query)) {
        $imagen = $row['imagen'];
    }
}

switch($proceso){
    case 'Registro':
        $sql = "INSERT INTO avisos (titulo, subtitulo, contenido, imagen, orden, activo, fecha_creacion)
                VALUES('$titulo','$subtitulo','$contenido','$imagen','$orden','$activo','$fecha')";
        mysqli_query($con, $sql);
    break;

    case 'Edicion':
        $sql = "UPDATE avisos SET
                titulo = '$titulo',
                subtitulo = '$subtitulo',
                contenido = '$contenido',
                imagen = '$imagen',
                orden = '$orden',
                activo = '$activo'
                WHERE id_aviso = '$id'";
        mysqli_query($con, $sql);
    break;
}

$registro = mysqli_query($con, "SELECT * FROM avisos ORDER BY orden ASC, id_aviso ASC");

echo '<table class="table table-striped table-condensed table-hover">
    <tr>
        <th width="100">Imagen</th>
        <th width="200">Título</th>
        <th width="250">Contenido</th>
        <th width="80">Orden</th>
        <th width="80">Activo</th>
        <th width="50">Opciones</th>
    </tr>';

while($registro2 = mysqli_fetch_array($registro)){
    $imgPath = !empty($registro2['imagen']) ? '../'.$registro2['imagen'] : 'images/sin-imagen.jpg';
    $imagenHtml = '<img src="'.$imgPath.'" width="50" height="50" onerror="this.src=\'images/sin-imagen.jpg\'">';

    echo '<tr>
            <td>'.$imagenHtml.'</td>
            <td>'.$registro2['titulo'].'</td>
            <td>'.mb_strimwidth($registro2['contenido'], 0, 60, '...').'</td>
            <td>'.$registro2['orden'].'</td>
            <td>'.$registro2['activo'].'</td>
            <td>
                <a href="javascript:editarAviso('.$registro2['id_aviso'].');" class="glyphicon glyphicon-edit eliminar" title="Editar"></a>
                <a href="javascript:eliminarAviso('.$registro2['id_aviso'].');">
                <img src="../images/delete.png" width="15" height="15" alt="delete" title="Eliminar" /></a>
            </td>
        </tr>';
}
echo '</table>';
?>