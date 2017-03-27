package beans.helpers;

import beans.entities.Pregunta;

import java.util.List;


public class PreguntaForm {
    List<Pregunta> preguntasSinDDBB;
    List<ID> identificadoresDDBB;
    Integer identificadorFormulario;

    public PreguntaForm() {
    }

    public List<Pregunta> getPreguntasSinDDBB() {
        return preguntasSinDDBB;
    }

    public void setPreguntasSinDDBB(List<Pregunta> preguntasSinDDBB) {
        this.preguntasSinDDBB = preguntasSinDDBB;
    }

    public List<ID> getIdentificadoresDDBB() {
        return identificadoresDDBB;
    }

    public void setIdentificadoresDDBB(List<ID> identificadoresDDBB) {
        this.identificadoresDDBB = identificadoresDDBB;
    }

    public Integer getIdentificadorFormulario() {
        return identificadorFormulario;
    }

    public void setIdentificadorFormulario(Integer identificadorFormulario) {
        this.identificadorFormulario = identificadorFormulario;
    }
}
