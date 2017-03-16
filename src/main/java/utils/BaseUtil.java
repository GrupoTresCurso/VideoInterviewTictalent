package utils;

public interface BaseUtil {
    String CARPETA_DOCS = "archivos\\";
    String CARPETA_VIDEOS = "videos\\";
    String RUTA_FICHEROS = System.getProperty("user.dir").replace("bin","archivos\\");
    String SERVLET_VIDEOS_NAME = "recuperarVideo.do";
    String SERVLET_EXTENSION = SERVLET_VIDEOS_NAME + "?filename=";
}
