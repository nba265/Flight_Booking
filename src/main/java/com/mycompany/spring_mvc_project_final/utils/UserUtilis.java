package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.model.NewPassword;
import com.mycompany.spring_mvc_project_final.service.UserDetailsServiceImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

public class UserUtilis {
    public static UserEntity editProfile(@ModelAttribute(name = "user") UserEntity user, UserDetailsServiceImpl userDetailsService) {
        UserEntity userEntity= userDetailsService.findByEmail(user.getEmail());
        userEntity.setGenderEnum(user.getGenderEnum());
        userEntity.setPhoneNumber(user.getPhoneNumber());
        userEntity.setFullName(user.getFullName());
        userEntity.setBirthday(user.getBirthday());
        userEntity.setAddress(user.getAddress());
        return userEntity;
    }
    public static UserEntity changePassword(UserEntity userEntity, NewPassword newPassword){
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        if(bCryptPasswordEncoder.matches(newPassword.getOldPassword(),userEntity.getPassword())){
            userEntity.setPassword(bCryptPasswordEncoder.encode(newPassword.getNewPassword()));
        }
        return userEntity;
    }
}
