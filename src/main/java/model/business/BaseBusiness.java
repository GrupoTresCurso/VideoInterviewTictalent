package model.business;

import java.util.List;

public interface BaseBusiness<T> {
    void crearNuevo(T object);
    T recuperarPorId(int id);
    List<T> recuperarTodos();
    void borrarPorId(int id);
    void actualizar(T object);
}
