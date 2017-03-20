ajustarTamanioPagina();

function ajustarTamanioPagina() {
    $('main').css('width', ($(window).width() - 600) + 'px');
    $('main').css('height', ($(window).height() - 240) + 'px');
    $('nav').css('width', ($(window).width() - 600) + 'px');
    $('aside').css('width', ($(window).width() - 1010) + 'px');
    $('#separador').css('height', ($(window).height() - 405) + 'px');
    $('section').css('width', ($(window).width() - 1100) + 'px');

}
