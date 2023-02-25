package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GuestController {

    @Autowired
    FlightsRoutesService flightRouteService;

    @Autowired
    AirportService airportService;

    @Autowired
    FlightService flightsService;


    @Autowired
    BookingService bookingService;

    @Autowired
    BookingDetailService bookingDetailService;

    @Autowired
    ServiceService serviceService;

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    FlightService flightService;

    @RequestMapping(value = "/booking_history", method = RequestMethod.GET)
    public String bookingList(Model model, @RequestParam(name = "booking_number") String number) {
        if (bookingService.findByBookingNumber(number).isPresent()) {
            model.addAttribute("item", bookingService.findByBookingNumber(number).get());
            return "booking_history";
        } else return "redirect:index";
    }

    @RequestMapping(value = "/booking_details", method = RequestMethod.GET)
    public String bookingDetailList(Model model, @RequestParam(name = "id") int id) {
        model.addAttribute("flightList",flightService.findFlightlistByBookingDetails(bookingService.findById(id).get(),bookingDetailService));
        model.addAttribute("listBookingDetail", bookingDetailService.findByBooking(id));
        model.addAttribute("cancelDate", LocalDateTime.now().plusDays(1));
        return "booking_details";
    }

    @RequestMapping(value = "/booking_details_with_id",method = RequestMethod.GET)
    public String bookingDetail(Model model, @RequestParam(name = "id") int id){
        if (bookingDetailService.findById(id).isPresent()){
            List<FlightsEntity> flightsEntities = new ArrayList<>();
            List<BookingDetailEntity> bookingDetailEntities = new ArrayList<>();
            flightsEntities.add(bookingDetailService.findById(id).get().getFlightsEntity());
            bookingDetailEntities.add(bookingDetailService.findById(id).get());
            model.addAttribute("flightList",flightsEntities);
            model.addAttribute("listBookingDetail", bookingDetailEntities);
            model.addAttribute("cancelDate", LocalDateTime.now().plusDays(1));
        }
        else
            model.addAttribute("message","Booking Detail Not Found");
        return "booking_details";
    }

    @RequestMapping(value = "/printInvoice",method = RequestMethod.GET)
    public String printInvoice(Model model, @RequestParam(name="number")String booking_number){
        if (bookingService.findByBookingNumber(booking_number).isPresent()) {
            model.addAttribute("listBookingDetail",bookingDetailService.findByBookingNumber(booking_number));
            model.addAttribute("booking", bookingService.findByBookingNumber(booking_number).get());
            return "invoice";
        }
        else
            return "redirect:/booking_history"+booking_number;
    }
}
