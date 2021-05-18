package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.*;
import java.util.List;

@Repository
public class UserDaoImpl extends AbstractDao<User,String> implements UserDao{

    @Override
    public List<User> getAll() {
        return super.getAll();
    }

    @Override
    public void save(User entity) {
        super.save(entity);
    }

    @Override
    public void update(User entity) {
        super.update(entity);
    }

    @Override
    public void delete(User entity) {
        super.delete(entity);
    }

    @Override
    public User getById(String s) {
        return super.getById(s);
    }

    @Override
    public User getByUsername(String username) {

        User user;
        String JPQL = "SELECT u FROM User u WHERE u.username = :username ";

        user = (User) entityManager.createQuery(JPQL).setParameter("username", username).getSingleResult();
        return user;
    }

    @Override
    public void deleteById(int id){
        String JPQL = "DELETE FROM User u WHERE u.id = :id ";
        entityManager.createQuery(JPQL).setParameter("id", id).executeUpdate();

    }
}
