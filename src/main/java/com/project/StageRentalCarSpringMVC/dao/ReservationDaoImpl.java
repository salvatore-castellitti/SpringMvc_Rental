package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.Reservation;
import com.project.StageRentalCarSpringMVC.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReservationDaoImpl extends AbstractDao<Reservation,String> implements ReservationDao{

    //Criteria AP
    @Override
    public List<Reservation> getAll() {
        return super.getAll();
    }

    @Override
    public List<Reservation> getAllById(User user) {
        List<Reservation> reservations;
        String JPQL = "FROM Reservation r WHERE r.user = :user ";

        reservations = entityManager.createQuery(JPQL).setParameter("user", user).getResultList();
        return reservations;
    }

    @Override
    public void save(Reservation entity) {
        super.save(entity);
    }

    @Override
    public void update(Reservation entity) {
        super.update(entity);
    }

    @Override
    public void delete(Reservation entity) {
        super.delete(entity);
    }

    @Override
    public Reservation getById(String s) {
        return super.getById(s);
    }

    @Override
    public void deleteById(int id){
        String JPQL = "DELETE FROM Reservation r WHERE r.id = :id ";
        entityManager.createQuery(JPQL).setParameter("id", id).executeUpdate();

    }
}
