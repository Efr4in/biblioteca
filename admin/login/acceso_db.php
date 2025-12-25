 <?php
    $dbhost = "localhost"; // Host de la BD
    $dbusername = "root"; // Usuario de la BD
    $dbuserpass = ""; // Contraseña de la BD
    $dbname = "bibliotecauni"; // Nombre de la BD
    
    //conectamos y seleccionamos db
    $conn = mysqli_connect($dbhost, $dbusername, $dbuserpass, $dbname);
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?> 