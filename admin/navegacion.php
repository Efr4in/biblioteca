<div id="wrapper">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-fw fa-user"></i> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a></li>
                    <li class="divider"></li>
                    <li><a href="/biblioteca/login/logout.php"><i class="fa fa-fw fa-power-off"></i> Cerrar Sesión</a></li>
                </ul>
            </li>
        </ul>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">

                <li class="active">
                    <a href="/biblioteca/admin/inicio.php"><i class="fa fa-fw fa-home"></i> Inicio</a>
                </li>

                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#mantenimiento">
                        <i class="fa fa-fw fa-book"></i> Libros<i class="fa fa-fw fa-caret-down"></i>
                    </a>
                    <ul id="mantenimiento" class="collapse">
                        <li><a href="/biblioteca/admin/libros.php"><i class="fa fa-fw fa-book"></i> Libros</a></li>
                        <li><a href="/biblioteca/admin/categoria_libro.php"><i class="fa fa-fw fa-list-ol"></i> Categorias</a></li>
                        <li><a href="/biblioteca/admin/subcategoria_libro.php"><i class="fa fa-fw fa-bars"></i> Subcategorias</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#prestamo">
                        <i class="fa fa-fw fa-book"></i> Prestamos<i class="fa fa-fw fa-caret-down"></i>
                    </a>
                    <ul id="prestamo" class="collapse">
                        <li><a href="/biblioteca/admin/prestar_libro.php"><i class="fa fa-fw fa-share-alt"></i> Prestar Libro</a></li>
                        <li><a href="/biblioteca/admin/Lista_prestamos_libros.php"><i class="fa fa-fw fa-book"></i> Lista Prestamos</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#pdf">
                        <i class="fa fa-fw fa-file-pdf-o"></i> PDF<i class="fa fa-fw fa-caret-down"></i>
                    </a>
                    <ul id="pdf" class="collapse">
                        <li><a href="/biblioteca/admin/lista_pdf.php"><i class="fa fa-fw fa-file-pdf-o"></i> PDF</a></li>
                        <li><a href="/biblioteca/admin/subir_pdf.php"><i class="fa fa-fw fa-arrow-circle-up"></i> Subir PDF</a></li>
                    </ul>
                </li>

                <li><a href="/biblioteca/admin/comentarios.php"><i class="fa fa-fw fa-envelope"></i> Mensajes</a></li>
                <li><a href="/biblioteca/admin/suscriptores.php"><i class="fa fa-fw fa-check-square-o"></i> Suscriptores</a></li>
                <li><a href="/biblioteca/admin/visitas.php"><i class="fa fa-fw fa-globe"></i> Visitas</a></li>
                <li><a href="/biblioteca/admin/copiaSeguridad.php"><i class="fa fa-fw fa-database"></i> Respaldo</a></li>
                <li><a href="/biblioteca/admin/usuarios.php"><i class="fa fa-fw fa-users"></i> Usuarios</a></li>
                <li><a href="/biblioteca/admin/estudiantes.php"><i class="fa fa-fw fa-users"></i> Estudiantes</a></li>
                <li><a href="/biblioteca/admin/visitantes.php"><i class="fa fa-fw fa-users"></i> Visitantes</a></li>
                <li><a href="/biblioteca/login/logout.php"><i class="fa fa-fw fa-power-off"></i> Cerrar sesion</a></li>

            </ul>
        </div>
    </nav>