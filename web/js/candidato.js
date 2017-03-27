

function cambiarFoto(){
    if(document.getElementById("hombre").checked == true){
       document.getElementById("imagenCandidato").src = "../images/user_man.png";
    }
    if(document.getElementById("mujer").checked == true){
       document.getElementById("imagenCandidato").src = "../images/user_woman.png";
    }
}
