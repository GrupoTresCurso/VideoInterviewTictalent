package utils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


public class UtilServer {

    private final String RUTA_FICHEROS =Thread.currentThread().getContextClassLoader().getResource("../../").getPath()+"/ficheros/";

    private void subirMultipart(MultipartFile multipartFile, String nombreAleatorio){
        if(!multipartFile.isEmpty()){
            String nombreOriginalArchivo=multipartFile.getOriginalFilename();
            String extension= FilenameUtils.getExtension(nombreOriginalArchivo);
            File ficheroDestino = new File(RUTA_FICHEROS + nombreAleatorio + "." +extension);
            try {
                multipartFile.transferTo(ficheroDestino);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private String crearNombreAleatorio(){
        return UUID.randomUUID().toString();
    }

}
