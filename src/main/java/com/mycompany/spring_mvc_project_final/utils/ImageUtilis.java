package com.mycompany.spring_mvc_project_final.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

public class ImageUtilis {
    public static void uploadImage(String pathUrl, String name,byte[] bytes) throws Exception{
        System.out.println(pathUrl);
        int index = pathUrl.indexOf("target");
        String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
        Path path = Paths.get(pathUrl+  File.separator + name);
        Path path1 = Paths.get(pathFolder + name);
        Files.write(path, bytes);
        Files.write(path1, bytes);
    }
    public static void deleteImage(String pathUrl, String name) throws Exception{
        int index = pathUrl.indexOf("target");
        String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
        Path path = Paths.get(pathUrl+ File.separator+ name);
        Path path1 = Paths.get(pathFolder + name);
        Files.delete(path);
        Files.delete(path1);
    }

}
