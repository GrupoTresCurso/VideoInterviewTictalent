package model.business;

import beans.Formulario;
import model.dao.FormularioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("FormularioBusiness")
public class FormularioBusiness implements BaseBusiness<Formulario> {

    @Autowired
    @Qualifier("FormularioDAO")
    FormularioDAO formularioDAO;

    @Transactional
    public void crearNuevo(Formulario formulario) {
        formularioDAO.insert(formulario);
    }
    @Transactional(readOnly=true)
    public Formulario recuperarPorId(int id) {
        return formularioDAO.selectOne(id);
    }

    @Transactional(readOnly=true)
    public List<Formulario> recuperarTodos() {
        return formularioDAO.selectAll();
    }

    @Transactional
    public void borrarPorId(int id) {
        formularioDAO.delete(id);
    }

    @Transactional
    public void actualizar(Formulario formulario) {
        formularioDAO.update(formulario);
    }
}
