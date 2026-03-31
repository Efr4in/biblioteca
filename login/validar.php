<?php
    session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Validando...</title>
    <meta charset="utf-8">
</head>
<body>
    <?php
        include '../admin/conexion.php';
        if(isset($_POST['login'])){
            $usuario = $_POST['username'];
            $pw = $_POST['password'];

            // buscamos al administrador solo por su nombre
            $log = mysqli_query($con, "SELECT * FROM administrador_biblioteca WHERE user='$usuario'");

            if (mysqli_num_rows($log) > 0) {
                $row = mysqli_fetch_array($log);

                // verificamos la contraseña con password_verify()
                if (password_verify($pw, $row['pass'])) {
                    $_SESSION["user"] = $row['user'];
                    echo '<script> window.location="../admin/inicio.php"; </script>';
                } else {
                    echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
                    echo '<script> window.location="login.php"; </script>';
                }
            } else {
                echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
                echo '<script> window.location="login.php"; </script>';
            }
        }
    ?>
</body>
</html>