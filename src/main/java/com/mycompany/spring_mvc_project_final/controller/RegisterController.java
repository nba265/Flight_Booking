package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.GenderEnum;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.service.UserDetailsServiceImpl;
import com.mycompany.spring_mvc_project_final.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.time.LocalDate;
import java.util.HashSet;

@Controller
public class RegisterController {

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    UserRoleService userRoleService;

    @RequestMapping(value = "/doRegister",method = RequestMethod.GET)
    public String doRegister(Model model, @ModelAttribute(name="user") UserEntity user){
        if (userDetailsService.findByEmail(user.getEmail()) != null){
            model.addAttribute("emailError",true);
            model.addAttribute("user",user);
            System.out.println("has email");
        }
        else {
            System.out.println("don't has");
            user.setStatus(UserStatus.ACTIVE);
            user.setCreateDate(LocalDate.now());
    /*        UserRoleEntity userRole =  userDetailsService.findById(3).get();
            userRole.setRole(Role.ROLE_USER);
            userRole.setUsers(new HashSet<>());
            userRole.getUsers().add(user);*/
            user.setUserRoles(new HashSet<>());
            user.getUserRoles().add(userRoleService.findById(3).get());
            userDetailsService.saveUser(user);
        }
        model.addAttribute("genderList", GenderEnum.values());
        return "login";
    }

}
