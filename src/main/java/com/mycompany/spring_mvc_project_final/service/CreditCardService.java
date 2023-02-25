package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.repository.CreditCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class CreditCardService {
    @Autowired
    CreditCardRepository creditCardRepository;

    public Iterable<CreditCardEntity> findAll(){
        return creditCardRepository.findAll();
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(CreditCardEntity creditCardEntity){
        try {
            creditCardRepository.save(creditCardEntity);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public Optional<CreditCardEntity> findById(int id){
        return creditCardRepository.findById(id);
    }
}
