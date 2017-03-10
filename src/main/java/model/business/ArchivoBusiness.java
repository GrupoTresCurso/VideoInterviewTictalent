package model.business;

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
public class ArchivoBusiness implements BaseBusiness<Archivo>{

    @Autowired
    @Qualifier("ArchivoDAO")
    ArchivoDAO archivoDAO;

    @Override
    public void crearNuevo(Archivo archivo) {

    }

    @Override
    public Archivo recuperarPorId(int id) {
        return null;
    }

    @Override
    public List<Archivo> recuperarTodos() {
        return null;
    }

    @Override
    public void borrarPorId(int id) {

    }

    @Override
    public void actualizar(Archivo archivo) {

    }
}
