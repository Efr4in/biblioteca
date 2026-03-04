<body style="background:#000;">
<?php
// Configura los datos de tu cuenta
include('config.php');
if ($_POST['username']) {
//Comprobacion del envio del nombre de usuario y password
$username=htmlentities($_POST['username']);
$password=$_POST['password'];
if ($password==NULL) {
	header ("Location: index.php?nopass");
	exit(); 
}else{	
$query = mysqli_query($connection, "SELECT username,password, imagen FROM usuarios WHERE username = '".mysqli_real_escape_string($connection, $username)."'") or die(mysqli_error($connection));
$data = mysqli_fetch_array($query);
if($data['password'] != $password) {
	//echo "No a introducido una contrasenia correcta";
	header ("Location: index.php?errorpass");
	exit();
}else{
$query = mysqli_query($connection, "SELECT username,password,imagen FROM usuarios WHERE username = '".mysqli_real_escape_string($connection, $username)."'") or die(mysqli_error($connection));
$row = mysqli_fetch_array($query);
$username2 = $row['username'];
$_SESSION["s_username"] = $row['username'];
$_SESSION["logeado"] = "SI";
$_SESSION["s_id"] = $row['ID'];
$_SESSION["img"] = $row['imagen'];



/* Si aceptamos recordar los datos */
if($_POST['recordar']){

						if ($HTTP_X_FORWARDED_FOR == "")
					{
						$ip = getenv('REMOTE_ADDR');
					}
					else
					{
						$ip = getenv('HTTP_X_FORWARDED_FOR');
					}
	$id_extreme = sha1(uniqid(rand(), true));
	$id_extreme2 = $username2."%".$id_extreme."%".$ip;
	setcookie('id_extreme', $id_extreme2, time()+7776000,'/');
	$query = mysqli_query($connection, "UPDATE usuarios SET id_extreme='".mysqli_real_escape_string($connection, $id_extreme)."' WHERE username='".mysqli_real_escape_string($connection, $username2)."'") or die(mysqli_error($connection));
}

header ("Location: ../index.php");
 echo '<script> alert("Bienvenido al Sistema.");</script>';
}
}
}
?> 
</body>