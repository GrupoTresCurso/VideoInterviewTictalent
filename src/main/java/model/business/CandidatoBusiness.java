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
    public void crearNuevo(Candidato object) {

    }

    @Transactional(readOnly=true)
    public Candidato recuperarPorId(int id) {
        return null;
    }

    @Transactional(readOnly=true)
    public List<Candidato> recuperarTodos() {
        return null;
    }

    @Transactional
    public void borrarPorId(int id) {

    }
}
