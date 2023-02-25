package com.mycompany.spring_mvc_project_final.utils;

import org.springframework.context.annotation.Bean;

public class SeatUtilis {
    public static String getCharForNumber(int i) {
        return i > 0 && i < 27 ? String.valueOf((char)(i + 'A' - 1)) : null;
    }
}
