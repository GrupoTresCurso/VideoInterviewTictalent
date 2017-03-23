function seleccionar(clase, id) {
    cambiarFondo(clase, id);
}

function cambiarFondo(clase, id) {
    var entrevistas = document.getElementsByClassName(clase);
    for (var i = 0; i < entrevistas.length; i++) {
        entrevistas[i].style.backgroundColor = "white";
    }
    document.getElementById(id).style.backgroundColor = "#C0C0C0";
    cambiarOnClickClonar(id);
}

function cambiarOnClickClonar(id) {
    document.getElementById("valorId").value = id;
}
