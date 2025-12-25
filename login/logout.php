<?php
session_start();
session_destroy();
echo '<script> alert("Has cerrado tu sesion.");</script>';
echo '<script> window.location="../inicio.php"; </script>';
?>
