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

activarEnlaceCorrecto();

function activarEnlaceCorrecto(){
    var enlaces = document.querySelectorAll('.linkMenu');
    for(var i=0;i<enlaces.length;i++){
        enlaces[i].style.color = 'white';
    }
    var activo = document.getElementById('enlaceActivo').value;
    document.getElementById(activo).style.color = '#00B4DF';
}

