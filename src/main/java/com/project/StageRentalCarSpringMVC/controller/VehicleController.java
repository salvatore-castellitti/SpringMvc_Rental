package com.project.StageRentalCarSpringMVC.controller;

import com.project.StageRentalCarSpringMVC.model.Vehicle;
import com.project.StageRentalCarSpringMVC.service.VehicleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/vehicle")
public class VehicleController {

    //private  static final org.slf4j.Logger Logger = LoggerFactory.getLogger(VehicleController.class);

    @Autowired
    private VehicleService vehicleService;

    @RequestMapping
    public String listVehicle(Model model){
        List<Vehicle> allVehicle = vehicleService.getAll();
        model.addAttribute("listVehicle",allVehicle);
        return "vehicle-list";
    }

    @GetMapping(value = {"/save","/update"})
    public String vehicleForm(Model model,
                              @ModelAttribute("idVehicle") String idVehicle){
        Vehicle vehicle = new Vehicle();
        if(!idVehicle.equals("")){
            vehicle = vehicleService.getById(idVehicle);
        }
        model.addAttribute("vehicleAction",vehicle);
        return "vehicle-form";
    }

    @PostMapping(value = {"/save","/update"})
    public String saveUser(@ModelAttribute("vehicleAction") Vehicle vehicle){
        if (vehicle.getId()!=0){
            vehicleService.update(vehicle);
        }else{
            vehicleService.save(vehicle);
        }
        return "redirect:/vehicle";
    }

//    @GetMapping("/update")
//    public String updateForm(@ModelAttribute("idVehicle") String idVehicle, Model model){
//        Vehicle vehicle = vehicleService.getById(idVehicle);
//        model.addAttribute("vehicleAction",vehicle);
//        return "vehicle-form";
//    }

//    @PostMapping("/update")
//    public String updateVehicle(@ModelAttribute("vehicleAction") Vehicle vehicle){
//        vehicleService.update(vehicle);
//        return "redirect:/vehicle";
//    }

    @GetMapping("/delete")
    public String deleteVehicle(@ModelAttribute("idVehicle")String idVehicle){
        Vehicle vehicle = vehicleService.getById(idVehicle);
        vehicleService.delete(vehicle);

        return "redirect:/vehicle";

    }
}
