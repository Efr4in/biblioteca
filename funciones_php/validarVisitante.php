<?php include ('../admin/conexion.php');?>
<?php 
$nombre=$_POST['nombre'];
$email=$_POST['email'];
$telefono=$_POST['telefono'];
$direccion=$_POST['direccion'];
$provincia=$_POST['provincia'];
$estado=$_POST['estado'];
$alias=$_POST['alias'];
$pass=$_POST['pass'];
$edad=$_POST['edad'];
$sexo=$_POST['sexo'];
$pais=$_POST['pais'];

// encriptamos la contraseña con bcrypt
$pass = password_hash($pass, PASSWORD_BCRYPT);

$sql="Insert into visitantes(nombreCompleto,usuario,pass,email,telefono,direccion,provincia,estadoPais,alias,edad,sexo,pais,estado)
values('".$nombre."','".$alias."','".$pass."','".$email."','".$telefono."','".$direccion."','".$provincia."','".$estado."','".$alias."','".$edad."','".$sexo."','".$pais."','1')";

$res=mysqli_query($con,$sql);
if($res){ 
    echo '<script> alert("Estudiante registrado correctamente. Ya puede ingresar con sus datos de acceso."); </script>';
    echo '<script> window.location="../admin/registro_estudiantil.php"; </script>';
}else {
    echo '<script> alert("No se pudo registrar al estudiante. Verifica los datos e intenta de nuevo."); </script>';
    echo '<script> window.location="../admin/registro_estudiantil.php"; </script>';
}
?>