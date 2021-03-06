package controllers;

import beans.entities.Archivo;
import beans.helpers.ListaArchivos;
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
public class ArchivoController implements BaseController {

    private static final String BASE_PATH = BaseUtil.RUTA_FICHEROS + BaseUtil.CARPETA_VIDEOS;

    @Autowired
    @Qualifier("ArchivoBusiness")
    private BaseBusiness<Archivo> archivoBusiness;

    @Autowired
    private UtilServer utilServer;

    @Autowired
    private UtilMultipart utilMultipart;


    @RequestMapping(value = "/recuperarArchivo.do", method = RequestMethod.GET)
    public ResponseEntity<FileSystemResource> recuperarVideo(@RequestParam("filename") String fileName) {
        FileSystemResource resource = new FileSystemResource(new File(BASE_PATH, fileName));
        ResponseEntity<FileSystemResource> responseEntity = new ResponseEntity<>(resource, HttpStatus.OK);
        return responseEntity;
    }

    @RequestMapping(value = "/subirArchivo.do", method = RequestMethod.POST)
    public String subirVideo(@ModelAttribute("listaArchivos") ListaArchivos listaArchivos) {
        MultipartFile multipartFile = listaArchivos.getArchivos().get(0);
        String nombreAleatorio = utilServer.crearNombreAleatorio();
        utilServer.subirMultipart(multipartFile, nombreAleatorio);
        Archivo archivo = utilMultipart.obtenerArchivo(multipartFile, nombreAleatorio);
        archivoBusiness.crearNuevo(archivo);
        return CARGAR_VIDEO;
    }

}
