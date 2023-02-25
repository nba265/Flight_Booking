package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;

import java.util.Collection;
import java.util.Set;

public class CompareUtilis {
    public static boolean contains(Collection<?> coll, Object o) {
        Set<PromotionEntity> promotionEntities= (Set<PromotionEntity>) coll;
        PromotionEntity compare=(PromotionEntity) o;
        if (coll == null) return false;
        for (PromotionEntity p: promotionEntities){
            if(p.getId()==compare.getId()){
                return true;
            }

        }
        return false;
        //System.out.println(promotionEntities.contains(compare));
        //return promotionEntities.contains(compare);
    }
}
