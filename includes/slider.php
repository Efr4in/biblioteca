<?php
$avisos_query = mysqli_query($con, "SELECT * FROM avisos WHERE activo = 'si' ORDER BY orden ASC, id_aviso ASC");
$avisos_lista = [];
while($av = mysqli_fetch_array($avisos_query)) {
    $avisos_lista[] = $av;
}
$total_avisos = count($avisos_lista);
?>
<section id="slider"><!--slider-->
    <style>
        #slider-carousel {
            position: relative;
            border: none;
            border-radius: 10px;
            background: #fff;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            padding: 0 45px;
            margin-top: 30px;
        }
        #slider-carousel .item {
            min-height: 400px;
            padding-bottom: 25px;
        }
        #slider-carousel .item > .col-sm-6 {
            height: 340px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow: hidden;
        }
        #slider-carousel .item > .col-sm-6:last-child {
            align-items: center;
        }
        #slider-carousel .item h1 {
            margin-top: 0;
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
        .aviso-nav-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #064589;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 20;
            border: none;
            padding: 0;
            transition: background 0.2s ease;
        }
        .aviso-nav-btn:hover {
            background: #043466;
        }
        .aviso-nav-prev {
            left: 12px;
        }
        .aviso-nav-next {
            right: 12px;
        }
        .aviso-nav-btn span {
            display: block;
            width: 10px;
            height: 10px;
            border-top: 3px solid #fff;
            border-right: 3px solid #fff;
        }
        .aviso-nav-prev span {
            transform: rotate(-135deg);
            margin-left: 4px;
        }
        .aviso-nav-next span {
            transform: rotate(45deg);
            margin-right: 4px;
        }
        #slider-carousel .carousel-indicators {
            bottom: 8px;
        }
        #slider-carousel .carousel-indicators li {
            border-color: #064589;
        }
        #slider-carousel .carousel-indicators .active {
            background-color: #064589;
        }
        @media (max-width: 767px) {
            #slider-carousel {
                padding: 0 40px;
                margin-top: 20px;
            }
            .aviso-nav-btn {
                width: 32px;
                height: 32px;
            }
            #slider-carousel .item > .col-sm-6 {
                height: auto;
                max-height: 260px;
            }
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
    </style>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <?php if($total_avisos > 0): ?>
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <?php for($i = 0; $i < $total_avisos; $i++): ?>
                            <li data-target="#slider-carousel" data-slide-to="<?php echo $i; ?>" class="<?php echo $i == 0 ? 'active' : ''; ?>"></li>
                        <?php endfor; ?>
                    </ol>

                    <div class="carousel-inner">
                        <?php foreach($avisos_lista as $i => $aviso): ?>
                            <div class="item <?php echo $i == 0 ? 'active' : ''; ?>">
                                <div class="col-sm-6">
                                    <h1><span></span><?php echo htmlspecialchars($aviso['titulo']); ?></h1>
                                    <h2><?php echo htmlspecialchars($aviso['subtitulo']); ?></h2>
                                    <p><?php echo htmlspecialchars($aviso['contenido']); ?></p>
                                    <button type="button" class="btn btn-default btn-leer-mas" onclick="verMasSlider(this)">Leer más</button>
                                </div>
                                <div class="col-sm-6">
                                    <?php if(!empty($aviso['imagen'])): ?>
                                        <img src="<?php echo htmlspecialchars($aviso['imagen']); ?>" class="girl img-responsive" alt="" />
                                    <?php endif; ?>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>

                    <button type="button" class="aviso-nav-btn aviso-nav-prev" data-slide="prev" data-target="#slider-carousel" aria-label="Anterior">
                        <span></span>
                    </button>
                    <button type="button" class="aviso-nav-btn aviso-nav-next" data-slide="next" data-target="#slider-carousel" aria-label="Siguiente">
                        <span></span>
                    </button>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section><!--/slider-->

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