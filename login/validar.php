<?php
ob_start();
session_start();
include '../admin/conexion.php';

if (isset($_POST['login'])) {
    $usuario = mysqli_real_escape_string($con, $_POST['username']);
    $pw = $_POST['password'];

    // buscamos al administrador solo por su nombre
    $log = mysqli_query($con, "SELECT * FROM administrador_biblioteca WHERE user='$usuario'");

    if ($log && mysqli_num_rows($log) > 0) {
        $row = mysqli_fetch_array($log);

        // verificamos la contraseña con password_verify()
        if (password_verify($pw, $row['pass'])) {
            $_SESSION["user"] = $row['user'];
            header("Location: ../admin/inicio.php");
            exit;
        }
    }

    // usuario o contraseña incorrectos: volvemos al login (modo administrador) mostrando el aviso
    header("Location: ../index.php?modo=admin&error=1");
    exit;
}

header("Location: ../index.php?modo=admin");
exit;
?>