package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;

public class ServiceUtilis {
    public static double priceService(BookingDetailEntity bookingDetailEntity){
        double total=0;
        if(bookingDetailEntity.getServiceBookingEntities() !=null){
            for(ServiceBookingEntity serviceBooking: bookingDetailEntity.getServiceBookingEntities()){
                total +=serviceBooking.getQuantity() * serviceBooking.getServiceEntity().getPrice();
            }
        }
        return total;
    }

    public static double totalPriceService(BookingEntity booking) {
        double total = 0;
        for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()) {
            if (bookingDetail.getServiceBookingEntities() != null) {
                for (ServiceBookingEntity serviceBooking : bookingDetail.getServiceBookingEntities()) {
                    total = total + serviceBooking.getServiceEntity().getPrice() * serviceBooking.getQuantity();
                }
            }
        }
        return total;
    }

}
