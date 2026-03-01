<?php
include('../conexion.php');

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT url_descarga FROM libros WHERE id_libro = '$id'";
    $query = mysqli_query($con, $sql);
    
    if($datos = mysqli_fetch_array($query)) {
        if(!empty($datos['url_descarga'])) {
            // Si es una URL externa (Drive, Mediafire, etc)
            if(strpos($datos['url_descarga'], 'http') === 0) {
                header("Location: " . $datos['url_descarga']);
                exit;
            }
            // Si es un archivo local
            else {
                $archivo = $datos['url_descarga'];
                ?>
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <title>Visualizar Libro</title>
                </head>
                <body style="margin:0; padding:0;">
                    <iframe src="<?php echo $archivo; ?>" width="100%" height="100%" style="border:none; position:absolute; top:0; left:0; right:0; bottom:0;"></iframe>
                </body>
                </html>
                <?php
            }
        } else {
            echo "<h2>Este libro no tiene archivo disponible</h2>";
        }
    } else {
        echo "<h2>Libro no encontrado</h2>";
    }
} else {
    echo "<h2>ID de libro no especificado</h2>";
}
?>