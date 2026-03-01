<?php
if(isset($_FILES['foto'])) {
    echo "<h2>ARCHIVO RECIBIDO:</h2>";
    echo "<pre>";
    print_r($_FILES['foto']);
    echo "</pre>";
    
    if($_FILES['foto']['error'] == 0) {
        $nuevoNombre = time() . '_' . $_FILES['foto']['name'];
        $destino = '../images/' . $nuevoNombre;
        
        if(move_uploaded_file($_FILES['foto']['tmp_name'], $destino)) {
            echo "<h2 style='color:green;'>✓ ÉXITO: Imagen guardada en: $destino</h2>";
            echo "<img src='../images/$nuevoNombre' width='200'>";
        } else {
            echo "<h2 style='color:red;'>✗ ERROR: No se pudo mover el archivo</h2>";
        }
    } else {
        echo "<h2 style='color:red;'>✗ ERROR en upload: " . $_FILES['foto']['error'] . "</h2>";
    }
} else {
    echo "<h2 style='color:red;'>✗ NO SE RECIBIÓ NINGÚN ARCHIVO</h2>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Test Subida</title>
</head>
<body>
    <h1>TEST DE SUBIDA DE IMAGEN</h1>
    <form method="POST" enctype="multipart/form-data">
        <input type="file" name="foto" required>
        <button type="submit">SUBIR</button>
    </form>
</body>
</html>