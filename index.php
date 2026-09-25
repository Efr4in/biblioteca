<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Acceso Restringido | Biblioteca Virtual</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700">
        <link rel="stylesheet" href="login/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="login/assets/font-awesome/css/font-awesome.min.css">
        <link rel="shortcut icon" href="images/favicon-escudo.ico">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Roboto', sans-serif;
            }
            body {
                background: linear-gradient(135deg, #064589 0%, #7A2D55 50%, #C81C28 100%);
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
                perspective: 800px;
            }
            @keyframes fadeUp {
                from { opacity: 0; transform: translateY(15px); }
                to { opacity: 1; transform: translateY(0); }
            }
            @keyframes flipCard {
                0%   { transform: rotateY(0deg); }
                50%  { transform: rotateY(90deg); }
                100% { transform: rotateY(0deg); }
            }
            .login-card.flipping {
                animation: flipCard 480ms ease;
            }

            /* Selector de modo (Estudiante / Administrador) */
            .mode-switch {
                display: flex;
                background: rgba(255,255,255,0.15);
                border-radius: 30px;
                padding: 4px;
                margin: 16px auto 0 auto;
                width: fit-content;
                position: relative;
            }
            .mode-switch button {
                border: none;
                background: transparent;
                color: rgba(255,255,255,0.85);
                font-size: 12px;
                font-weight: 500;
                padding: 7px 18px;
                border-radius: 20px;
                cursor: pointer;
                position: relative;
                z-index: 2;
                transition: color 200ms ease;
                letter-spacing: 0.3px;
            }
            .mode-switch button.active {
                color: #064589;
            }
            .mode-switch .switch-pill {
                position: absolute;
                top: 4px;
                bottom: 4px;
                left: 4px;
                width: calc(50% - 4px);
                background: #fff;
                border-radius: 20px;
                transition: transform 250ms ease;
                z-index: 1;
            }
            .mode-switch.mode-admin .switch-pill {
                transform: translateX(100%);
            }

            .login-card-header {
                background: #064589;
                text-align: center;
                padding: 26px 25px 20px 25px;
                transition: background 250ms ease;
            }
            .login-card-header.mode-admin {
                background: #C81C28;
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
                margin: 10px 0 2px 0;
            }
            .login-card-header p {
                color: rgba(255,255,255,0.75);
                font-size: 12px;
                margin: 0;
                letter-spacing: 0.5px;
            }
            .login-card-body {
                padding: 28px 30px 32px 30px;
            }
            .login-card-body .form-control {
                height: 44px;
                border-radius: 6px;
                border: 1px solid #ddd;
                margin-bottom: 14px;
                box-shadow: none;
            }
            .login-card-body .form-control:focus {
                border-color: #064589;
                box-shadow: 0 0 0 2px rgba(6,69,137,0.15);
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
                transition: background 250ms ease;
            }
            .btn-login.mode-admin {
                background: #C81C28;
            }
            .btn-login:hover {
                filter: brightness(0.9);
                color: #fff;
            }
            .login-footnote {
                text-align: center;
                margin-top: 18px;
                font-size: 12px;
                color: #999;
            }
        </style>
    </head>
    <body>

        <div class="login-card" id="loginCard">
            <div class="login-card-header" id="cardHeader">
                <img src="images/home/escudo-boliviano-holandes.png" alt="U.E.P. Boliviano Holandés">
                <h1 id="cardTitle">Biblioteca Virtual</h1>
                <p>U.E.P. BOLIVIANO HOLANDÉS</p>

                <div class="mode-switch" id="modeSwitch">
                    <div class="switch-pill"></div>
                    <button type="button" class="active" id="btnEstudiante" onclick="cambiarModo('estudiante')">
                        <i class="fa fa-graduation-cap"></i> Estudiante
                    </button>
                    <button type="button" id="btnAdmin" onclick="cambiarModo('admin')">
                        <i class="fa fa-lock"></i> Administrador
                    </button>
                </div>
            </div>
            <div class="login-card-body">
                <form role="form" action="login/validarUsuario.php" method="post" class="login-form" id="loginForm">
                    <div class="form-group">
                        <label class="sr-only" for="form-username">Usuario</label>
                        <input type="text" name="username" placeholder="Usuario..." class="form-username form-control" id="form-username" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="form-password">Contraseña</label>
                        <input type="password" name="password" placeholder="Contraseña..." class="form-password form-control" id="form-password" required>
                    </div>
                    <button type="submit" class="btn-login" id="btnLogin" name="login">Entrar</button>
                </form>
                <p class="login-footnote" id="cardFootnote">Acceso solo para usuarios autorizados por el colegio.</p>
            </div>
        </div>

        <script src="login/assets/js/jquery-1.11.1.min.js"></script>
        <script src="login/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="login/assets/js/scripts.js"></script>
        <script>
            var modoActual = 'estudiante';

            function cambiarModo(modo, animar) {
                if (modo === modoActual) return;
                modoActual = modo;
                animar = (animar === undefined) ? true : animar;

                var card = document.getElementById('loginCard');
                var aplicarCambios = function () {
                    var header = document.getElementById('cardHeader');
                    var switchEl = document.getElementById('modeSwitch');
                    var titulo = document.getElementById('cardTitle');
                    var footnote = document.getElementById('cardFootnote');
                    var form = document.getElementById('loginForm');
                    var btnLogin = document.getElementById('btnLogin');
                    var btnEstudiante = document.getElementById('btnEstudiante');
                    var btnAdmin = document.getElementById('btnAdmin');

                    if (modo === 'admin') {
                        header.classList.add('mode-admin');
                        switchEl.classList.add('mode-admin');
                        btnLogin.classList.add('mode-admin');
                        titulo.innerText = 'Panel de Administración';
                        footnote.innerText = 'Acceso exclusivo para el administrador del sistema.';
                        form.action = 'login/validar.php';
                        btnAdmin.classList.add('active');
                        btnEstudiante.classList.remove('active');
                    } else {
                        header.classList.remove('mode-admin');
                        switchEl.classList.remove('mode-admin');
                        btnLogin.classList.remove('mode-admin');
                        titulo.innerText = 'Biblioteca Virtual';
                        footnote.innerText = 'Acceso solo para usuarios autorizados por el colegio.';
                        form.action = 'login/validarUsuario.php';
                        btnEstudiante.classList.add('active');
                        btnAdmin.classList.remove('active');
                    }
                };

                if (!animar) {
                    aplicarCambios();
                    return;
                }

                card.classList.add('flipping');
                setTimeout(aplicarCambios, 240);
                setTimeout(function () {
                    card.classList.remove('flipping');
                }, 480);
            }

            // Si llegamos con ?modo=admin (ej. desde el link "Administracion" del sitio),
            // preseleccionamos ese modo de una vez, sin animar, porque es carga nueva de pagina.
            (function () {
                var params = new URLSearchParams(window.location.search);
                if (params.get('modo') === 'admin') {
                    cambiarModo('admin', false);
                }
            })();
        </script>
    </body>
</html>
