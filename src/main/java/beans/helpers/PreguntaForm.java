package beans.helpers;

import beans.entities.Pregunta;

import java.util.List;


public class PreguntaForm {
    List<Pregunta> preguntasSinDDBB;
    List<ID> identificadoresDDBB;

    public PreguntaForm() {
    }

    public PreguntaForm(List<Pregunta> preguntasSinDDBB, List<ID> identificadoresDDBB) {
        this.preguntasSinDDBB = preguntasSinDDBB;
        this.identificadoresDDBB = identificadoresDDBB;
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
}
