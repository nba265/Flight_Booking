package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends CrudRepository<ImageEntity,Integer> {
    Iterable<ImageEntity> findByService(ServiceEntity serviceEntity);

    @Modifying
    @Query(value = "delete from ImageEntity i where i.id=?1")
    void deleteById(int id);
}
