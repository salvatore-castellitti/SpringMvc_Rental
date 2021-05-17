package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.Vehicle;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class VehicleDaoImpl extends AbstractDao<Vehicle,String> implements VehicleDao {

    //Criteria AP
    @Override
    public List<Vehicle> getAll() {
        return super.getAll();
    }

    @Override
    public List<Vehicle> getFreeVehicle(Date sDate, Date eDate) {
        List<Vehicle> vehciles;

        String JPQL = "from Vehicle where id not in (select ve.id from Vehicle as ve join ve.reservation as verRes  where verRes.endDate > :startDate AND verRes.startDate < :endDate)";

        vehciles = entityManager.createQuery(JPQL).setParameter("startDate",sDate).setParameter("endDate",eDate).getResultList();
        return vehciles;
    }

    @Override
    public void save(Vehicle entity) {
        super.save(entity);
    }

    @Override
    public void update(Vehicle entity) {
        super.update(entity);
    }

    @Override
    public void delete(Vehicle entity) {
        super.delete(entity);
    }

    @Override
    public Vehicle getById(String s) {
        return super.getById(s);
    }
}
