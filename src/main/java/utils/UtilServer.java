package utils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

//videos mpg mp4 avi mov

@Service
public class UtilServer implements BaseUtil {

    public void subirMultipart(MultipartFile multipartFile, String nombreAleatorio) {
        if (!multipartFile.isEmpty()) {
            String nombreOriginalArchivo = multipartFile.getOriginalFilename();
            String extension = FilenameUtils.getExtension(nombreOriginalArchivo);
            File ficheroDestino;
            if (comprobarExtensionVideos(extension)) {
                ficheroDestino = new File(RUTA_FICHEROS + CARPETA_VIDEOS + nombreAleatorio + "." + extension);
            } else {
                ficheroDestino = new File(RUTA_FICHEROS + CARPETA_DOCS + nombreAleatorio + "." + extension);
            }
            try {
                multipartFile.transferTo(ficheroDestino);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private boolean comprobarExtensionVideos(String extension) {
        List<String> extensiones = Arrays.asList("mpg", "mp4", "avi", "mov");
        for (String ext : extensiones) {
            if (extension.equals(ext)) {
                return true;
            }
        }
        return false;
    }

    public String crearNombreAleatorio() {
        return UUID.randomUUID().toString();
    }

}
