package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.User;

import java.util.List;

public interface UserDao{

    List<User> getAll();

    List<User> getAllCustomer();

    User getById(String id);

    User getByUsername(String username);

    void save(User user);

    void update(User user);

    void delete(User user);

    void deleteById(int id);

}
