package controllers;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import utils.BaseUtil;

import java.io.File;

@Controller
public class VideosController {

    public static final String BASE_PATH = BaseUtil.RUTA_FICHEROS + BaseUtil.CARPETA_VIDEOS;

    @RequestMapping(value = "/videos.do", method = RequestMethod.GET)
    public ResponseEntity<FileSystemResource> getFile(@RequestParam("filename") String fileName) {
        FileSystemResource resource = new FileSystemResource(new File(BASE_PATH, fileName));
        ResponseEntity<FileSystemResource> responseEntity = new ResponseEntity<>(resource, HttpStatus.OK);
        return responseEntity;
    }
}
