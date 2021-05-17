package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.model.Reservation;
import com.project.StageRentalCarSpringMVC.model.User;

import java.util.List;

public interface ReservationService {

    List<Reservation> getAll();

    List<Reservation> getAllById(User user);

    void save(Reservation reservation);

    void update(Reservation reservation);

    void delete(Reservation reservation);

    Reservation getById(String id);

    void deleteById(int id);
}
