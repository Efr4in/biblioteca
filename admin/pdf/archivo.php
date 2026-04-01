<?php
include('../conexion.php');

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT url_descarga, nombre FROM libros WHERE id_libro = '$id'";
    $query = mysqli_query($con, $sql);

    if($datos = mysqli_fetch_array($query)) {
        if(!empty($datos['url_descarga'])) {
            $url = $datos['url_descarga'];
            $nombre = $datos['nombre'];

            if(strpos($url, 'drive.google.com') !== false) {
                preg_match('/\/d\/([a-zA-Z0-9_-]+)/', $url, $matches);
                if(isset($matches[1])) {
                    $drive_id = $matches[1];
                    $url_embed = 'https://drive.google.com/file/d/' . $drive_id . '/preview';
                } else {
                    $url_embed = $url;
                }
                ?>
                <!DOCTYPE html>
                <html lang="es">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title><?php echo htmlspecialchars($nombre); ?></title>
                    <style>
                        * { margin:0; padding:0; box-sizing:border-box; }
                        body { background:#1a1a1a; font-family:Arial, sans-serif; }
                        .topbar {
                            background:#2E75B6;
                            color:white;
                            padding:10px 20px;
                            display:flex;
                            align-items:center;
                            gap:15px;
                        }
                        .topbar a {
                            color:white;
                            text-decoration:none;
                            font-size:13px;
                            background:rgba(255,255,255,0.2);
                            padding:5px 12px;
                            border-radius:5px;
                        }
                        .topbar a:hover { background:rgba(255,255,255,0.35); }
                        .topbar span { font-size:15px; font-weight:bold; }
                        iframe {
                            width:100%;
                            height:calc(100vh - 45px);
                            border:none;
                            display:block;
                        }
                    </style>
                </head>
                <body>
                    <div class="topbar">
                        <a href="javascript:history.back()">&#8592; Volver</a>
                        <span><?php echo htmlspecialchars($nombre); ?></span>
                    </div>
                    <iframe src="<?php echo $url_embed; ?>" allowfullscreen allow="autoplay"></iframe>
                </body>
                </html>
                <?php
            } else {
                ?>
                <!DOCTYPE html>
                <html lang="es">
                <head>
                    <meta charset="UTF-8">
                    <title><?php echo htmlspecialchars($nombre); ?></title>
                    <style>
                        * { margin:0; padding:0; }
                        body { background:#1a1a1a; }
                        .topbar {
                            background:#2E75B6;
                            color:white;
                            padding:10px 20px;
                            display:flex;
                            align-items:center;
                            gap:15px;
                        }
                        .topbar a {
                            color:white;
                            text-decoration:none;
                            font-size:13px;
                            background:rgba(255,255,255,0.2);
                            padding:5px 12px;
                            border-radius:5px;
                        }
                        iframe {
                            width:100%;
                            height:calc(100vh - 45px);
                            border:none;
                            display:block;
                        }
                    </style>
                </head>
                <body>
                    <div class="topbar">
                        <a href="javascript:history.back()">&#8592; Volver</a>
                        <span><?php echo htmlspecialchars($nombre); ?></span>
                    </div>
                    <iframe src="<?php echo $datos['url_descarga']; ?>"></iframe>
                </body>
                </html>
                <?php
            }
        } else {
            echo "<h2 style='font-family:Arial; padding:20px;'>Este libro no tiene archivo disponible</h2>";
        }
    } else {
        echo "<h2 style='font-family:Arial; padding:20px;'>Libro no encontrado</h2>";
    }
} else {
    echo "<h2 style='font-family:Arial; padding:20px;'>ID de libro no especificado</h2>";
}
?>