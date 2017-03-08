package model.dao;

import java.util.List;

public interface BaseDAO<T> {
    void insert(T object);
    T selectOne(int id);
    List<T> selectAll();
    void update(T object);
    void delete(int id);
}
