<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Acceso Administrador | Biblioteca UNI</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <link rel="shortcut icon" href="../images/favicon-escudo.ico">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Roboto', sans-serif;
            }
            body {
                background: linear-gradient(135deg, #C81C28 0%, #7A2D55 50%, #064589 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
                box-sizing: border-box;
            }
            .login-card {
                background: #fff;
                width: 100%;
                max-width: 400px;
                border-radius: 10px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.35);
                overflow: hidden;
                animation: fadeUp 500ms ease;
            }
            @keyframes fadeUp {
                from { opacity: 0; transform: translateY(15px); }
                to { opacity: 1; transform: translateY(0); }
            }
            .login-card-header {
                background: #C81C28;
                text-align: center;
                padding: 30px 25px 22px 25px;
            }
            .login-card-header img {
                height: 70px;
                width: auto;
                filter: drop-shadow(0 3px 6px rgba(0,0,0,0.35));
            }
            .login-card-header h1 {
                color: #fff;
                font-size: 19px;
                font-weight: 700;
                margin: 12px 0 2px 0;
            }
            .login-card-header p {
                color: rgba(255,255,255,0.8);
                font-size: 12px;
                margin: 0;
                letter-spacing: 0.5px;
                text-transform: uppercase;
            }
            .login-card-body {
                padding: 28px 30px 24px 30px;
            }
            .login-card-body .form-control {
                height: 44px;
                border-radius: 6px;
                border: 1px solid #ddd;
                margin-bottom: 14px;
                box-shadow: none;
            }
            .login-card-body .form-control:focus {
                border-color: #C81C28;
                box-shadow: 0 0 0 2px rgba(200,28,40,0.15);
            }
            .login-card-body .form-control.input-error {
                border-color: #C81C28;
                background: #FBEAEA;
            }
            .btn-login {
                width: 100%;
                height: 46px;
                background: #064589;
                color: #fff;
                border: none;
                border-radius: 6px;
                font-size: 15px;
                font-weight: 500;
                letter-spacing: 0.5px;
                transition: background 200ms ease;
            }
            .btn-login:hover {
                background: #05356b;
                color: #fff;
            }
            .login-card-footer {
                text-align: center;
                padding: 0 30px 24px 30px;
            }
            .login-card-footer a {
                display: inline-block;
                font-size: 13px;
                color: #999;
                text-decoration: none;
            }
            .login-card-footer a:hover {
                color: #C81C28;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div class="login-card">
            <div class="login-card-header">
                <img src="../images/home/escudo-boliviano-holandes.png" alt="U.E.P. Boliviano Holandés">
                <h1>Panel de Administración</h1>
                <p>Biblioteca Virtual &mdash; Solo Administrador</p>
            </div>
            <div class="login-card-body">
                <form role="form" action="validar.php" method="post" class="login-form">
                    <div class="form-group">
                        <label class="sr-only" for="form-username">Usuario</label>
                        <input type="text" name="username" placeholder="Usuario..." class="form-username form-control" id="form-username" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="form-password">Contraseña</label>
                        <input type="password" name="password" placeholder="Contraseña..." class="form-password form-control" id="form-password" required>
                    </div>
                    <button type="submit" class="btn-login" name="login">Entrar</button>
                </form>
            </div>
            <div class="login-card-footer">
                <a href="../index.php"><i class="fa fa-arrow-left"></i> Volver a la Biblioteca</a>
            </div>
        </div>

        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/scripts.js"></script>
    </body>
</html>
