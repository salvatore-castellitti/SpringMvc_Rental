package com.project.StageRentalCarSpringMVC.controller;

import com.mysql.cj.jdbc.SuspendableXAConnection;
import com.project.StageRentalCarSpringMVC.model.Reservation;
import com.project.StageRentalCarSpringMVC.model.User;
import com.project.StageRentalCarSpringMVC.model.Vehicle;
import com.project.StageRentalCarSpringMVC.service.ReservationService;
import com.project.StageRentalCarSpringMVC.service.UserService;
import com.project.StageRentalCarSpringMVC.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.StreamSupport;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

    @Autowired
    private UserService userService;

    @Autowired
    private VehicleService vehicleService;

     @Autowired
     private ReservationService reservationService;

    @GetMapping
    public String ReservationList (Model model, Principal principal,
                                   @ModelAttribute("error")String error){
        String userName = principal.getName();
        User user = userService.getByUsername(userName);
        List<Reservation> reservList;
        if(user.getRole().equalsIgnoreCase("ADMIN")){
            reservList = reservationService.getAll();
        }else{
            reservList = reservationService.getAllById(user);

        }

        model.addAttribute("listReserv",reservList);
        return "reservation-list";
    }

    @GetMapping(value = "/add")
    public String addReservation(@ModelAttribute("startDate")String sDate,
                                 @ModelAttribute("endDate")String eDate,
                                 @ModelAttribute("controller")String controller,
                                 Model model) throws ParseException {
        Reservation reservation = new Reservation();
        if(controller.equalsIgnoreCase("DateChosen")){
            if (checkValidityDate(sDate,eDate)){
//                model.addAttribute("startDate",sDate);
//                model.addAttribute("endDate",eDate);

                Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
                Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
                List<Vehicle> reservFree = vehicleService.getFreeVehicle(startDate, endDate);

                reservation.setStartDate(startDate);
                reservation.setEndDate(endDate);
                model.addAttribute("VEHICLE_LIST",reservFree);
            }else{
                model.addAttribute("controller","DateError");
                model.addAttribute("error","Invalid date, choose a valid date ");
            }
        }
        System.out.println(reservation.getStartDate());
        model.addAttribute("reservModel",reservation);
        return "reservation-form";
    }

    private boolean checkValidityDate(String sDate, String eDate) throws ParseException {
        boolean flag = true;
        Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
        Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
        if (startDate.after(endDate) || startDate.before(new Date())){
            flag = false;
        }

        return flag;

    }

    @RequestMapping (value = "/addDbReserv", method = RequestMethod.POST)
    public String addDbReserv(@ModelAttribute("Reservation")@Valid Reservation reservModel, BindingResult bindingResult) throws ParseException {

            System.out.println("AAAAAAAAAAAAAAAAAAAAAAA");
        for( FieldError fieldError : bindingResult.getFieldErrors() )
            System.out.println(fieldError.getField() +" : "+fieldError.getDefaultMessage());
//        User user = userService.getByUsername(principal.getName());
//        Vehicle vehicle = vehicleService.getById(vehicleId);
//        boolean bool = Boolean.parseBoolean(isConfirmed);
//        Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
//        Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
//
//        System.out.println(eDate);

//        reservation.setConfirmed(bool);
//        reservation.setUser(user);
//        reservation.setVehicle(vehicle);

//        reservationService.save(reservation);


//        System.out.println(reservation.getStartDate());
//        System.out.println(reservation.getEndDate());
//        System.out.println(reservation.getVehicle());

        return "redirect:/reservation";
    }

    @GetMapping("/delete")
    public String deleteREserv(@ModelAttribute ("idReserv") String idReserv,
                               Principal principal,
                               Model model){

        int id = Integer.parseInt(idReserv);
        Reservation reservation = reservationService.getById(idReserv);
        String userName = principal.getName();
        User user = userService.getByUsername(userName);

        if (user.getRole().equalsIgnoreCase("CUSTOMER")){
            Calendar today = Calendar.getInstance();
            Calendar start = Calendar.getInstance();
            Date date = new Date();
            today.setTime(date);
            today.add(Calendar.DATE,2);
            start.setTime(reservation.getStartDate());
            if (today.getTime().compareTo(start.getTime())>=0) {
                model.addAttribute("error", "Can't delete this reservation");
                return "redirect:/reservation";
            }
        }

        reservationService.deleteById(id);
        return "redirect:/reservation";
    }

    @GetMapping(value = {"/approve"})
    public String updateReserv(@ModelAttribute ("idReserv") String idReserv,
                               @ModelAttribute ("confirmFlag") String flag){

        Reservation reservation = reservationService.getById(idReserv);
        if(flag!=null || !flag.equals("")){
            reservation.setConfirmed(true);
        }else{
            return "reservation-form";
        }

        reservationService.update(reservation);
        return "redirect:/reservation";
    }

}
