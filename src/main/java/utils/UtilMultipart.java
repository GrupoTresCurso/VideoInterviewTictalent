package utils;

import beans.Archivo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Tictum on 13/03/2017.
 */
public class UtilMultipart implements BaseUtil{
    
    public Archivo obtenerArchivo(MultipartFile multipartFile, String nombreAleatorio){
        String nombreOriginalArchivo = multipartFile.getOriginalFilename();
        String extension= FilenameUtils.getExtension(nombreOriginalArchivo);
        String rutaEnFicheros = RUTA_FICHEROS + nombreAleatorio + "."+extension;
        return new Archivo(nombreOriginalArchivo,rutaEnFicheros);
    }
}
