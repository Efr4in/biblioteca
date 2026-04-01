<?php 
include "../conexion.php";

$id_prestamo = intval($_GET['id']);

// Obtener el id_libro asociado a este préstamo
$query = mysqli_query($con, "SELECT id_libro FROM prestamo_libro WHERE id_prestamo = '$id_prestamo'");
$row = mysqli_fetch_assoc($query);
$id_libro = $row['id_libro'];

// Marcar préstamo como devuelto (estado=0)
mysqli_query($con, "UPDATE prestamo_libro SET estado = 0 WHERE id_prestamo = '$id_prestamo'");

// Marcar libro como disponible usando el id_libro correcto
mysqli_query($con, "UPDATE libros SET disponible = 'si' WHERE id_libro = '$id_libro'");

echo '<script>alert("Se ha devuelto el libro."); window.location="../Lista_prestamos_libros.php";</script>';
?>