package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftsEntity;
import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ImageRepository;
import com.mycompany.spring_mvc_project_final.utils.ImageUtilis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class ImageService {

    @Autowired
    ImageRepository imageRepository;
    @Transactional(rollbackFor = Exception.class)
    public List<ImageEntity> uploadImage(MultipartFile[] files, HttpServletRequest request, AirportsEntity airportsEntity, ServiceEntity serviceEntity) {
        List<ImageEntity> images = new ArrayList<>();
        for (MultipartFile file : files) {
            try {
                byte[] bytes = file.getBytes();
                ServletContext context = request.getServletContext();
                /*String pathUrl = context.getRealPath("/images");*/
                // get file name
                String name = file.getOriginalFilename();



                //new name with date and time
                if (name == null) {
                    name = "new-image";
                }
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH-mm");
                name=(LocalDateTime.now().format(formatter).toString()+"-"+name).replace(" ","-");


                //upload
                ImageUtilis.uploadImage(context.getRealPath("resources/images"), name, bytes);


                //create new Image entity and add into list
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setAirport(airportsEntity);
                image.setService(serviceEntity);
                images.add(image);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return images;
    }
    public Iterable<ImageEntity> findByService(ServiceEntity serviceEntity){
        return imageRepository.findByService(serviceEntity);
    }

    public Optional<ImageEntity> findById(int id) {
        return imageRepository.findById(id);
    }

    public void delete(int id) {
        imageRepository.deleteById(id);
    }

    public void deleteImage(int id, HttpServletRequest request) {
        Optional<ImageEntity> image =findById(id);
        try {
            ServletContext context = request.getServletContext();
            delete(id);
            //delete
            ImageUtilis.deleteImage(context.getRealPath("resources/images"), image.get().getName());

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
