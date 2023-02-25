package com.mycompany.spring_mvc_project_final.model;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.service.*;
import com.mycompany.spring_mvc_project_final.utils.AircraftSeatUtils;
import com.mycompany.spring_mvc_project_final.utils.ConstantUtilis;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
@Scope("session")
public class Booking {


    private BookingEntity booking;

    private List<PassengersEntity> passengersEntityList;

    private FlightsEntity departFlight;

    private FlightsEntity returnFlight;

    private List<String> departSeatList;

    private List<String> returnSeatList;

    private List<AircraftSeatsEntity> departAircraftSeatsList;

    private List<AircraftSeatsEntity> returnAircraftSeatsList;

    private FlightAndSeat flightAndSeat;

    private PromotionEntity promotion;

    private CreditCardEntity creditCardEntity;

    private String message;

    private UserEntity bookingInfo;

    public Booking() {
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public FlightAndSeat getFlightAndSeat() {
        return flightAndSeat;
    }

    public void setFlightAndSeat(FlightAndSeat flightAndSeat) {
        this.flightAndSeat = flightAndSeat;
    }

    public FlightsEntity getDepartFlight() {
        return departFlight;
    }

    public void setDepartFlight(FlightsEntity departFlight) {
        this.departFlight = departFlight;
    }

    public FlightsEntity getReturnFlight() {
        return returnFlight;
    }

    public void setReturnFlight(FlightsEntity returnFlight) {
        this.returnFlight = returnFlight;
    }


    public List<String> getDepartSeatList() {
        return departSeatList;
    }

    public void setDepartSeatList(List<String> departSeatList) {
        this.departSeatList = departSeatList;
    }

    public List<String> getReturnSeatList() {
        return returnSeatList;
    }

    public void setReturnSeatList(List<String> returnSeatList) {
        this.returnSeatList = returnSeatList;
    }

    public List<AircraftSeatsEntity> getDepartAircraftSeatsList() {
        return departAircraftSeatsList;
    }

    public void setDepartAircraftSeatsList(List<AircraftSeatsEntity> departAircraftSeatsList) {
        this.departAircraftSeatsList = departAircraftSeatsList;
    }

    public List<AircraftSeatsEntity> getReturnAircraftSeatsList() {
        return returnAircraftSeatsList;
    }

    public void setReturnAircraftSeatsList(List<AircraftSeatsEntity> returnAircraftSeatsList) {
        this.returnAircraftSeatsList = returnAircraftSeatsList;
    }

    public List<PassengersEntity> getPassengersEntityList() {
        return passengersEntityList;
    }

    public void setPassengersEntityList(List<PassengersEntity> passengersEntityList) {
        this.passengersEntityList = passengersEntityList;
    }

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }


    public CreditCardEntity getCreditCardEntity() {
        return creditCardEntity;
    }

