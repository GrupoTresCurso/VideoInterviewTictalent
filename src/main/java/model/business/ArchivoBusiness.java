package model.business;

import beans.Archivo;

import model.dao.ArchivoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("ArchivoBusiness")
public class ArchivoBusiness implements BaseBusiness<Archivo>{

    @Autowired
    @Qualifier("ArchivoDAO")
    private ArchivoDAO archivoDAO;

    @Transactional
    public void crearNuevo(Archivo archivo) {
        archivoDAO.insert(archivo);
    }


    @Transactional(readOnly=true)
    public Archivo recuperarPorId(int id) {
        return archivoDAO.selectOne(id);
    }


    @Transactional(readOnly=true)
    public List<Archivo> recuperarTodos() {
        return archivoDAO.selectAll();
    }


    @Transactional
    public void borrarPorId(int id) {
        archivoDAO.delete(id);
    }


    @Transactional
    public void actualizar(Archivo archivo) {
        archivoDAO.update(archivo);
    }
}
