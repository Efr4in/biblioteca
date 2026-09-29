$(document).ready(pagination(1));

$(function(){
	$('#nuevo-producto').on('click',function(){
		$('#formulario')[0].reset();
		$('#pro').val('Registro');
		$('#edi').hide();
		$('#reg').show();
		$('#imagen').prop('required', true);
		$('#imagenActualTxt').hide();
		$('#registra-producto').modal({
			show:true,
			backdrop:'static'
		});
	});

	$('#bs-prod').on('keyup',function(){
		var dato = $('#bs-prod').val();
		var url = 'avisos/busca_aviso.php';
		$.ajax({
		type:'POST',
		url:url,
		data:'dato='+dato,
		success: function(datos){
			$('#agrega-registros').html(datos);
		}
	});
	return false;
	});
});

function agregaAviso(){
	var url = 'avisos/agrega_aviso.php';
	var formData = new FormData(document.getElementById('formulario'));

	$.ajax({
		type:'POST',
		url:url,
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: function(registro){
			if ($('#pro').val() == 'Registro'){
				$('#formulario')[0].reset();
				$('#mensaje').addClass('bien').html('Aviso registrado con exito').show(200).delay(2500).hide(200);
				$('#agrega-registros').html(registro);
				return false;
			}else{
				$('#mensaje').addClass('bien').html('Aviso editado con exito').show(200).delay(2500).hide(200);
				$('#agrega-registros').html(registro);
				return false;
			}
		}
	});
	return false;
}

function eliminarAviso(id){
	var url = 'avisos/elimina_aviso.php';
	var pregunta = confirm('¿Esta seguro de eliminar este aviso?');
	if(pregunta==true){
		$.ajax({
		type:'POST',
		url:url,
		data:'id='+id,
		success: function(registro){
			$('#agrega-registros').html(registro);
			return false;
		}
	});
	return false;
	}else{
		return false;
	}
}

function editarAviso(id){
	$('#formulario')[0].reset();
	var url = 'avisos/edita_aviso.php';
	$.ajax({
		type:'POST',
		url:url,
		data:'id='+id,
		success: function(valores){
			var datos = eval(valores);
			$('#reg').hide();
			$('#edi').show();
			$('#pro').val('Edicion');
			$('#id-prod').val(id);
			$('#imagen').prop('required', false);
			$('#imagenActualTxt').show();
			$('#titulo').val(datos[1]);
			$('#subtitulo').val(datos[2]);
			$('#contenido').val(datos[3]);
			$('#orden').val(datos[4]);
			$('input[name=activo][value="'+datos[5]+'"]').prop('checked', true);
			$('#registra-producto').modal({
				show:true,
				backdrop:'static'
			});
			return false;
		}
	});
	return false;
}

function pagination(partida){
	var url = 'avisos/paginar_avisos.php';
	$.ajax({
		type:'POST',
		url:url,
		data:'partida='+partida,
		success:function(data){
			var array = eval(data);
			$('#agrega-registros').html(array[0]);
			$('#pagination').html(array[1]);
		}
	});
	return false;
}