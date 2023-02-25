package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.model.Booking;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PromotionUtils {

    public static void saveById(String[] string, FlightsEntity flightsEntity,PromotionService promotionService){
        for(String s: string){
            if(Integer.parseInt(s)!=0)
            flightsEntity.getPromotionEntities().add(promotionService.findById(Integer.parseInt(s)).get());
        }
    }

}
