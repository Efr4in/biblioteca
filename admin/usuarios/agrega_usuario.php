
<?php
include('../conexion.php');

$id = $_POST['id-prod'];
$proceso = $_POST['pro'];
$user = $_POST['user'];
$pass = $_POST['pass'];
$pass = sha1($pass);

switch($proceso){
	case 'Registro': mysqli_query($con, "INSERT INTO administrador_biblioteca (user, pass) VALUES('$user','$pass')");
	break;
	case 'Edicion':	mysqli_query($con, "UPDATE administrador_biblioteca SET user = '$user', pass = '$pass'  WHERE id_bibliotecario = '$id'");
	break;
}
$registro = mysqli_query($con, "SELECT * FROM administrador_biblioteca ORDER BY id_bibliotecario ASC");

echo '<table class="table table-striped table-condensed table-hover">
        	<tr>
            	<th width="200">Usuario</th>
            	<th width="200">Contraseña</th>
				<th width="50">Opciones</th>
            </tr>';
	while($registro2 = mysqli_fetch_array($registro)){
		echo '<tr>
				<td>'.$registro2['user'].'</td>
				<td>'.$registro2['pass'].'</td>
				<td> <a href="javascript:editarEmpleado('.$registro2['id_bibliotecario'].');" class="glyphicon glyphicon-edit eliminar"     title="Editar"></a>
				 <a href="javascript:eliminarEmpleado('.$registro2['id_bibliotecario'].');">
				 <img src="../images/delete.png" width="15" height="15" alt="delete" title="Eliminar" /></a>
				 </td>
				</tr>';
	}
echo '</table>';
?>