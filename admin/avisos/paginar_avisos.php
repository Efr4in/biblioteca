<?php
include('../conexion.php');
$paginaActual = $_POST['partida'];

$nroProductos = mysqli_num_rows(mysqli_query($con, "SELECT * FROM avisos"));
$nroLotes = 8;
$nroPaginas = ceil($nroProductos/$nroLotes);
$lista = '';
$tabla = '';

if($paginaActual > 1){
    $lista = $lista.'<li><a href="javascript:pagination('.($paginaActual-1).');">Anterior</a></li>';
}
for($i=1; $i<=$nroPaginas; $i++){
    if($i == $paginaActual){
        $lista = $lista.'<li class="active"><a href="javascript:pagination('.$i.');">'.$i.'</a></li>';
    }else{
        $lista = $lista.'<li><a href="javascript:pagination('.$i.');">'.$i.'</a></li>';
    }
}
if($paginaActual < $nroPaginas){
    $lista = $lista.'<li><a href="javascript:pagination('.($paginaActual+1).');">Siguiente</a></li>';
}

if($paginaActual <= 1){
    $limit = 0;
}else{
    $limit = $nroLotes*($paginaActual-1);
}
$registro = mysqli_query($con, "SELECT * FROM avisos ORDER BY orden ASC, id_aviso ASC LIMIT $limit, $nroLotes");
$tabla = $tabla.'<table class="table table-striped table-condensed table-hover table-responsive">
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

    $tabla = $tabla.'<tr>
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
$tabla = $tabla.'</table>';
$array = array(0 => $tabla, 1 => $lista);
echo json_encode($array);
?>