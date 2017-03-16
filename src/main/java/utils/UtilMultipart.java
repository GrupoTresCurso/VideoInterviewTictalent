package utils;

import beans.Archivo;
import beans.Video;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UtilMultipart implements BaseUtil {

    public Archivo obtenerArchivo(MultipartFile multipartFile, String nombreAleatorio) {
        String nombreOriginalArchivo = multipartFile.getOriginalFilename();
        String extension = FilenameUtils.getExtension(nombreOriginalArchivo);
        String rutaEnFicheros = RUTA_FICHEROS + CARPETA_DOCS + nombreAleatorio + "." + extension;
        return new Archivo(nombreOriginalArchivo, rutaEnFicheros);
    }

    public Video obtenerVideo(MultipartFile multipartFile, String nombreAleatorio, int posicionEnEntrevista, String tipoVideo) {
        String nombreOriginalArchivo = multipartFile.getOriginalFilename();
        String extension = FilenameUtils.getExtension(nombreOriginalArchivo);
        String rutaEnFicheros = SERVLET_EXTENSION + nombreAleatorio + "." + extension;
        return new Video(nombreOriginalArchivo, rutaEnFicheros, posicionEnEntrevista, tipoVideo);
    }

}
