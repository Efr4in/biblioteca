<?php
include('../conexion.php');
$dato = $_POST['dato'];
$registro = mysqli_query($con, "SELECT * FROM avisos WHERE titulo LIKE '%$dato%' ORDER BY orden ASC, id_aviso ASC");

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