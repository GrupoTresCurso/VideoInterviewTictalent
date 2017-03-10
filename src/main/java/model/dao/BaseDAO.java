package model.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("BaseDAO")
public interface BaseDAO<T> {
    void insert(T object);
    T selectOne(int id);
    List<T> selectAll();
    void update(T object);
    void delete(int id);
}