    public void setCreditCardEntity(CreditCardEntity creditCardEntity) {
        this.creditCardEntity = creditCardEntity;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void addBookingInfoIfLogin(UserEntity user) {
        booking.setGenderEnum(user.getGenderEnum());
        booking.setAddress(user.getAddress());
        booking.setBirthday(user.getBirthday());
        booking.setEmail(user.getEmail());
        booking.setFullName(user.getFullName());
        booking.setPhoneNumber(user.getPhoneNumber());
    }

    public void addBookingInfo(BookingEntity booking1) {
        booking.setGenderEnum(booking1.getGenderEnum());
        booking.setAddress(booking1.getAddress());
        booking.setBirthday(booking1.getBirthday());
        booking.setEmail(booking1.getEmail());
        booking.setFullName(booking1.getFullName());
        booking.setPhoneNumber(booking1.getPhoneNumber());
    }

    public void addBookingDetail() {
        int size = flightAndSeat.getQuantity();
        if (flightAndSeat.ifRoundTrip()) {
            size = size * 2;
        }
        for (int i = 0; i < size; i++) {
            booking.getBookingDetailEntity().add(new BookingDetailEntity());
        }
    }

    public void uncheckSeat(String seat, String flightId, AircraftSeatService aircraftSeatService) {
        if (Integer.parseInt(flightId) == flightAndSeat.getDepartFlightId()) {
            departSeatList.remove(seat);
        } else {
            returnSeatList.remove(seat);
        }
        AircraftSeatsEntity aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(Integer.parseInt(flightId), seat).get();
        AircraftSeatUtils.setStatusForSeat(aircraftSeats, SeatStatusEnum.AVAILABLE, aircraftSeatService);
    }

    public boolean checkSeat(String seat, String flightId, AircraftSeatService aircraftSeatService) {
        if (AircraftSeatUtils.checkIfSeatAvailable(seat, Integer.parseInt(flightId), aircraftSeatService)) {
            if (Integer.parseInt(flightId) == flightAndSeat.getDepartFlightId()) {
                departSeatList.add(seat);
            } else {
                returnSeatList.add(seat);
            }
            AircraftSeatsEntity aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(Integer.parseInt(flightId), seat).get();
            AircraftSeatUtils.setStatusForSeat(aircraftSeats, SeatStatusEnum.PROCESSING, aircraftSeatService);
            return true;

        } else return false;
    }

    public void addToAircraftsSeatsList(AircraftSeatService aircraftSeatService) {
        departAircraftSeatsList = new ArrayList<>();
        for (String seat : departSeatList) {
            AircraftSeatsEntity aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(departFlight.getId(), seat).get();
            departAircraftSeatsList.add(aircraftSeats);
        }
        if (flightAndSeat.ifRoundTrip()) {
            returnAircraftSeatsList = new ArrayList<>();
            for (String seat : returnSeatList) {
                AircraftSeatsEntity aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(returnFlight.getId(), seat).get();
                returnAircraftSeatsList.add(aircraftSeats);
            }
        }
    }

    public void addInfoBookingDetail(SeatService seatService) {
        int temp = booking.getBookingDetailEntity().size();
        for (int i = 0; i < booking.getBookingDetailEntity().size(); i++) {
            if (!flightAndSeat.ifRoundTrip() || i < temp / 2) {
                booking.getBookingDetailEntity().get(i).setFlightsEntity(departFlight);
                booking.getBookingDetailEntity().get(i).setSeatsEntity(seatService.findByName(departSeatList.get(i)).get());
                booking.getBookingDetailEntity().get(i).setPassengersEntity(passengersEntityList.get(i));
            } else {
                    booking.getBookingDetailEntity().get(i).setFlightsEntity(returnFlight);
                booking.getBookingDetailEntity().get(i).setSeatsEntity(seatService.findByName(returnSeatList.get(i - temp / 2)).get());
                    booking.getBookingDetailEntity().get(i).setPassengersEntity(passengersEntityList.get(i - temp / 2));
                }
            }
        }


    public void changeItemServiceQuantity(String serviceId, String quantityService, String flightId, String seat_id, ServiceService serviceService) {
        int id = Integer.parseInt(serviceId);
        int quantity = Integer.parseInt(quantityService);
        int flight = Integer.parseInt(flightId);
        int seatId = Integer.parseInt(seat_id);
        boolean checkIfExist = false;
        ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
        serviceBooking.setServiceEntity(serviceService.findById(id).get());
        serviceBooking.setQuantity(quantity);
        for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()) {
            if (bookingDetail.getSeatsEntity().getId() == seatId && bookingDetail.getFlightsEntity().getId() == flight) {
                serviceBooking.setBookingDetailEntity(bookingDetail);
                if (bookingDetail.getServiceBookingEntities() == null) {
                    if (quantity != 0) {
                        bookingDetail.setServiceBookingEntities(new ArrayList<>());
                        bookingDetail.getServiceBookingEntities().add(serviceBooking);
                    }
                } else {
                    for (ServiceBookingEntity value : bookingDetail.getServiceBookingEntities()) {
                        if (value.getServiceEntity().getId() == id) {
                            checkIfExist = true;
                            value.setQuantity(quantity);
                            break;
                        }
                    }
                    bookingDetail.getServiceBookingEntities().removeIf(value -> value.getQuantity() == 0);
                    if (!checkIfExist) {
                        bookingDetail.getServiceBookingEntities().add(serviceBooking);
                    }
                }
                break;
            }
        }
    }

