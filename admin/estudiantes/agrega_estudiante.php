<?php
include('../conexion.php');

$id        = $_POST['id-prod'];
$proceso   = $_POST['pro'];
$nombre    = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$carnet    = $_POST['carnet'];
$email     = $_POST['email'];

switch($proceso) {
    case 'Registro':
        mysqli_query($con, "INSERT INTO usuario_estudiante (carnet, nombre, apellidos, email) 
                            VALUES('$carnet','$nombre','$apellidos','$email')");
        break;

    case 'Edicion':
        mysqli_query($con, "UPDATE usuario_estudiante 
                            SET carnet = '$carnet', nombre = '$nombre', 
                                apellidos = '$apellidos', email = '$email'
                            WHERE id_usuario_estudiante = '$id'");
        break;
}

$registro = mysqli_query($con, "SELECT * FROM usuario_estudiante ORDER BY id_usuario_estudiante ASC");

echo '<table class="table table-striped table-condensed table-hover">
        <tr>
            <th width="80">Carnet</th>
            <th width="120">Nombre</th>
            <th width="120">Apellidos</th>
            <th width="150">Email</th>
            <th width="100">Opciones</th>
        </tr>';

while($registro2 = mysqli_fetch_array($registro)) {
    echo '<tr>
            <td>' . $registro2['carnet']    . '</td>
            <td>' . $registro2['nombre']    . '</td>
            <td>' . $registro2['apellidos'] . '</td>
            <td>' . $registro2['email']     . '</td>
            <td>
                <a href="javascript:editarEmpleado(' . $registro2['id_usuario_estudiante'] . ');"
                   class="glyphicon glyphicon-edit eliminar" title="Editar"></a>
                <a href="javascript:eliminarEmpleado(' . $registro2['id_usuario_estudiante'] . ');">
                    <img src="../images/delete.png" width="15" height="15" alt="delete" title="Eliminar"/>
                </a>
            </td>
          </tr>';
}
echo '</table>';
?>