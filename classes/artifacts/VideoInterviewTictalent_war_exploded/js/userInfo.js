var informacionUsuarioMostrada = false;

document.getElementById('userInfo').style.display = 'none';
$('main').css('height', $(window).height() + 'px');

function mostrarOcultarInfoUsuario() {
    if(!informacionUsuarioMostrada){
        $('#userInfo').css('display','block');
        informacionUsuarioMostrada = true;
    }else{
        $('#userInfo').css('display','none');
        informacionUsuarioMostrada = false;
    }
}

function ocultarInfoUsuario() {
    $('#userInfo').css('display','none');
    informacionUsuarioMostrada = false;
}

