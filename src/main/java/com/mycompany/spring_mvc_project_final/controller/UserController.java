/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.GenderEnum;
import com.mycompany.spring_mvc_project_final.model.NewPassword;
import com.mycompany.spring_mvc_project_final.model.StartDateEndDate;
import com.mycompany.spring_mvc_project_final.service.*;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import com.mycompany.spring_mvc_project_final.utils.UserUtilis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/user")
public class UserController {

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

    @Autowired
    CreditCardService creditCardService;

    @RequestMapping("/home")
    public String viewHome(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }

        model.addAttribute("message", "Hello User: " + username);
        return "user/home";
    }

    @RequestMapping(value = "/booking_history", method = RequestMethod.GET)
    public String bookingList(Model model, @Valid @ModelAttribute(name = "searchDate") StartDateEndDate startDateEndDate) {
        UserEntity user = userDetailsService.findByEmail(SecurityUtils.getUsername());
        model.addAttribute("listBooking", bookingService.findByBookingDateBetweenAndUserEntity_Id(startDateEndDate.getStartDate(), startDateEndDate.getEndDate(), user.getId()));
        return "user/booking_history";
    }

    @RequestMapping(value = "/booking_details", method = RequestMethod.GET)
    public String bookingDetailList(Model model, @RequestParam(name = "id") int id) {
        model.addAttribute("flightList",flightService.findFlightlistByBookingDetails(bookingService.findById(id).get(),bookingDetailService));
        model.addAttribute("listBookingDetail", bookingDetailService.findByBooking(id));
        model.addAttribute("cancelDate",LocalDateTime.now().plusDays(1));
        return "user/booking_details";
    }

    @RequestMapping( value = "/profile",method = RequestMethod.GET)
    public String profile(Model model) {
        model.addAttribute("user",userDetailsService.findByEmail(SecurityUtils.getUsername()));
        model.addAttribute("genderList", GenderEnum.values());
        return "user/profile";
    }

    @RequestMapping( value = "/editProfile",method = RequestMethod.GET)
    public String editProfile(Model model,@ModelAttribute(name="user")UserEntity user) {
        UserUtilis.editProfile(user, userDetailsService);
        return "redirect:/user/profile";
    }

    @RequestMapping( value = "/changePassword",method = RequestMethod.POST)
    public String changePassword(Model model,@Valid @ModelAttribute(name = "newPassword") NewPassword newPassword) {

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        UserEntity userEntity= userDetailsService.findByEmail(newPassword.getEmail());

        if(bCryptPasswordEncoder.matches(newPassword.getOldPassword(),userEntity.getPassword())){
            userEntity.setPassword(bCryptPasswordEncoder.encode(newPassword.getNewPassword()));
        }
        else {
            model.addAttribute("message","Wrong pass!!!");
        }
        userDetailsService.save(userEntity);
       /* model.addAttribute("user",userEntity );
        model.addAttribute("genderList",genderService.findAll());*/
        return "redirect:/user/profile";
    }

    @RequestMapping(value = "/printInvoice",method = RequestMethod.GET)
    public String printInvoice(Model model,@RequestParam(name="number")String booking_number){
        if (bookingService.findByBookingNumber(booking_number).isPresent()) {
            model.addAttribute("listBookingDetail",bookingDetailService.findByBookingNumber(booking_number));
            model.addAttribute("booking", bookingService.findByBookingNumber(booking_number).get());
            return "invoice";
        }
        else
            return "redirect:/user/booking_history";
    }
}
