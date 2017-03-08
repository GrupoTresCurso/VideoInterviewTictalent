package model.business;

import beans.Candidato;
import model.dao.CandidatoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CandidatoBusiness implements BaseBusiness<Candidato> {

    @Autowired
    CandidatoDAO candidatoDAO;

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
}
