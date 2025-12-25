<?php
include('../conexion.php');
	$paginaActual = $_POST['partida'];

    $nroProductos = mysqli_num_rows(mysqli_query($con, "SELECT * FROM libros"));
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
  	$registro = mysqli_query($con, "SELECT * FROM libros LIMIT $limit, $nroLotes ");
  	$tabla = $tabla.'<table class="table table-striped table-condensed table-hover table-responsive">
			    <tr>
              <th width="200">Foto</th>
              <th width="300">Nombre</th>
              <th width="300">Descripcion</th>
              <th width="100">Disponible</th>
              <th width="100">Categoria</th>
              <th width="100">Subcategoria</th>
              <th width="100">Proveedor</th>
              <th width="100">Fecha Ingreso</th>
              <th width="300">URL Descarga</th>
              <th width="50">Opciones</th>
          </tr>';		
	while($registro2 = mysqli_fetch_array($registro)){
    $foto = $registro2['foto'];
    $imagen = '<img src="'.$foto.'" width="50" height="50">';
		$tabla = $tabla.'<tr>
        <td>'.$imagen.'</td>
        <td>'.$registro2['nombre'].'</td>
        <td>'.$registro2['descripcion'].'</td>
        <td>'.$registro2['disponible'].'</td>
        <td>'.$registro2['id_categoria'].'</td>
        <td>'.$registro2['id_subcategoria'].'</td>
        <td>'.$registro2['id_proveedor'].'</td>
        <td>'.$registro2['fecha_ingreso'].'</td>
        <td>'.$registro2['url_descarga'].'</td>
        <td> <a href="javascript:editarLibro('.$registro2['id_libro'].');" class="glyphicon glyphicon-edit eliminar"     title="Editar"></a>
         <a href="javascript:eliminarLibro('.$registro2['id_libro'].');">
         <img src="../images/delete.png" width="15" height="15" alt="delete" title="Eliminar" /></a>
         </td>
        </tr>';		
	}
    $tabla = $tabla.'</table>';
    $array = array(0 => $tabla,
    			   1 => $lista);
    echo json_encode($array);
?>