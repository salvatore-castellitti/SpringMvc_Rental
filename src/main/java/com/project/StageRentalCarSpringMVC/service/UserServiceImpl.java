package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.dao.UserDao;
import com.project.StageRentalCarSpringMVC.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("UserService")
@Transactional //sotto transazione
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userRepository;

    @Override
    public List<User> getAll() {
        return userRepository.getAll();
    }

    @Override
    public User getByUsername(String username) {
        return userRepository.getByUsername(username);
    }


    @Override
    public void save(User user) {
         userRepository.save(user);

    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);

    }

    @Override
    public User getById(String id){
        return userRepository.getById(id);
    }
}
