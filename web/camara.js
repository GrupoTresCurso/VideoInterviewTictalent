var botonAcceso = document.getElementById("botonAcceso"),
    botonGrabar = document.getElementById("botonGrabar"),
    botonParar = document.getElementById("botonParar"),
    video = document.getElementById("video"),
    error = function(error) {
      console.log("Error:", error.name);
    };

function acceder(){
    // Estándar 
    if(navigator.getUserMedia) {
        navigator.getUserMedia({ "video": true, "audio": true}, function(stream) {
            video.src = stream;
            video.play();
        }, error);
    }
    // prefijo WebKit
    else if(navigator.webkitGetUserMedia) { 
        navigator.webkitGetUserMedia({ "video": true, "audio": true}, function(stream){
            video.src = window.URL.createObjectURL(stream);
            video.play();
        }, error);
    }
    // prefijo Moz
    else if(navigator.mozGetUserMedia) {
        navigator.mozGetUserMedia({ "video": true, "audio": true}, function(stream){
            video.src = window.URL.createObjectURL(stream);
            video.play();
        }, error);
    }
    // Navegadores no compatibles
    else {
        alert("Tu navegador no es compatible con getUserMedia");
    }
};

function parar() {
    // Estándar
    if(navigator.getUserMedia) {
        navigator.getUserMedia({ "video": false, "audio": false}, function() {
            video.stop();
        }, error);
    }
    // prefijo WebKit
    else if(navigator.webkitGetUserMedia) {
        navigator.webkitGetUserMedia({ "video": false, "audio": false}, function(){
            video.stop();
        }, error);
    }
    // prefijo Moz
    else if(navigator.mozGetUserMedia) {
        navigator.mozGetUserMedia({ "video": false, "audio": false}, function(){
            video.stop();
        }, error);
    }
    // Navegadores no compatibles
    else {
        alert("Tu navegador no es compatible con getUserMedia");
    }

};

function grabar() {


};

function takepicture() {
    canvas.width = width;
    canvas.height = height;
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    var data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
};


botonAcceso.addEventListener("click", acceder);
botonParar.addEventListener("click", parar);
botonGrabar.addEventListener("click", takepicture);