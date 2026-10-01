<?php
session_start();

if(!isset($_SESSION['usuario'])) {
    echo json_encode(['respuesta' => 'No autorizado']);
    exit;
}

include("../admin/conexion.php");

global $con;

$input = json_decode(file_get_contents('php://input'), true);
$consulta = isset($input['consulta']) ? $input['consulta'] : '';

if(empty($consulta)) {
    echo json_encode(['respuesta' => 'Consulta vacía']);
    exit;
}

$consulta = trim($consulta);

// Rechazar si quedó vacía después de quitar espacios (ej. el usuario solo puso espacios)
if ($consulta === '') {
    echo json_encode(['respuesta' => 'Por favor escribe algo antes de consultar.']);
    exit;
}

// Rechazar si es muy corta para tener sentido, o absurdamente larga
if (mb_strlen($consulta) < 3) {
    echo json_encode(['respuesta' => 'Por favor escribe un poco más sobre lo que buscas.']);
    exit;
}
if (mb_strlen($consulta) > 300) {
    echo json_encode(['respuesta' => 'Tu consulta es demasiado larga, intenta resumirla.']);
    exit;
}

// Permitir letras (con tildes y ñ), números, espacios y puntuación básica de una pregunta normal
if (!preg_match('/^[\p{L}\p{N}\s¿?¡!.,:;\-\'"()]+$/u', $consulta)) {
    echo json_encode(['respuesta' => 'Tu consulta tiene caracteres que no puedo procesar. Intenta escribirla solo con letras y signos de puntuación normales.']);
    exit;
}

// Rechazar si es solo símbolos de puntuación repetidos, sin ninguna letra o número real
if (!preg_match('/[\p{L}\p{N}]/u', $consulta)) {
    echo json_encode(['respuesta' => 'No entendí tu consulta, intenta escribirla de nuevo.']);
    exit;
}

// Detectar posible "manoteo" de teclado: muy pocas vocales, o rachas largas de consonantes
$solo_letras = preg_replace('/[^\p{L}]/u', '', $consulta);
if (mb_strlen($solo_letras) >= 5) {
    $vocales = preg_match_all('/[aeiouáéíóúAEIOUÁÉÍÓÚ]/u', $solo_letras);
    $ratio_vocales = $vocales / mb_strlen($solo_letras);
    if ($ratio_vocales < 0.25 || preg_match('/[bcdfghjklmnñpqrstvwxyzBCDFGHJKLMNÑPQRSTVWXYZ]{5,}/u', $consulta)) {
        echo json_encode(['respuesta' => 'No logré entender tu consulta, intenta escribirla de nuevo con palabras completas.']);
        exit;
    }
}

// Límite de consultas por sesión, para no agotar la cuota diaria de Gemini
if (!isset($_SESSION['consultas_asesor'])) {
    $_SESSION['consultas_asesor'] = 0;
}
if ($_SESSION['consultas_asesor'] >= 15) {
    echo json_encode(['respuesta' => 'Alcanzaste el límite de consultas por ahora, intenta más tarde.']);
    exit;
}
$_SESSION['consultas_asesor']++;

// Obtener catálogo de libros desde la BD local (XAMPP)
$catalogo = [];
$query = mysqli_query($con, "SELECT id_libro, nombre, autor, descripcion, url_descarga FROM libros WHERE disponible = 'si'");
while($row = mysqli_fetch_assoc($query)) {
    $catalogo[] = $row;
}

// Puede tardar si hay que reintentar, así que damos más margen de tiempo al script
set_time_limit(120);

// Llamada a n8n — enviamos consulta + catálogo
$webhook_url = 'https://biblio.app.n8n.cloud/webhook/asesor-ia';
$data = json_encode([
    'consulta' => $consulta,
    'catalogo' => $catalogo
]);

