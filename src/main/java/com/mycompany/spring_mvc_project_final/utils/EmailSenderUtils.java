package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.model.Booking;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSenderUtils {

    public static void doSendBookingInfo(Booking book, JavaMailSender mailSender , BookingDetailService bookingDetailService) {
        StringBuilder text = new StringBuilder();
        text.append("Booking Number: ").append(book.getBooking().getBookingNumber()).append("\n")
                .append("Booking Date: ").append(book.getBooking().getBookingDate()).append("\n")
                .append("Depart Route: ").append(book.getDepartFlight().getFlightRoute().getDepartureAirport().getName()).append("->")
                .append(book.getDepartFlight().getFlightRoute().getDestinationAirport().getName()).append("\n")
                .append("Depart Date: ").append(book.getDepartFlight().getDeparture()).append(" .Depart time: ").append(book.getDepartFlight().getDepartureTime()).append("\n")
                .append("Seat: ").append(book.getDepartSeatList().toString()).append("\n");
        if (book.getFlightAndSeat().ifRoundTrip()) {
            text.append("Return Route: ").append(book.getReturnFlight().getFlightRoute().getDepartureAirport().getName()).append("->")
                    .append(book.getReturnFlight().getFlightRoute().getDestinationAirport().getName()).append("\n")
                    .append("Return Date: ").append(book.getReturnFlight().getDeparture()).append(" .Return time: ").append(book.getReturnFlight().getDepartureTime()).append("\n")
                    .append("Seat: ").append(book.getReturnSeatList().toString()).append("\n");
        }
        text.append("For more Information -->").append("http://localhost:8080/Spring_MVC_Project_Final_war_exploded/booking_history?booking_number=").append(book.getBooking().getBookingNumber()).append("\n");
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(book.getBooking().getEmail());
        email.setSubject("Booking Information");
        email.setText(text.toString());
        mailSender.send(email);

        for (BookingDetailEntity bookingDetail : bookingDetailService.findByBookingNumber(book.getBooking().getBookingNumber())) {
            String text1 = "Booking Date: " + book.getBooking().getBookingDate() + "\n" +
                    "Route: " + book.getDepartFlight().getFlightRoute().getDepartureAirport().getName() + "->" +
                    book.getDepartFlight().getFlightRoute().getDestinationAirport().getName() + "\n" +
                    "Depart Date: " + book.getDepartFlight().getDeparture() + " .Depart time: " + book.getDepartFlight().getDepartureTime() + "\n" +
                    "Seat: " + book.getDepartSeatList().toString() + "\n" +
                    "For more Information -->" + "http://localhost:8080/Spring_MVC_Project_Final_war_exploded/booking_details_with_id?id=" + bookingDetail.getId() + "\n";
            email.setTo(bookingDetail.getPassengersEntity().getEmail());
            email.setSubject("Booking Information");
            email.setText(text1);
            mailSender.send(email);
        }
    }
    public static void doSendCancelInfo(JavaMailSender mailSender, BookingDetailEntity bookingDetail){
        String text = "Your booking have been cancel : " + "http://localhost:8080/Spring_MVC_Project_Final_war_exploded/booking_details_with_id?id=" +
                bookingDetail.getId();
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(bookingDetail.getPassengersEntity().getEmail());
        email.setSubject("Cancel Information");
        email.setText(text);
        mailSender.send(email);
    }
}