    public boolean checkPromotion(String code, PromotionService promotionService) {
        boolean check = false;
        Optional<PromotionEntity> temp = promotionService.findByCode(code);
        if (temp.isPresent()) {
            if (temp.get().getStartDate().isBefore(LocalDate.now()) && temp.get().getEndDate().isAfter(LocalDate.now())) {
                for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()) {
                    for (PromotionEntity promotionEntity : bookingDetail.getFlightsEntity().getPromotionEntities())
                        if (promotionEntity.getId() == temp.get().getId()) {
                            bookingDetail.setDiscount(temp.get().getDiscount());
                            check = true;
                        }
/*                    if (!flightAndSeat.ifRoundTrip() || i < (size / 2)) {
                        for (PromotionEntity promotionEntity : departFlight.getPromotionEntities()) {
                            if (promotionEntity.getId() == temp.get().getId()) {
                                booking.getBookingDetailEntity().get(i).setDiscount(temp.get().getDiscount());
                                check = true;
                                break;
                            }
                        }
                    } else {
                        for (PromotionEntity promotionEntity : returnFlight.getPromotionEntities()) {
                            if (promotionEntity.getId() == temp.get().getId()) {
                                booking.getBookingDetailEntity().get(i).setDiscount(temp.get().getDiscount());
                                check = true;
                                break;
                            }
                        }
                    }*/
                }
            }
        }
        return check;
    }

    public int checkCreditCard(CreditCardEntity creditCard, CreditCardService creditCardService) {
        int temp = -1;
        for (CreditCardEntity cardEntity : creditCardService.findAll()) {
            if (cardEntity.equals(creditCard)) {
                if (cardEntity.getBalance() >= booking.getPaymentEntity().getAmount()) {
                    temp = 1;
                    creditCardEntity = cardEntity;
                    creditCardEntity.setBalance(cardEntity.getBalance() - booking.getPaymentEntity().getAmount());
                } else {
                    temp = 0;
                }
                break;
            }
        }
        return temp;
    }

    @Transactional(rollbackFor = Exception.class)
    public void endOfBooking(AircraftSeatService aircraftSeatService, BookingService bookingService1, CreditCardService creditCardService) {
        try {
            booking.setBookingDate(LocalDate.now());
            long number = (long) Math.floor(Math.random() * 9_000_000_000L) + 1_000_000_000L;
            int luggage = 0;
            List<String> ListNumber = bookingService1.findAllBookingNumber();
            for (String s : ListNumber) {
                if (Long.toString(number).equals(s))
                    number = (long) Math.floor(Math.random() * 9_000_000_000L) + 1_000_000_000L;
            }
            for (BookingDetailEntity bookingDetail : booking.getBookingDetailEntity()) {
                luggage += ConstantUtilis.default_luggage;
                bookingDetail.setBookingStatusEnum(BookingStatusEnum.BOOKED);
                if (bookingDetail.getServiceBookingEntities() != null) {
                    for (ServiceBookingEntity bookingService : bookingDetail.getServiceBookingEntities()) {
                        if (bookingService.getServiceEntity().getId() == 1) {
                            luggage += ConstantUtilis.extra_luggage * bookingService.getQuantity();
                        }
                    }
                }
            }
            creditCardService.save(creditCardEntity);
            booking.setBookingNumber(Long.toString(number));
            booking.setLuggage(luggage);
            booking.getPaymentEntity().setBookingEntity(booking);
            booking.getPaymentEntity().setPaymentDate(LocalDate.now());
            booking.getPaymentEntity().setCreditCardEntity(creditCardEntity);
        /*    departAircraftSeatsList.forEach((temp) -> {
                temp.setSeatsStatus(SeatStatusEnum.RESERVED);
                aircraftSeatService.save(temp);
            });
            if (flightAndSeat.ifRoundTrip())
                returnAircraftSeatsList.forEach((temp) -> {
                    temp.setSeatsStatus(SeatStatusEnum.RESERVED);
                    aircraftSeatService.save(temp);
                });*/
            booking.getBookingDetailEntity().forEach((n) -> {
                n.setBookingEntity(booking);
                AircraftSeatUtils.setStatusForSeat(
                        aircraftSeatService.findByFlight_IdAndSeat_Number(
                                n.getFlightsEntity().getId(), n.getSeatsEntity().getNumber()).get(), SeatStatusEnum.RESERVED, aircraftSeatService);
            });
            bookingService1.save(booking);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