// Hace una llamada a n8n y dice si la respuesta es válida (trae el campo "respuesta")
function llamar_asesor($url, $data) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
    curl_setopt($ch, CURLOPT_TIMEOUT, 45);
    $response = curl_exec($ch);
    $http  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    curl_close($ch);

    $decoded = is_string($response) ? json_decode($response, true) : null;
    $ok = is_array($decoded) && !empty($decoded['respuesta']);

    return [$ok, $decoded, $response, $http, $error];
}

// Hasta 2 intentos: a veces el primero falla (n8n frío o Gemini ocupado) y el segundo responde bien
$resultado = null;
$ok = false;
$registro = '';
for ($intento = 1; $intento <= 2; $intento++) {
    list($ok, $resultado, $response, $http, $error) = llamar_asesor($webhook_url, $data);

    $registro .= date('Y-m-d H:i:s') . " | intento $intento | HTTP $http | curl: " . ($error !== '' ? $error : 'sin error')
               . " | " . ($ok ? 'OK' : 'FALLO') . " | " . (is_string($response) ? $response : '(sin respuesta)') . "\n";

    if ($ok) break;
    if ($intento < 2) sleep(2);
}
file_put_contents(__DIR__ . '/debug.txt', $registro);

// Si tras los reintentos no hubo respuesta válida: avisamos, SIN sugerir ningún libro
if (!$ok) {
    $_SESSION['consultas_asesor']--; // un fallo no debe gastar una consulta del límite
    echo json_encode([
        'respuesta'   => 'El asesor no pudo responder en este momento. Por favor intenta de nuevo en unos segundos.',
        'libro'       => null,
        'es_compleja' => false,
        'paginas'     => ''
    ]);
    exit;
}

// Extraer campos
$respuesta_texto = $resultado['respuesta'];
$libro_nombre    = isset($resultado['libro_nombre']) ? trim($resultado['libro_nombre']) : '';
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

// Buscar el libro en la BD por coincidencia flexible.
// Solo se busca si la IA realmente nombró un libro; si no, NO se muestra ninguno.
$libro = null;
$nombre_ia_norm = normalizar($libro_nombre);

if ($nombre_ia_norm !== '') {
    $libros_bd = [];
    $todos = mysqli_query($con, "SELECT id_libro, nombre, foto, url_descarga FROM libros WHERE disponible = 'si'");
    while($row = mysqli_fetch_assoc($todos)) {
        $libros_bd[] = $row;
    }
    $respuesta_norm = normalizar($respuesta_texto);

    // 1) El nombre coincide (o está contenido) con el de un libro del catálogo
    foreach ($libros_bd as $row) {
        $nombre_bd_norm = normalizar($row['nombre']);
        if ($nombre_bd_norm === '') continue;
        if (strpos($nombre_bd_norm, $nombre_ia_norm) !== false ||
            strpos($nombre_ia_norm, $nombre_bd_norm) !== false) {
            $libro = $row; break;
        }
    }

    // 2) El texto de la recomendación menciona el nombre de un libro del catálogo
    if ($libro === null) {
        foreach ($libros_bd as $row) {
            $nombre_bd_norm = normalizar($row['nombre']);
            if ($nombre_bd_norm !== '' && strpos($respuesta_norm, $nombre_bd_norm) !== false) {
                $libro = $row; break;
            }
        }
    }

    // 3) Último recurso: alguna palabra clave del nombre que dio la IA
    if ($libro === null) {
        $palabras_clave = array_filter(explode(' ', $nombre_ia_norm), function($p) { return strlen($p) > 3; });
        foreach ($libros_bd as $row) {
            $nombre_bd_norm = normalizar($row['nombre']);
            foreach ($palabras_clave as $palabra) {
                if (strpos($nombre_bd_norm, $palabra) !== false) {
                    $libro = $row; break 2;
                }
            }
        }
    }
}

echo json_encode([
    'respuesta'   => $respuesta_texto,
    'libro'       => $libro,
    'es_compleja' => $es_compleja,
    'paginas'     => $paginas_texto
]);
?>