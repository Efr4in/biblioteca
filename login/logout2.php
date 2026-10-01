<?php
session_start();
session_destroy();
$destino = "../index.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sesión cerrada | Biblioteca Virtual</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="shortcut icon" href="../images/favicon-escudo.ico">
    <noscript><meta http-equiv="refresh" content="3;url=<?php echo $destino; ?>"></noscript>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', Arial, sans-serif;
        }
        body {
            background: linear-gradient(135deg, #064589 0%, #7A2D55 50%, #C81C28 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            box-sizing: border-box;
        }
        .bye-card {
            background: #fff;
            width: 100%;
            max-width: 400px;
            border-radius: 10px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.35);
            overflow: hidden;
            text-align: center;
            animation: fadeUp 500ms ease;
        }
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(15px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        @keyframes pop {
            0%   { transform: scale(0); opacity: 0; }
            70%  { transform: scale(1.15); opacity: 1; }
            100% { transform: scale(1); }
        }
        @keyframes fillBar {
            from { width: 0%; }
            to   { width: 100%; }
        }
        .bye-header {
            background: #064589;
            padding: 26px 25px 22px 25px;
        }
        .bye-header img {
            height: 70px;
            width: auto;
            filter: drop-shadow(0 3px 6px rgba(0,0,0,0.35));
        }
        .bye-header h1 {
            color: #fff;
            font-size: 19px;
            font-weight: 700;
            margin: 10px 0 2px 0;
        }
        .bye-header p {
            color: rgba(255,255,255,0.75);
            font-size: 12px;
            margin: 0;
            letter-spacing: 0.5px;
        }
        .bye-body {
            padding: 30px 30px 26px 30px;
        }
        .bye-icon {
            width: 64px;
            height: 64px;
            line-height: 64px;
            margin: 0 auto 16px auto;
            border-radius: 50%;
            background: #e8f5e9;
            color: #2e9e4f;
            font-size: 30px;
            animation: pop 500ms ease 200ms both;
        }
        .bye-body h2 {
            font-size: 20px;
            font-weight: 500;
            color: #222;
            margin: 0 0 8px 0;
        }
        .bye-body p {
            font-size: 14px;
            color: #777;
            margin: 0 0 22px 0;
            line-height: 1.5;
        }
        .bye-btn {
            display: block;
            background: #064589;
            color: #fff;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            padding: 12px;
            border-radius: 6px;
            transition: opacity 150ms ease;
        }
        .bye-btn:hover {
            opacity: 0.88;
            color: #fff;
            text-decoration: none;
        }
        .bye-footnote {
            font-size: 12px;
            color: #999;
            margin-top: 14px;
        }
        .bye-progress {
            height: 4px;
            background: #eee;
        }
        .bye-progress span {
            display: block;
            height: 100%;
            background: #064589;
            width: 0%;
            animation: fillBar 3s linear forwards;
        }
    </style>
</head>
<body>
    <div class="bye-card">
        <div class="bye-header">
            <img src="../images/home/escudo-boliviano-holandes.png" alt="U.E.P. Boliviano Holandés">
            <h1>Biblioteca Virtual</h1>
            <p>U.E.P. BOLIVIANO HOLANDÉS</p>
        </div>
        <div class="bye-body">
            <div class="bye-icon"><i class="fa fa-check"></i></div>
            <h2>Has cerrado tu sesión</h2>
            <p>Gracias por visitarnos. ¡Te esperamos pronto!</p>
            <a href="<?php echo $destino; ?>" class="bye-btn">Volver al inicio</a>
            <div class="bye-footnote">Te redirigiremos automáticamente...</div>
        </div>
        <div class="bye-progress"><span></span></div>
    </div>

    <script>
        setTimeout(function () {
            window.location = "<?php echo $destino; ?>";
        }, 3000);
    </script>
</body>
</html>