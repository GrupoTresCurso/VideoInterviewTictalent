
function validarRegistro(){
    var nombre = document.getElementById("nombreUsuario").value;
    var password = document.getElementById("passwordUsuario").value;
    var error1=false, error2=false;

    if(nombre.length<=4){
        error1 = false;
    }else{
        document.getElementById("errorNombre").innerHTML="Deben tener más de 4 caracteres";
        error1 = true;
    }

    if(password.length<=4){
        error2 = false;
    }else{
        document.getElementById("errorPassword").innerHTML="Deben tener más de 4 caracteres";
        error1 = true;
    }

    if(!error1 && !error2){
        document.getElementById("formRegistro").submit();
        document.getElementById("errorNombre").innerHTML="";
        document.getElementById("errorPassword").innerHTML="";
    }


}
