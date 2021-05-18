package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.dao.VehicleDao;
import com.project.StageRentalCarSpringMVC.model.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("VehicleService")
@Transactional
public class VehicleServiceImpl implements VehicleService{

    @Autowired
    private VehicleDao vehicleRepository;


    @Override
    public List<Vehicle> getAll() {
        return vehicleRepository.getAll();
    }

    @Override
    public List<Vehicle> getFreeVehicle(Date sDate, Date eDate) {
        return vehicleRepository.getFreeVehicle(sDate,eDate);
    }

    @Override
    public void save(Vehicle vehicle) {
        vehicleRepository.save(vehicle);
    }

    @Override
    public void update(Vehicle vehicle) {
        vehicleRepository.update(vehicle);
    }

    @Override
    public void delete(Vehicle vehicle) {
        vehicleRepository.delete(vehicle);
    }

    @Override
    public Vehicle getById(String id) {
        return vehicleRepository.getById(id);
    }

    @Override
    public void deleteById(int id) {
        vehicleRepository.deleteById(id);
    }
}
