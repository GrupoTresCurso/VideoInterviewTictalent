package beans.helpers;

import java.util.List;

/**
 * Created by Tictum on 17/03/2017.
 */
public class ListaInfo {
    List<InfoVideoFormulario> listaInfoVideoFormularios;

    public ListaInfo() {
    }

    public ListaInfo(List<InfoVideoFormulario> listaInfoVideoFormularios) {
        this.listaInfoVideoFormularios = listaInfoVideoFormularios;
    }

    public List<InfoVideoFormulario> getListaInfoVideoFormularios() {
        return listaInfoVideoFormularios;
    }

    public void setListaInfoVideoFormularios(List<InfoVideoFormulario> listaInfoVideoFormularios) {
        this.listaInfoVideoFormularios = listaInfoVideoFormularios;
    }
}
