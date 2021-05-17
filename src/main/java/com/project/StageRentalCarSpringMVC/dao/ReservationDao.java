package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.Reservation;
import com.project.StageRentalCarSpringMVC.model.User;

import java.util.List;

public interface ReservationDao {

    List<Reservation> getAll();

    List<Reservation> getAllById(User user);

    Reservation getById(String id);

    void save(Reservation reservation);

    void update(Reservation reservation);

    void delete(Reservation reservation);

    void deleteById(int id);

}
