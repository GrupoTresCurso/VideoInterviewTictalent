package beans.helpers;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

//Clase creada para manejar el input de archivos y subir los archivos fisicos a la ruta especificada
public class ListaArchivos {
    private List<MultipartFile> archivos;

    public List<MultipartFile> getArchivos() {
        return archivos;
    }

    public void setArchivos(List<MultipartFile> archivos) {
        this.archivos = archivos;
    }

    public int size() {
        return archivos.size();
    }

}
