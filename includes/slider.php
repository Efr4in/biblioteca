	<section id="slider"><!--slider-->
		<style>
			#slider-carousel .item {
				min-height: 400px;
				display: flex;
				align-items: center;
			}
			#slider-carousel .item > .col-sm-6:first-child {
				height: 340px;
				display: flex;
				flex-direction: column;
				justify-content: center;
				overflow: hidden;
			}
			#slider-carousel .item h1 {
				max-height: 96px;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}
			#slider-carousel .item h2 {
				max-height: 60px;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
			}
			#slider-carousel .item p {
				max-height: 66px;
				overflow: hidden;
				display: -webkit-box;
				-webkit-line-clamp: 3;
				-webkit-box-orient: vertical;
			}
			#slider-carousel .item .btn-leer-mas {
				margin-left: 10px;
			}
			#modalLeerMas .modal-header {
				background: #064589;
				color: #fff;
			}
			#modalLeerMas .modal-header h2 {
				margin: 4px 0 0 0;
				font-size: 16px;
				color: rgba(255,255,255,0.85);
			}
			#modalLeerMas .modal-body img {
				max-width: 100%;
				height: auto;
				border-radius: 6px;
				margin-bottom: 15px;
			}
			#modalLeerMas .modal-body p {
				font-size: 16px;
				line-height: 1.6;
				white-space: pre-line;
			}
			@media (max-width: 767px) {
				#slider-carousel .item > .col-sm-6:first-child {
					height: auto;
					max-height: 260px;
				}
			}
		</style>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span></span>El conocimiento en tus manos</h1>
									<h2>Todo lo que quieras a tu alcance</h2>
									<p>Con esta coleccion de libros puedes llegar a ser un experto en programacion.</p>
									<button type="button" class="btn btn-default get">Empezar</button>
									<button type="button" class="btn btn-link btn-leer-mas" onclick="verMasSlider(this)">Leer más</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl1.png" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span></span>Biblioteca en Línea</h1>
									<h2>Todo lo que necesitas para hacer tus tareas</h2>
									<p>Disponible para ti una gran cantidad de libros para realizar tus tareas y proyectos de clase. </p>
									<button type="button" class="btn btn-default get">Empezar</button>
									<button type="button" class="btn btn-link btn-leer-mas" onclick="verMasSlider(this)">Leer más</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl3.jpg" class="girl img-responsive" alt="" />
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<h1><span></span>Programación y Diseño</h1>
									<h2>Herramientas para programar y diseñar herramientas informáticas</h2>
									<p>Con esta cantidad de libros puedes diseñar culaquier tipo de herramienta informatica para el servicio de los demas. </p>
									<button type="button" class="btn btn-default get">Empezar</button>
									<button type="button" class="btn btn-link btn-leer-mas" onclick="verMasSlider(this)">Leer más</button>
								</div>
								<div class="col-sm-6">
									<img src="images/home/girl3.png" class="girl img-responsive" alt="" />
								</div>
							</div>

						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section><!--/slider-->

	<!-- Modal "Leer más" del slider: muestra el contenido completo sin que el slider crezca -->
	<div class="modal fade" id="modalLeerMas" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
					<h4 class="modal-title" id="modalLeerMasTitulo"></h4>
					<h2 id="modalLeerMasSubtitulo"></h2>
				</div>
				<div class="modal-body">
					<img id="modalLeerMasImg" src="" alt="">
					<p id="modalLeerMasContenido"></p>
				</div>
			</div>
		</div>
	</div>

	<script>
	function verMasSlider(btn) {
		var item = btn.closest('.item');
		var titulo = item.querySelector('h1').innerText;
		var subtitulo = item.querySelector('h2').innerText;
		var contenido = item.querySelector('p').innerText;
		var imgEl = item.querySelector('img');

		document.getElementById('modalLeerMasTitulo').innerText = titulo;
		document.getElementById('modalLeerMasSubtitulo').innerText = subtitulo;
		document.getElementById('modalLeerMasContenido').innerText = contenido;

		var modalImg = document.getElementById('modalLeerMasImg');
		if (imgEl) {
			modalImg.src = imgEl.getAttribute('src');
			modalImg.style.display = 'block';
		} else {
			modalImg.style.display = 'none';
		}

		$('#modalLeerMas').modal('show');
	}
	</script>
