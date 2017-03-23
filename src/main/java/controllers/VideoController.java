package controllers;

import beans.helpers.ListaArchivos;
import beans.entities.Video;
import model.business.BaseBusiness;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import utils.BaseUtil;
import utils.UtilMultipart;
import utils.UtilServer;

import java.io.File;


@Controller
public class VideoController implements BaseController {

    private static final String BASE_PATH = BaseUtil.RUTA_FICHEROS + BaseUtil.CARPETA_VIDEOS;

    @Autowired
    @Qualifier("VideoBusiness")
    private BaseBusiness<Video> videoBusiness;

    @Autowired
    private UtilServer utilServer;

    @Autowired
    private UtilMultipart utilMultipart;


    @RequestMapping(value = "/recuperarVideo.do", method = RequestMethod.GET)
    public ResponseEntity<FileSystemResource> recuperarVideo(@RequestParam("filename") String fileName) {
        FileSystemResource resource = new FileSystemResource(new File(BASE_PATH, fileName));
        return new ResponseEntity<>(resource, HttpStatus.OK);
    }

    @RequestMapping(value="/subirVideo.do",method= RequestMethod.POST)
    public String subirVideo(@ModelAttribute("listaVideos")ListaArchivos listaVideos) {
        MultipartFile multipartFile = listaVideos.getArchivos().get(0);
        String nombreAleatorio = utilServer.crearNombreAleatorio();
        utilServer.subirMultipart(multipartFile, nombreAleatorio);
        Video video = utilMultipart.obtenerVideo(multipartFile, nombreAleatorio,"Aun no seleccionado");
        videoBusiness.crearNuevo(video);
        return CARGAR_VIDEO;
    }
}
