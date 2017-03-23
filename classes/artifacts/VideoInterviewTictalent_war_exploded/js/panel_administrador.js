var informacionUsuarioMostrada = false;
ajustarTamanioPagina();

function ajustarTamanioPagina() {
    $('#userInfo').css('display','none');
    $('nav').css('width', ($(window).width() - 30) + 'px');
    $('section').css('width', ($(window).width() - 2) + 'px');
    $('section').css('height', ($(window).height() - 300) + 'px');
    $('#contenedorPrincipal').css('width', ($(window).width() - 690) + 'px');
    $('#logoTictum').css('paddingLeft', ($(window).width() - 595) + 'px');
    $('#userInfo').css('left', ($(window).width() - 142) + 'px');
}

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

