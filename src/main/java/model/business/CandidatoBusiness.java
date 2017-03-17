package model.business;

import beans.entities.Candidato;
import model.dao.CandidatoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CandidatoBusiness")
public class CandidatoBusiness implements BaseBusiness<Candidato> {

    @Autowired
    @Qualifier("CandidatoDAO")
    private CandidatoDAO candidatoDAO;

    @Transactional
    public void crearNuevo(Candidato candidato) {
        candidatoDAO.insert(candidato);
    }

    @Transactional(readOnly=true)
    public Candidato recuperarPorId(int id) {
        return candidatoDAO.selectOne(id);
    }

    @Transactional(readOnly=true)
    public List<Candidato> recuperarTodos() {
        return candidatoDAO.selectAll();
    }

    @Transactional
    public void borrarPorId(int id) {
        candidatoDAO.delete(id);
    }

    @Transactional
    public void actualizar(Candidato candidato) {
        candidatoDAO.update(candidato);
    }
}
