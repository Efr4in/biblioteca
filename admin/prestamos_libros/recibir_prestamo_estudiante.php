<?php
require_once '../conexion.php';

$id=$_POST["id"];
$fecha1=$_POST["fecha1"];
$fecha2=$_POST["fecha2"];
$estudiante=$_POST["estudiante"]; 
$estado="0";

$sql = "insert into prestamo_libro (fecha_prestamo, fecha_entrega, id_libro, id_usuario_estudiante, estado) values('$fecha1','$fecha2','$id','$estudiante', '1')";

    mysqli_query($con,$sql);
	$peticion2 = "UPDATE libros SET disponible = 'no' WHERE id_libro = '".$_POST['id']."'";
    $resultado2 = mysqli_query($con, $peticion2);

			if($resultado2){ 
			    echo '<script> alert("Prestamo Exitoso.");</script>';
			   echo '<script> window.location="../prestar_libro.php"; </script>';

				
				}else {
					echo '<script> alert("Error al procesar el prestamo.");</script>';
					echo '<script> window.location="../prestar_libro.php"; </script>';
					}
?>
