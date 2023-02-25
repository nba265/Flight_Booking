package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.GenderEnum;
import com.mycompany.spring_mvc_project_final.model.Booking;
import com.mycompany.spring_mvc_project_final.model.FlightAndSeat;
import com.mycompany.spring_mvc_project_final.service.*;
import com.mycompany.spring_mvc_project_final.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Optional;

@Controller
@Scope("session")
public class BookingController {

    @Autowired
    BookingService bookingService;

    @Autowired
    Booking booking;

    @Autowired
    FlightService flightsService;

    @Autowired
    SeatService seatsService;

    @Autowired
    ServiceService serviceService;


    @Autowired
    FeeService feeService;

    @Autowired
    CreditCardService creditCardService;

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    BookingDetailService bookingDetailService;

    @Autowired
    AircraftSeatService aircraftSeatService;

    @Autowired
    PromotionService promotionService;

    @RequestMapping(value = "/booking", method = RequestMethod.GET)
    public String booking(Model model, @ModelAttribute(name = "flightAndSeat") FlightAndSeat flightAndSeat) {
        booking.setBooking(new BookingEntity());
        if (booking.getBooking().getBookingDetailEntity() == null) {
            booking.getBooking().setBookingDetailEntity(new ArrayList<>());
        }
        if (booking.getDepartSeatList() == null) {
            booking.setDepartSeatList(new ArrayList<>());
        }
        if (booking.getBooking().getPaymentEntity() == null) {
            booking.getBooking().setPaymentEntity(new PaymentEntity());
        }
        if (booking.getCreditCardEntity() == null) {
            booking.setCreditCardEntity(new CreditCardEntity());
        }
        if (booking.getPassengersEntityList() == null){
            booking.setPassengersEntityList(new ArrayList<>());
        }
        booking.setFlightAndSeat(flightAndSeat);
        if (SecurityUtils.checkIfLogin()) {
            UserEntity user = userDetailsService.findByEmail(SecurityUtils.getUsername());
            booking.addBookingInfoIfLogin(user);
            booking.getBooking().setUserEntity(user);
        }
        booking.addBookingDetail();
        FlightsEntity departFlight = flightsService.findById(flightAndSeat.getDepartFlightId()).get();
        booking.setDepartFlight(departFlight);
        if (!flightAndSeat.ifRoundTrip()) {
            model.addAttribute("roundTrip", false);
        } else {
            if (booking.getReturnSeatList() == null) {
                booking.setReturnSeatList(new ArrayList<>());
            }
            FlightsEntity returnFlight = flightsService.findById(flightAndSeat.getReturnFlightId()).get();
            booking.setReturnFlight(returnFlight);
            model.addAttribute("roundTrip", true);
        }
        model.addAttribute("booking", booking);
        model.addAttribute("check", "depart");
        return "seat_booking";
    }

    @RequestMapping(value = "/returnSeatBooking", method = RequestMethod.GET)
    public String returnSeatBooking(Model model) {
        model.addAttribute("booking", booking);
        model.addAttribute("check", "return");
        return "seat_booking";
    }


    @RequestMapping(value = "/seat_booking", method = RequestMethod.GET)
    public String seatBooking(Model model) {
        model.addAttribute("check", "depart");
        return "seat_booking";
    }

