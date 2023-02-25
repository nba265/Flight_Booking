package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class PromotionService {
    @Autowired
    PromotionRepository promotionRepository;

    public Iterable<PromotionEntity> findAll(){
        return promotionRepository.findAll();
    }
    public void save(PromotionEntity promotionEntity){
        if(promotionEntity.getCreateDate()==null){
            promotionEntity.setCreateDate(LocalDate.now());
        }

       promotionRepository.save(promotionEntity);
    }
    public Optional<PromotionEntity> findById(int id){
        return promotionRepository.findById(id);
    }
    public Optional<PromotionEntity> findByCode(String code){
        return promotionRepository.findByCode(code);
    }
    public void deleteById(int id){
        promotionRepository.deleteById(id);
    }
}
