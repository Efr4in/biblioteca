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


$sql="Insert into visitantes(nombreCompleto,usuario,pass,email,telefono,direccion,provincia,estadoPais,alias,edad,sexo,pais,estado)
values('".$nombre."','".$alias."','".$pass."','".$email."','".$telefono."','".$direccion."','".$provincia."','".$estado."','".$alias."','".$edad."','".$sexo."','".$pais."','1')";

$res=mysqli_query($con,$sql);
if($res){ 
	echo '<script> alert("Gracias por inscribirte a nuestra pagina. \n Ya puedes ingresar con tus datos de acceso.");</script>';
    echo '<script> window.location="../index.php"; </script>';
	}else {
		echo '<script> alert("Lo sentimos no pudimos agregarte. Intentalo mas Tarde");</script>';
		echo '<script> window.location="../index.php"; </script>';

		}
?>