    @RequestMapping(value = "/checkSeat", method = RequestMethod.GET)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public int checkSeat(@RequestParam(name = "seatNumber") String seatNumber, @RequestParam(name = "flightId") String flightId, Model model, HttpSession session) {
        System.out.println("check: " + seatNumber);
        try {
            if (booking.checkSeat(seatNumber, flightId,aircraftSeatService)) {
                session.setAttribute("booking", booking);
                return 1;
            } else return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @RequestMapping(value = "/uncheckSeat", method = RequestMethod.GET)
    @ResponseBody
    @Transactional(rollbackFor = Exception.class)
    public boolean uncheckSeat(Model model, @RequestParam(name = "seatNumber") String seatNumber, @RequestParam(name = "flightId") String flightId, HttpSession session) {
        System.out.println("uncheck:" + seatNumber);
        try {
            booking.uncheckSeat(seatNumber, flightId,aircraftSeatService);
            session.setAttribute("booking", booking);
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/passenger", method = RequestMethod.GET)
    public String passenger(Model model) {
        model.addAttribute("book", booking);
        model.addAttribute("genderList", GenderEnum.values());
        return "passenger";
    }

    @RequestMapping(value = "/savePassenger", method = RequestMethod.POST)
    public String savePassenger(Model model, @Valid @ModelAttribute(name = "book") Booking book) {
        booking.setPassengersEntityList(book.getPassengersEntityList());
        booking.addBookingInfo(book.getBooking());
        booking.addInfoBookingDetail(seatsService);
        booking.addToAircraftsSeatsList(aircraftSeatService);
        model.addAttribute("booking", booking);
        model.addAttribute("serviceList", serviceService.findAll());
        model.addAttribute("check", "depart");
        model.addAttribute("total", ServiceUtilis.totalPriceService(booking.getBooking()));
        return "service_booking";
    }

    @RequestMapping(value = "/service_booking", method = RequestMethod.GET)
    public String serviceBooking(Model model) {
        model.addAttribute("serviceList", serviceService.findAll());
        model.addAttribute("check", "depart");
        model.addAttribute("total", ServiceUtilis.totalPriceService(booking.getBooking()));
        return "service_booking";
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String doAddServiceBooking(Model model) throws Exception {
        double allPrice =  BookingUtilis.allPrice(booking.getBooking(),feeService,aircraftSeatService);
        booking.getBooking().getPaymentEntity().setAmount(allPrice);
        model.addAttribute("fee", feeService.findAll());
        model.addAttribute("ticketPrice",BookingUtilis.totalTicketPrice(booking.getBooking()));
        model.addAttribute("ticketAndSeatPrice", BookingUtilis.totalTicketAndSeat(booking.getBooking(),aircraftSeatService));
        model.addAttribute("allPrice", BookingUtilis.allPrice(booking.getBooking(),feeService,aircraftSeatService));
        model.addAttribute("departSeat", booking.getDepartAircraftSeatsList().get(0));
        model.addAttribute("servicePrice", ServiceUtilis.totalPriceService(booking.getBooking()));
        if (booking.getFlightAndSeat().ifRoundTrip())
            model.addAttribute("returnSeat", booking.getReturnAircraftSeatsList().get(0));
        model.addAttribute("credit-card", booking.getCreditCardEntity());
        return "payment";
    }

    @RequestMapping(value = "/changeItemServiceQuantity", method = RequestMethod.GET)
    @ResponseBody
    public double changeItemServiceQuantity(Model model, @RequestParam(name = "seat_id") String seat_id,
                                            @RequestParam(name = "flightId") String flightId,
                                            @RequestParam(name = "serviceId") String serviceId,
                                            @RequestParam(name = "quantity") String quantity, HttpSession session) {
        booking.changeItemServiceQuantity(serviceId, quantity, flightId, seat_id,serviceService);
        return ServiceUtilis.totalPriceService(booking.getBooking());
    }

    @RequestMapping(value = "/returnServiceBooking", method = RequestMethod.GET)
    public String returnServiceBooking(Model model) {
        model.addAttribute("serviceList", serviceService.findAll());
        model.addAttribute("check", "return");
        return "service_booking";
    }

    @RequestMapping(value = "/addPromotion", method = RequestMethod.GET)
    @ResponseBody
    public String addPromotion(Model model, @RequestParam(name = "code") String code) throws Exception {
        if (booking.checkPromotion(code,promotionService)) {
            double allPrice = BookingUtilis.allPrice(booking.getBooking(),feeService,aircraftSeatService);
            booking.getBooking().getPaymentEntity().setAmount(allPrice);
            model.addAttribute("ticketAndSeatPrice", BookingUtilis.totalTicketAndSeat(booking.getBooking(),aircraftSeatService));
            model.addAttribute("allPrice", allPrice );
            return "Success!!";
        } else return "Wrong Code!!";
    }

    @RequestMapping(value = "/checkPayment", method = RequestMethod.GET)
    public String addPayment(Model model, @ModelAttribute(name = "credit-card") CreditCardEntity creditCard,HttpSession session) {
        System.out.println(creditCard.toString());
        int result = booking.checkCreditCard(creditCard,creditCardService);
        if (result == 1) {
            booking.endOfBooking(aircraftSeatService,bookingService,creditCardService);
        //    EmailSenderUtils.doSendBookingInfo(booking, mailSender, bookingDetailService);
            booking = new Booking();
            session.invalidate();
            return "done";
        } else if (result == 0) {
            booking.setMessage("Not enough balance!!");
        } else {
            booking.setMessage("Wrong credit-card information!!");
        }
        booking.setCreditCardEntity(creditCard);
        return "redirect:payment";
    }

    @RequestMapping(value = "cancel_booking", method = RequestMethod.GET)
    @Transactional(rollbackFor = Exception.class)
    public String cancelBooking(Model model, @RequestParam(name = "id") int id, @RequestParam(name = "number") String bookingNumber) {
        Optional<BookingDetailEntity> bookingDetail = bookingDetailService.findById(id);
        try {
            if (bookingDetail.isPresent()) {
                if (bookingDetail.get().getBookingEntity().getBookingNumber().equals(bookingNumber)) {
                    LocalDateTime dateTime = LocalDateTime.now().plusDays(1);
                    if (dateTime.isBefore(bookingDetail.get().getFlightsEntity().getDeparture().
                            atTime(bookingDetail.get().getFlightsEntity().getDepartureTime()))) {
                        BookingDetailUtilis.cancelBooking(bookingDetail.get(), bookingDetailService, aircraftSeatService);
               //         EmailSenderUtils.doSendCancelInfo(mailSender,bookingDetail.get());
                    }
                    if (SecurityUtils.checkIfLogin())
                        return "redirect:/user/booking_details?id=" + bookingDetail.get().getBookingEntity().getId();
                    return "redirect:/booking_details_with_id?id=" + bookingDetail.get().getId();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/index";
    }

}
