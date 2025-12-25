<?php
include('../conexion.php');
$id = $_POST['id'];
$valores = mysqli_query($con, "SELECT * FROM visitantes WHERE idvisitante = '$id'");
$valores2 = mysqli_fetch_array($valores);
$datos = array(
				0 => $valores2['usuario'], 
				1 => $valores2['pass'], 
			    2 => $valores2['estado'], 
				); 
echo json_encode($datos);
?>