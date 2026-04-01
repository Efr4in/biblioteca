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
$webhook_url = 'https://crashefra.app.n8n.cloud/webhook/asesor-ia';
$data = json_encode(['consulta' => $consulta]);

$ch = curl_init($webhook_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);

$response = curl_exec($ch);
curl_close($ch);
file_put_contents('debug.txt', $response);

$resultado = json_decode($response, true);

$respuesta_texto = '';
if(isset($resultado['respuesta'])) {
    $respuesta_texto = $resultado['respuesta'];
} else {
    $respuesta_texto = 'No se pudo obtener una recomendación en este momento.';
}

// Buscar el libro en la BD cuyo nombre aparece en la respuesta de la IA
$libro = null;
$todos = mysqli_query($con, "SELECT id_libro, nombre, foto FROM libros WHERE disponible = 'si'");
while($row = mysqli_fetch_assoc($todos)) {
    if(stripos($respuesta_texto, $row['nombre']) !== false) {
        $libro = $row;
        break;
    }
}

echo json_encode([
    'respuesta' => $respuesta_texto,
    'libro'     => $libro
]);
?>