<?php
//session_start();
include("admin/conexion.php");
$nombre = $_SESSION['usuario'];

 	?>
	<header id="header"><!--header-->
		<div class="header_top"><!--header de arriba-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> 60683706</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> efrasilva2001@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<!-- REDES SOCIALES DE SER NECESARIAS
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								-->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-->
		
		<div class="header-middle"><!--header central-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left" style="display:flex; align-items:center;">
							<a href="inicio.php" style="display:flex; align-items:center;">
								<img src="images/home/escudo-boliviano-holandes.png" alt="U.E.P. Boliviano Holandés" height="60" style="width:auto;">
								<span style="margin-left:10px; font-family:'Roboto', sans-serif; font-weight:600; color:#064589; line-height:1.1; font-size:15px;">Biblioteca Virtual<br><span style="font-weight:300; font-size:12px; color:#555;">U.E.P. Boliviano Holandés</span></span>
							</a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li>
                            <a href="#" target="contenedor"><i class="fa fa-fw fa-user"></i>Usuario:<b style="color:green;"> <?php  echo $nombre; ?></b></a>
                        </li>
							    <li><a href="login/login.php"><i class="fa fa-lock"></i> Administracion</a></li>
							    <li><a href="login/logout2.php"><i class="fa fa-power-off"></i> Salir</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-->
	
		<div class="header-bottom"><!--header de abajo-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="inicio.php" class="active">Inicio</a></li>
								<li class="dropdown"><a href="#">Libros<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <?php
                                            $menucat = mysqli_query($con, "select * from categorias order by nombre_categoria asc");
                                            while ($menucatrow = mysqli_fetch_array($menucat)) {
                                        ?>
                                        <li><a href="inicio.php?cat=<?php echo $menucatrow['id_categoria']; ?>"><?php echo $menucatrow['nombre_categoria']; ?></a></li>
                                        <?php
                                            }
                                        ?>
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Servicios<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="prestamos.php">Prestamos de Libros</a></li>
                                    </ul>
                                </li> 
								<li><a href="contacto.php">Contacto</a></li>
								<li><a href="busqueda.php">Buscar un Libro</a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div><!--/header-->
	</header><!--/ fin del header-->