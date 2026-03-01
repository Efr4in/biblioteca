<?php
include('../conexion.php');

$id = $_POST['id-prod'];
$proceso = $_POST['pro'];
$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$autor = $_POST['autor'];
$disponible = $_POST['disponible'];
$categoria = $_POST['categoria'];
$subcategoria = $_POST['subcategoria'];
$proveedor = $_POST['proveedor'];
$fecha = $_POST['fecha'];
$descarga = $_POST['descarga'];

// PROCESAMIENTO DE IMAGEN
$foto = '';

if(isset($_FILES['foto']) && $_FILES['foto']['error'] === 0 && !empty($_FILES['foto']['name'])) {
    
    $extension = strtolower(pathinfo($_FILES['foto']['name'], PATHINFO_EXTENSION));
    $extensionesPermitidas = array('jpg', 'jpeg', 'png', 'webp', 'gif');
    
    if(in_array($extension, $extensionesPermitidas)) {
        $nuevoNombre = time() . '_' . preg_replace('/[^a-zA-Z0-9._-]/', '', $_FILES['foto']['name']);
        $rutaDestino = __DIR__ . '/../images/' . $nuevoNombre;
        
        if(move_uploaded_file($_FILES['foto']['tmp_name'], $rutaDestino)) {
            $foto = 'images/' . $nuevoNombre;
        }
    }
}

// Si es edición y no se subió nueva foto, obtener la foto actual
if($proceso == 'Edicion' && empty($foto)) {
    $query = mysqli_query($con, "SELECT foto FROM libros WHERE id_libro = '$id'");
    if($row = mysqli_fetch_array($query)) {
        $foto = $row['foto'];
    }
}

switch($proceso){
    case 'Registro': 
        $sql = "INSERT INTO libros (foto, nombre, descripcion, autor, disponible, id_categoria, id_subcategoria, proveedor, fecha_ingreso, url_descarga) 
                VALUES('$foto','$nombre','$descripcion','$autor','$disponible','$categoria','$subcategoria','$proveedor','$fecha','$descarga')";
        mysqli_query($con, $sql);
    break;

    case 'Edicion': 
        $sql = "UPDATE libros SET 
                foto = '$foto', 
                nombre = '$nombre', 
                descripcion = '$descripcion', 
                autor = '$autor', 
                disponible = '$disponible', 
                id_categoria = '$categoria', 
                id_subcategoria = '$subcategoria', 
                proveedor = '$proveedor', 
                fecha_ingreso = '$fecha', 
                url_descarga = '$descarga' 
                WHERE id_libro = '$id'";
        mysqli_query($con, $sql);
    break;
}

$registro = mysqli_query($con, "SELECT * FROM libros ORDER BY id_libro desc");

echo '<table class="table table-striped table-condensed table-hover">
    <tr>
        <th width="200">Foto</th>
        <th width="300">Nombre</th>
        <th width="150">Autor</th>
        <th width="300">Descripcion</th>
        <th width="100">Disponible</th>
        <th width="100">Categoria</th>
        <th width="100">Subcategoria</th>
        <th width="150">Proveedor</th>
        <th width="100">Fecha Ingreso</th>
        <th width="300">URL Descarga</th>
        <th width="50">Opciones</th>
    </tr>';

while($registro2 = mysqli_fetch_array($registro)){
    $fotoPath = !empty($registro2['foto']) ? $registro2['foto'] : 'images/sin-imagen.jpg';
    $imagen = '<img src="'.$fotoPath.'" width="50" height="50" onerror="this.src=\'images/sin-imagen.jpg\'">';
    
    echo '<tr>
            <td>'.$imagen.'</td>
            <td>'.$registro2['nombre'].'</td>
            <td>'.$registro2['autor'].'</td>
            <td>'.$registro2['descripcion'].'</td>
            <td>'.$registro2['disponible'].'</td>
            <td>'.$registro2['id_categoria'].'</td>
            <td>'.$registro2['id_subcategoria'].'</td>
            <td>'.$registro2['proveedor'].'</td>
            <td>'.$registro2['fecha_ingreso'].'</td>
            <td>'.$registro2['url_descarga'].'</td>
            <td> 
                <a href="javascript:editarLibro('.$registro2['id_libro'].');" class="glyphicon glyphicon-edit eliminar" title="Editar"></a>
                <a href="javascript:eliminarLibro('.$registro2['id_libro'].');">
                <img src="../images/delete.png" width="15" height="15" alt="delete" title="Eliminar" /></a>
            </td>
        </tr>';
}
echo '</table>';
?>