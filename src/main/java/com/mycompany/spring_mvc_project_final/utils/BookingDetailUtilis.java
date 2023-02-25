package com.mycompany.spring_mvc_project_final.utils;


import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.FeeService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;

import java.util.List;

public class BookingDetailUtilis {
    public static void changeService(BookingDetailEntity bookingDetailEntity, List<ServiceBookingEntity> serviceBookingEntities, ServiceService serviceService) {
        serviceBookingEntities.removeIf((temp) -> (temp.getQuantity() == 0));
        for (ServiceBookingEntity serviceBookingEntity : serviceBookingEntities) {
            serviceBookingEntity.setBookingDetailEntity(bookingDetailEntity);
            serviceBookingEntity.setServiceEntity(serviceService.findById(serviceBookingEntity.getServiceEntity().getId()).get());
        }
        bookingDetailEntity.setServiceBookingEntities(serviceBookingEntities);
    }

    public static void changeStatus(BookingDetailEntity bookingDetailEntity, String status) {
        bookingDetailEntity.setBookingStatusEnum(BookingStatusEnum.valueOf(status));
    }

    public static BookingDetailEntity changeUnitPrice(BookingDetailEntity bookingDetailEntity,double startPrice, double laterPrice){
        double unitPrice= bookingDetailEntity.getUnitPrice();
        unitPrice= unitPrice-startPrice+laterPrice;
        bookingDetailEntity.setUnitPrice(unitPrice);
        return bookingDetailEntity;
    }

    //------------------------------------------------------------------------------------------------

    public static void cancelBooking(BookingDetailEntity bookingDetail, BookingDetailService bookingDetailService, AircraftSeatService aircraftSeatService) {
        PaymentEntity paymentEntity = bookingDetail.getBookingEntity().getPaymentEntity();
        CreditCardEntity cardEntity = paymentEntity.getCreditCardEntity();
        double amount = paymentEntity.getAmount();
        double balance = cardEntity.getBalance();
        double unitPrice = bookingDetail.getUnitPrice();
        int luggage = bookingDetail.getBookingEntity().getLuggage() - ConstantUtilis.default_luggage;
        bookingDetail.getBookingEntity().getPaymentEntity().getCreditCardEntity().setBalance(balance + unitPrice);
        bookingDetail.getBookingEntity().getPaymentEntity().setAmount(amount - unitPrice);
        if (!bookingDetail.getServiceBookingEntities().isEmpty()) {
            for (ServiceBookingEntity temp : bookingDetail.getServiceBookingEntities()) {
                if (temp.getServiceEntity().getId() == 1) {
                    bookingDetail.getBookingEntity().setLuggage(luggage - ConstantUtilis.extra_luggage * temp.getQuantity());
                    break;
                }
            }
        }
        changeStatus(bookingDetail, "CANCEL");
        aircraftSeatService.findByFlight_IdAndSeat_Number(bookingDetail.getFlightsEntity().getId(), bookingDetail.getSeatsEntity().getNumber()).get().setSeatsStatus(SeatStatusEnum.AVAILABLE);
        bookingDetailService.save(bookingDetail);
        /* creditCardService.save(cardEntity);*/
    }


    public static double otherFee(FeeService feeService) {
        double total = 0;
        for (FeeAndCarrierChargesEntity fee : feeService.findAll()) {
            if (!fee.getName().equals("tax"))
                total += fee.getPrice();
        }
        return total;
    }

    public static void unitPriceForBookingDetail(BookingDetailEntity bookingDetail, FeeService feeService,AircraftSeatService aircraftSeatService) throws Exception {
        double total = 0;
        total = bookingDetail.getFlightsEntity().getFlightRoute().getStandardPrice()
                * (1 + (feeService.findByName("tax").get().getPrice() - bookingDetail.getDiscount()) / (double) 100)
                + ServiceUtilis.priceService(bookingDetail) + aircraftSeatService.findByFlight_IdAndSeat_Number(bookingDetail.getFlightsEntity().getId(),bookingDetail.getSeatsEntity().getNumber()).get().getPrice() + otherFee(feeService);
        bookingDetail.setUnitPrice(total);
    }
}
