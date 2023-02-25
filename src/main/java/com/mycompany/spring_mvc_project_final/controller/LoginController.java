package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.enums.GenderEnum;
import com.mycompany.spring_mvc_project_final.service.*;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LoginController {

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

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles)) {
            if (roles.contains("ROLE_ADMIN"))
                return "redirect:/admin/home";
            else if (roles.contains("ROLE_MANAGER"))
                return "redirect:/manager/home";
        }
        return "redirect:index";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        model.addAttribute("genderList", GenderEnum.values());
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

    @RequestMapping("/forgot_password")
    public String forgotPassword(Model model){
        model.addAttribute("genderList", GenderEnum.values());
        return "forgot_password";
    }
}
