<?php
session_start();
include("../admin/conexion.php");
if(isset($_SESSION['usuario'])) {
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asesor Inteligente</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="../images/iconolibreria.ico">
</head>
<body>
<?php include('../includes/header.php'); ?>

<div class="container" style="margin-top:30px; margin-bottom:30px;">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h3><i class="fa fa-lightbulb-o"></i> Asesor Inteligente de Biblioteca</h3>
            <p>Escribe tu consulta y el asesor te recomendará el libro más adecuado de nuestro catálogo.</p>

            <div class="form-group">
                <input type="text" id="consulta" class="form-control" 
                    placeholder="Ej: quiero aprender matemáticas..." 
                    style="border-radius:10px; padding:10px;">
            </div>
            <button onclick="consultarAsesor()" class="btn btn-primary">
                <i class="fa fa-search"></i> Consultar Asesor
            </button>

            <div id="cargando" style="display:none; margin-top:20px;">
                <i class="fa fa-spinner fa-spin"></i> Consultando asesor inteligente...
            </div>

            <div id="respuesta" style="display:none; margin-top:20px; 
                padding:20px; background:#f9f9f9; border-radius:10px; 
                border-left:4px solid #2E75B6;">
                <h4><i class="fa fa-comment"></i> Recomendación:</h4>
                <p id="textoRespuesta"></p>
            </div>
        </div>
    </div>
</div>

<?php include('../includes/footer.php'); ?>

<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
function consultarAsesor() {
    var consulta = document.getElementById('consulta').value;
    
    if(consulta.trim() === '') {
        alert('Por favor escribe una consulta.');
        return;
    }

    document.getElementById('cargando').style.display = 'block';
    document.getElementById('respuesta').style.display = 'none';

    fetch('procesar_consulta.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ consulta: consulta })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('cargando').style.display = 'none';
        document.getElementById('textoRespuesta').innerText = data.respuesta;
        document.getElementById('respuesta').style.display = 'block';
    })
    .catch(error => {
        document.getElementById('cargando').style.display = 'none';
        alert('Error al consultar el asesor. Intenta de nuevo.');
    });
}
</script>
</body>
</html>
<?php include "../log.php"; ?>
<?php
} else {
    echo '<script> window.location="index.php"; </script>';
}
?>