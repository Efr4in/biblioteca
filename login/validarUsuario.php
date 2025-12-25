<?php
	session_start();
?>
<!DOCTYPE html>
<html>
<head>
<head>
	<title>Validando...</title>
	<meta charset="utf-8">
</head>
</head>
<body>
		<?php
			include '../admin/conexion.php';
			if(isset($_POST['login'])){
				$usuario = $_POST['username'];
				$pw =$_POST['password'];
				//$log = mysql_query("SELECT * FROM usuario WHERE usuario='$usuario' AND clave='".sha1($_POST['pw'])."'");
//$log = mysqli_query($con, "SELECT * FROM visitantes WHERE ususario='$usuario' AND pass='".sha1($pw)."'");
      $log = mysqli_query($con, "SELECT * FROM visitantes WHERE usuario='$usuario' AND pass='$pw' and estado= '1'");

				if (mysqli_num_rows($log)>0) {
					$row = mysqli_fetch_array($log);
					$_SESSION["usuario"] = $row['usuario'];
				  //	echo 'Iniciando sesión para '.$_SESSION['usuario'].' <p>';
				//  	header ("Location: ../admin/index.php");
				echo '<script> window.location="../inicio.php"; </script>';
				}
				else{
					echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
					echo '<script> window.location="../index.php"; </script>';
				}
			}
		?>
</body>
</html>
