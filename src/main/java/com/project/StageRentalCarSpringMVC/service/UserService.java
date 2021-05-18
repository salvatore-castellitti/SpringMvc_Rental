package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.model.User;

import java.util.List;

public interface UserService {
    List<User> getAll();

    User getByUsername(String username);

    void save(User user);

    void update(User user);

    void delete(User user);

    User getById(String id);

    void deleteById(int id);
}
