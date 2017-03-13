package utils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


public class UtilServer implements BaseUtil {

    public void subirMultipart(MultipartFile multipartFile, String nombreAleatorio){
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

    public String crearNombreAleatorio(){
        return UUID.randomUUID().toString();
    }

}
