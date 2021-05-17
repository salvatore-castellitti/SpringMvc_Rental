package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.dao.ReservationDao;
import com.project.StageRentalCarSpringMVC.dao.UserDao;
import com.project.StageRentalCarSpringMVC.model.Reservation;
import com.project.StageRentalCarSpringMVC.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("ReservationService")
@Transactional
public class ReservationServiceImpl implements ReservationService{

    @Autowired
    private ReservationDao reservationRepository;

    @Override
    public List<Reservation> getAll() {
        return reservationRepository.getAll();
    }

    @Override
    public List<Reservation> getAllById(User user) {
        return reservationRepository.getAllById(user);
    }

    @Override
    public void save(Reservation reservation) {
        reservationRepository.save(reservation);
    }

    @Override
    public void update(Reservation reservation) {
        reservationRepository.update(reservation);
    }

    @Override
    public void delete(Reservation reservation) {
        reservationRepository.delete(reservation);
    }

    @Override
    public Reservation getById(String id) {
        return reservationRepository.getById(id);
    }

    @Override
    public void deleteById(int id) {
        reservationRepository.deleteById(id);
    }
}
