package model.business;

import beans.Archivo;

import model.dao.ArchivoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ArchivoBusiness")
public class ArchivoBusiness implements BaseBusiness<Archivo>{

    @Autowired
    @Qualifier("ArchivoDAO")
    private ArchivoDAO archivoDAO;

    @Override
    public void crearNuevo(Archivo archivo) {
        archivoDAO.insert(archivo);
    }

    @Override
    public Archivo recuperarPorId(int id) {
        return archivoDAO.selectOne(id);
    }

    @Override
    public List<Archivo> recuperarTodos() {
        return archivoDAO.selectAll();
    }

    @Override
    public void borrarPorId(int id) {
        archivoDAO.delete(id);
    }

    @Override
    public void actualizar(Archivo archivo) {
        archivoDAO.update(archivo);
    }
}
