package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.service.*;

import java.util.List;

public class BookingUtilis {
    public static BookingEntity amountPayment(BookingEntity bookingEntity, BookingService bookingService, CreditCardService creditCardService, double startPrice, double laterPrice){
        double amountPayment= bookingEntity.getPaymentEntity().getAmount();
        double amount= amountPayment- startPrice;
        double amount2= amount +laterPrice;
        double diff= amountPayment-amount2;
        CreditCardEntity creditCardEntity= bookingEntity.getPaymentEntity().getCreditCardEntity();
        bookingEntity.getPaymentEntity().setCreditCardEntity(CreditCardUtilis.changeAmount(creditCardEntity,creditCardService,diff));
        bookingEntity.getPaymentEntity().setAmount(amount2);
        return bookingEntity;
    }
    public static long orders(BookingService bookingService){
        List<BookingEntity> bookingEntityList= (List<BookingEntity>) bookingService.findAll(null, null);
        return bookingEntityList.size();
    }
    public static double total(PaymentService paymentService){
        return paymentService.total();
    }



    //--------------------------------------------------------------------------

    public static double totalTicketPrice(BookingEntity booking) {
        double total = 0;
        for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()) {
            total += bookingDetail.getFlightsEntity().getFlightRoute().getStandardPrice() * (1 - bookingDetail.getDiscount() / (double) 100);
        }
        return total;
    }

    public static double totalSeatPrice(BookingEntity booking, AircraftSeatService aircraftSeatService) {
        double total = 0;
        for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()){
            total += aircraftSeatService.findByFlight_IdAndSeat_Number(bookingDetail.getFlightsEntity().getId(),bookingDetail.getSeatsEntity().getNumber()).get().getPrice();
        }
        return total;
    }

    public static double totalTicketAndSeat(BookingEntity booking,AircraftSeatService aircraftSeatService) {
        double total = 0;
        total = (totalTicketPrice(booking) + totalSeatPrice(booking,aircraftSeatService));
        return total;
    }

    public static double allPrice(BookingEntity booking, FeeService feeService, AircraftSeatService aircraftSeatService) throws Exception {
        double total = 0;
        int size = booking.getBookingDetailEntity().size();
        for (int i = 0; i < booking.getBookingDetailEntity().size(); i++) {
            BookingDetailUtilis.unitPriceForBookingDetail(booking.getBookingDetailEntity().get(i), feeService,aircraftSeatService);
            total = total + booking.getBookingDetailEntity().get(i).getUnitPrice();
        }
        return total;
    }
}