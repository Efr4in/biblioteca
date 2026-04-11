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
    <style>
        .card-libro {
            display: flex;
            align-items: center;
            gap: 15px;
            background: #fff;
            border-radius: 10px;
            padding: 15px;
            margin-top: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .card-libro img {
            width: 70px;
            height: 95px;
            object-fit: cover;
            border-radius: 5px;
        }
        .card-libro .info h5 { margin: 0 0 5px 0; }
        .bloque-paginas {
            margin-top: 15px;
            padding: 15px;
            background: #eaf4ff;
            border-left: 4px solid #1a6fbf;
            border-radius: 8px;
        }
        .bloque-paginas h5 {
            margin: 0 0 8px 0;
            color: #1a6fbf;
        }
    </style>
</head>
<body>
<?php include('../includes/header.php'); ?>

<div class="container" style="margin-top:30px; margin-bottom:30px;">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h3><i class="fa fa-lightbulb-o"></i> Asesor Inteligente de Biblioteca</h3>
            <p>Escribe tu consulta y el asesor te recomendará el libro más adecuado. Para consultas específicas, también te indicará en qué páginas encontrar la información.</p>

            <div class="form-group">
                <input type="text" id="consulta" class="form-control"
                    placeholder="Ej: ¿En qué página habla sobre la guerra del petróleo?"
                    style="border-radius:10px; padding:10px;">
            </div>
            <button onclick="consultarAsesor()" class="btn btn-primary">
                <i class="fa fa-search"></i> Consultar Asesor
            </button>

            <div id="cargando" style="display:none; margin-top:20px;">
                <i class="fa fa-spinner fa-spin"></i> Consultando asesor inteligente...
            </div>

            <!-- Bloque respuesta principal -->
            <div id="respuesta" style="display:none; margin-top:20px;
                padding:20px; background:#f9f9f9; border-radius:10px;
                border-left:4px solid #2E75B6;">
                <h4><i class="fa fa-comment"></i> Recomendación:</h4>
                <p id="textoRespuesta"></p>

                <!-- Card del libro -->
                <div id="cardLibro" class="card-libro" style="display:none;">
                    <img id="libroFoto" src="" alt="Portada">
                    <div class="info">
                        <h5 id="libroNombre"></h5>
                        <a id="libroLink" href="#" target="_blank" class="btn btn-xs btn-default">
                            <i class="fa fa-eye"></i> Ver PDF
                        </a>
                    </div>
                </div>

                <!-- Bloque de páginas (solo consultas complejas) -->
                <div id="bloquePaginas" class="bloque-paginas" style="display:none;">
                    <h5><i class="fa fa-file-text-o"></i> Páginas relevantes en el libro:</h5>
                    <p id="textoPaginas"></p>
                </div>
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
    document.getElementById('cardLibro').style.display = 'none';
    document.getElementById('bloquePaginas').style.display = 'none';

    fetch('procesar_consulta.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ consulta: consulta })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('cargando').style.display = 'none';

        // Mostrar respuesta principal
        document.getElementById('textoRespuesta').innerText = data.respuesta;
        document.getElementById('respuesta').style.display = 'block';

        // Mostrar card del libro si existe
        if(data.libro) {
            document.getElementById('libroFoto').src = '../' + data.libro.foto;
            document.getElementById('libroNombre').innerText = data.libro.nombre;
            if(data.libro.url_descarga) {
                document.getElementById('libroLink').href = data.libro.url_descarga;
            }
            document.getElementById('cardLibro').style.display = 'flex';
        }

        // Mostrar páginas solo si es consulta compleja y hay datos
        if(data.es_compleja && data.paginas && data.paginas.trim() !== '') {
            document.getElementById('textoPaginas').innerText = data.paginas;
            document.getElementById('bloquePaginas').style.display = 'block';
        }
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