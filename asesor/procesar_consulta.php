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

// Llamada a n8n
$webhook_url = 'https://glam.app.n8n.cloud/webhook/asesor-ia';
$data = json_encode(['consulta' => $consulta]);

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

// Extraer campos de la respuesta nueva
$respuesta_texto = isset($resultado['respuesta']) ? $resultado['respuesta'] : 'No se pudo obtener una recomendación.';
$libro_nombre    = isset($resultado['libro_nombre']) ? $resultado['libro_nombre'] : '';
$es_compleja     = isset($resultado['es_compleja']) ? $resultado['es_compleja'] : false;
$paginas_raw     = isset($resultado['paginas']) ? $resultado['paginas'] : '';

// Parsear el JSON de páginas que devuelve Gemini2
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

// Buscar el libro en la BD por nombre
$libro = null;
$todos = mysqli_query($con, "SELECT id_libro, nombre, foto, url_descarga FROM libros WHERE disponible = 'si'");
while($row = mysqli_fetch_assoc($todos)) {
    if(stripos($respuesta_texto, $row['nombre']) !== false || 
       stripos($libro_nombre, $row['nombre']) !== false ||
       stripos($row['nombre'], $libro_nombre) !== false) {
        $libro = $row;
        break;
    }
}

echo json_encode([
    'respuesta'   => $respuesta_texto,
    'libro'       => $libro,
    'es_compleja' => $es_compleja,
    'paginas'     => $paginas_texto
]);
?>