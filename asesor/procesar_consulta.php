<?php
session_start();

if(!isset($_SESSION['usuario'])) {
    echo json_encode(['respuesta' => 'No autorizado']);
    exit;
}

include("../admin/conexion.php");

$input = json_decode(file_get_contents('php://input'), true);
$consulta = isset($input['consulta']) ? $input['consulta'] : '';

if(empty($consulta)) {
    echo json_encode(['respuesta' => 'Consulta vacía']);
    exit;
}

// Obtener catálogo de libros desde la BD local (XAMPP)
$catalogo = [];
$query = mysqli_query($con, "SELECT id_libro, nombre, autor, descripcion, url_descarga FROM libros WHERE disponible = 'si'");
while($row = mysqli_fetch_assoc($query)) {
    $catalogo[] = $row;
}

// Llamada a n8n — enviamos consulta + catálogo
$webhook_url = 'https://glam.app.n8n.cloud/webhook/asesor-ia';
$data = json_encode([
    'consulta' => $consulta,
    'catalogo' => $catalogo
]);

$ch = curl_init($webhook_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);

$response = curl_exec($ch);
curl_close($ch);
file_put_contents('debug.txt', $response);

$resultado = json_decode($response, true);

// Extraer campos
$respuesta_texto = isset($resultado['respuesta']) ? $resultado['respuesta'] : 'No se pudo obtener una recomendación.';
$libro_nombre    = isset($resultado['libro_nombre']) ? $resultado['libro_nombre'] : '';
$es_compleja     = isset($resultado['es_compleja']) ? $resultado['es_compleja'] : false;
$paginas_raw     = isset($resultado['paginas']) ? $resultado['paginas'] : '';

// Parsear páginas
$paginas_texto = '';
if (!empty($paginas_raw)) {
    $paginas_raw = trim($paginas_raw);
    $paginas_raw = preg_replace('/```json|```/i', '', $paginas_raw);
    $paginas_decoded = json_decode($paginas_raw, true);
    if (isset($paginas_decoded['paginas'])) {
        $paginas_texto = $paginas_decoded['paginas'];
    } else {
        $paginas_texto = $paginas_raw;
    }
}

// Normalizar texto para comparación sin acentos
function normalizar($texto) {
    $texto = strtolower($texto);
    $from = ['á','é','í','ó','ú','ä','ë','ï','ö','ü','à','è','ì','ò','ù','Á','É','Í','Ó','Ú'];
    $to   = ['a','e','i','o','u','a','e','i','o','u','a','e','i','o','u','a','e','i','o','u'];
    return str_replace($from, $to, $texto);
}

// Buscar el libro en la BD por coincidencia flexible
$libro = null;
$todos = mysqli_query($con, "SELECT id_libro, nombre, foto, url_descarga FROM libros WHERE disponible = 'si'");
$nombre_ia_norm = normalizar($libro_nombre);
$palabras_clave = array_filter(explode(' ', $nombre_ia_norm), function($p) { return strlen($p) > 3; });

while($row = mysqli_fetch_assoc($todos)) {
    $nombre_bd_norm = normalizar($row['nombre']);
    $respuesta_norm = normalizar($respuesta_texto);

    if(strpos($nombre_bd_norm, $nombre_ia_norm) !== false ||
       strpos($nombre_ia_norm, $nombre_bd_norm) !== false) {
        $libro = $row; break;
    }
    foreach($palabras_clave as $palabra) {
        if(strpos($nombre_bd_norm, $palabra) !== false) {
            $libro = $row; break 2;
        }
    }
    if(strpos($respuesta_norm, normalizar($row['nombre'])) !== false) {
        $libro = $row; break;
    }
}

echo json_encode([
    'respuesta'   => $respuesta_texto,
    'libro'       => $libro,
    'es_compleja' => $es_compleja,
    'paginas'     => $paginas_texto
]);
?>