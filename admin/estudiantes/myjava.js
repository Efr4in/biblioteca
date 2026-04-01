$(document).ready(pagination(1));
$(function(){
    $('#bd-desde').on('change', function(){
        var desde = $('#bd-desde').val();
        var hasta = $('#bd-hasta').val();
        var url = 'clientes/busca_producto_fecha.php';
        $.ajax({
            type:'POST', url:url,
            data:'desde='+desde+'&hasta='+hasta,
            success: function(datos){ $('#agrega-registros').html(datos); }
        });
        return false;
    });

    $('#nuevo-producto').on('click', function(){
        $('#formulario')[0].reset();
        $('#pro').val('Registro');
        $('#edi').hide();
        $('#reg').show();
        $('#registra-producto').modal({ show:true, backdrop:'static' });
    });

    $('#bs-prod').on('keyup', function(){
        var dato = $('#bs-prod').val();
        $.ajax({
            type:'POST',
            url:'estudiantes/busca_estudiante.php',
            data:'dato='+dato,
            success: function(datos){ $('#agrega-registros').html(datos); }
        });
        return false;
    });
});

function agregaEmpleado(){
    $.ajax({
        type:'POST',
        url:'estudiantes/agrega_estudiante.php',
        data:$('#formulario').serialize(),
        success: function(registro){
            if ($('#pro').val() == 'Registro'){
                $('#formulario')[0].reset();
                $('#mensaje').addClass('bien').html('Registro completado con exito').show(200).delay(2500).hide(200);
            } else {
                $('#mensaje').addClass('bien').html('Edicion completada con exito').show(200).delay(2500).hide(200);
            }
            $('#agrega-registros').html(registro);
            return false;
        }
    });
    return false;
}

function eliminarEmpleado(id){
    var pregunta = confirm('¿Esta seguro de eliminar este Estudiante?');
    if (pregunta == true){
        $.ajax({
            type:'POST',
            url:'estudiantes/elimina_estudiante.php',
            data:'id='+id,
            success: function(registro){ $('#agrega-registros').html(registro); }
        });
    }
    return false;
}

function editarEmpleado(id){
    $('#formulario')[0].reset();
    $.ajax({
        type:'POST',
        url:'estudiantes/edita_estudiante.php',
        data:'id='+id,
        success: function(valores){
            var datos = eval(valores);
            $('#reg').hide();
            $('#edi').show();
            $('#pro').val('Edicion');
            $('#id-prod').val(id);
            $('#carnet').val(datos[0]);
            $('#nombre').val(datos[1]);
            $('#apellidos').val(datos[2]);
            $('#email').val(datos[3]);
            // datos[4] y datos[5] eliminados (anio y carrera)
            $('#registra-producto').modal({ show:true, backdrop:'static' });
            return false;
        }
    });
    return false;
}

function pagination(partida){
    $.ajax({
        type:'POST',
        url:'estudiantes/paginar_usuario.php',
        data:'partida='+partida,
        success: function(data){
            var array = eval(data);
            $('#agrega-registros').html(array[0]);
            $('#pagination').html(array[1]);
        }
    });
    return false;
}