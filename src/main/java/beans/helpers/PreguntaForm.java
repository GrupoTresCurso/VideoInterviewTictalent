package beans.helpers;

import beans.entities.Pregunta;

import java.util.List;


public class PreguntaForm {
    List<Pregunta> preguntasSinDDBB;
    List<Integer> identificadoresDDBB;

    public PreguntaForm() {
    }

    public PreguntaForm(List<Pregunta> preguntasSinDDBB, List<Integer> identificadoresDDBB) {
        this.preguntasSinDDBB = preguntasSinDDBB;
        this.identificadoresDDBB = identificadoresDDBB;
    }

    public List<Pregunta> getPreguntasSinDDBB() {
        return preguntasSinDDBB;
    }

    public void setPreguntasSinDDBB(List<Pregunta> preguntasSinDDBB) {
        this.preguntasSinDDBB = preguntasSinDDBB;
    }

    public List<Integer> getIdentificadoresDDBB() {
        return identificadoresDDBB;
    }

    public void setIdentificadoresDDBB(List<Integer> identificadoresDDBB) {
        this.identificadoresDDBB = identificadoresDDBB;
    }
}
