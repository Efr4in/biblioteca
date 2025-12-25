<?php include "../conexion.php" ?>
<?php

$peticion = ("UPDATE libros SET disponible = 'no' WHERE id_libro = '".$_GET['id']."'");
$resultado = mysqli_query($con, $peticion);
if ($resultado ==true) {
	    echo '<script> alert("Se ha prestado el libro.");</script>';
    echo '<script> window.location="../prestar_libro.php"; </script>';
}
  else {
  	 echo '<script> alert("Error al prestar el libro.");</script>';
  }
?>

