package beans.entities;


import beans.helpers.HelperBeans;

import javax.persistence.*;

@Entity
public class Pregunta {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int idPregunta;
    private String labelPregunta;
    private String tipoPregunta;
    @Column(columnDefinition="MEDIUMTEXT")
    private String opciones;
    @Transient
    private String[] arrayOpciones;
    @Column(columnDefinition = "TINYINT(1)")
    private boolean favorito;

    public Pregunta() {
    }

    public Pregunta(String labelPregunta, String tipoPregunta, String opciones, boolean favorito) {
        this.labelPregunta = labelPregunta;
        this.tipoPregunta = tipoPregunta;
        this.opciones = opciones;
        this.arrayOpciones = arrayOpciones;
        this.favorito = favorito;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getLabelPregunta() {
        return labelPregunta;
    }

    public void setLabelPregunta(String labelPregunta) {
        this.labelPregunta = labelPregunta;
    }

    public String getTipoPregunta() {
        return tipoPregunta;
    }

    public void setTipoPregunta(String tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }

    public String getOpciones() {
        return opciones;
    }

    public void setOpciones(String opciones) {
        this.opciones = opciones;
    }

    public String[] getArrayOpciones() {
        return arrayOpciones;
    }

    public void setArrayOpciones(String[] arrayOpciones) {
        this.arrayOpciones = arrayOpciones;
    }

    public boolean isFavorito() {
        return favorito;
    }

    public void setFavorito(boolean favorito) {
        this.favorito = favorito;
    }
}
