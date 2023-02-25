package com.mycompany.spring_mvc_project_final.utils;

public class Add {
    public static int[] addInt(int [] series, int newInt){
        //create a new array with extra index
        int[] newSeries = new int[series.length + 1];

        //copy the integers from series to newSeries
        for (int i = 0; i < series.length; i++){
            newSeries[i] = series[i];
        }
//add the new integer to the last index
        newSeries[newSeries.length - 1] = newInt;

        return newSeries;

    }
}
