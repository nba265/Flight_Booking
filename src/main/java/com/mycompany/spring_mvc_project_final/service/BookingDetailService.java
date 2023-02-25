package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.model.ServiceBookingList;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
import com.mycompany.spring_mvc_project_final.utils.BookingDetailUtilis;
import com.mycompany.spring_mvc_project_final.utils.BookingUtilis;
import com.mycompany.spring_mvc_project_final.utils.ConstantUtilis;
import com.mycompany.spring_mvc_project_final.utils.ServiceUtilis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class BookingDetailService {
    @Autowired
    BookingDetailRepository bookingDetailRepository;

    @Autowired
    BookingService bookingService;

    @Autowired
    ServiceBookingService serviceBookingService;

    @Autowired
    ServiceService serviceService;

    @Autowired
    CreditCardService creditCardService;

    public Optional<BookingDetailEntity> findById(int id){
        return bookingDetailRepository.findById(id);
    }
    public Iterable<BookingDetailEntity> findByBooking(int id){
        return bookingDetailRepository.findByBookingEntity_Id( id);
    }

    public Iterable<BookingDetailEntity> findByBookingNumber(String number){
        return bookingDetailRepository.findByBookingEntity_BookingNumber(number);
    }

    public Iterable<BookingDetailEntity> findByBooking(BookingEntity bookingEntity){
        return bookingDetailRepository.findByBookingEntity( bookingEntity);
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(BookingDetailEntity bookingDetailEntity, String id, ServiceBookingList serviceBookingList) {
            /*BookingEntity bookingEntity = bookingService.findById(Integer.parseInt(id)).get();*/
        try {
            int luggage_default= 0;
            BookingEntity bookingEntity = bookingDetailEntity.getBookingEntity();
            for (ServiceBookingEntity serviceBooking : bookingDetailEntity.getServiceBookingEntities()){
                if (serviceBooking.getServiceEntity().getId() == 1){
                    luggage_default += serviceBooking.getQuantity()*ConstantUtilis.extra_luggage;
                    break;
                }
            }
            double startPrice = ServiceUtilis.priceService(bookingDetailEntity);
            int luggage = bookingEntity.getLuggage();
            serviceBookingService.deleteById(bookingDetailEntity);
            BookingDetailUtilis.changeService(bookingDetailEntity, serviceBookingList.getServiceBookingEntities(), serviceService);
            double laterPrice = ServiceUtilis.priceService(bookingDetailEntity);
            BookingEntity bookingEntity1 = BookingUtilis.amountPayment(bookingEntity, bookingService, creditCardService, startPrice, laterPrice);
            BookingDetailEntity bookingDetail= BookingDetailUtilis.changeUnitPrice(bookingDetailEntity,startPrice,laterPrice);
            bookingDetail.setBookingEntity(bookingEntity1);
            for (ServiceBookingEntity serviceBooking : bookingDetail.getServiceBookingEntities()){
                if (serviceBooking.getServiceEntity().getId() == 1){
                    int luggage1 = serviceBooking.getQuantity() * ConstantUtilis.extra_luggage;
                    bookingDetail.getBookingEntity().setLuggage(luggage - luggage_default + luggage1);
                    break;
                }
            }
            bookingDetailRepository.save(bookingDetail);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(BookingDetailEntity bookingDetailEntity){
        try {
            bookingDetailRepository.save(bookingDetailEntity);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
