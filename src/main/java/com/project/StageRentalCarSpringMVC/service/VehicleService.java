package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.model.User;
import com.project.StageRentalCarSpringMVC.model.Vehicle;

import java.util.Date;
import java.util.List;

public interface VehicleService{

    List<Vehicle> getAll();

    List<Vehicle> getFreeVehicle(Date sDate, Date eDate);

    void save(Vehicle vehicle);

    void update(Vehicle vehicle);

    void delete(Vehicle vehicle);

    Vehicle getById(String id);
}
