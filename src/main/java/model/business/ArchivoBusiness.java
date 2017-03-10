package model.business;
/*
import beans.Archivo;
import beans.ListaArchivos;
import model.dao.ArchivoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.naming.Context;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service("ArchivoBusiness")
public class ArchivoBusiness implements BaseBusiness<ListaArchivos>{

    @Autowired
    @Qualifier("ArchivoDAO")
    private ArchivoDAO archivoDAO;

    @Autowired
    private ApplicationContext applicationContext;

    @Override
    @Transactional
    public void crearNuevo(ListaArchivos listaArchivos) {
        List<MultipartFile> archivos = listaArchivos.getArchivos();

        if(null != archivos && archivos.size() > 0) {

            for (MultipartFile archivo : archivos) {

                if (!archivo.isEmpty()){

                    String nombreOriginalArchivo = archivo.getOriginalFilename();
                    File aux=new File(.);

                    File ficheroDestino = new File(request.getSession().getServletContext().getRealPath("/ficheros/") +"/" + nombreOriginalArchivo);
                    applicationContext.get
                    try {
                        archivo.transferTo(ficheroDestino);
                    } catch (IllegalStateException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }


                }
            }
        }
    }

    @Override
    @Transactional(readOnly=true)
    public ListaArchivos recuperarPorId(int id) {
        return null;
    }

    @Override
    @Transactional(readOnly=true)
    public List<ListaArchivos> recuperarTodos() {
        return null;
    }

    @Override
    @Transactional
    public void borrarPorId(int id) {

    }

    @Override
    @Transactional
    public void actualizar(ListaArchivos listaArchivos) {

    }
}
*/