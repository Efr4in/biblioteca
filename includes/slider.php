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

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
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