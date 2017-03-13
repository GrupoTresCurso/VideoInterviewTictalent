package utils;

import beans.Archivo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

public class UtilMultipart implements BaseUtil{
    
    public Archivo obtenerArchivo(MultipartFile multipartFile, String nombreAleatorio){
        String nombreOriginalArchivo = multipartFile.getOriginalFilename();
        String extension= FilenameUtils.getExtension(nombreOriginalArchivo);
        String rutaEnFicheros = RUTA_FICHEROS + nombreAleatorio + "."+extension;
        return new Archivo(nombreOriginalArchivo,rutaEnFicheros);
    }
}
