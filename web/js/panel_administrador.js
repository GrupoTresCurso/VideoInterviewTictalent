
function validarRegistro(){
    var nombre = document.getElementById("nombreUsuario").value;
    var password2 = document.getElementById("passwordUsuario").value;


    if(password.length<=4){

        return true;
    }else{
        document.getElementById("errorPassword").innerHTML="No coinciden las contraseñas";
        return false;
    }

    document.getElementById("formRegistro").submit();
}
