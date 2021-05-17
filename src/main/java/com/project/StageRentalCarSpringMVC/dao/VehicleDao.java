package com.project.StageRentalCarSpringMVC.dao;

import com.project.StageRentalCarSpringMVC.model.Vehicle;

import java.util.Date;
import java.util.List;

public interface VehicleDao {

    List<Vehicle> getAll();

    List<Vehicle> getFreeVehicle(Date sDate, Date eDate);

    Vehicle getById(String id);

    void save(Vehicle vehicle);

    void update(Vehicle vehicle);

    void delete(Vehicle vehicle);

}
