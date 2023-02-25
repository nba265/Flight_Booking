package com.mycompany.spring_mvc_project_final.configuration;


import com.mycompany.spring_mvc_project_final.model.Booking;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;
import com.mycompany.spring_mvc_project_final.utils.AircraftSeatUtils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@Configuration
@ComponentScan(basePackages = {"com.mycompany.spring_mvc_project_final"})
@Import({AircraftSeatService.class})
public class SessionListener implements HttpSessionListener {

/*    @Autowired
    private AircraftSeatService aircraftSeatService;*/

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("session created");
        event.getSession().setMaxInactiveInterval(60*5);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        System.out.println("session destroyed");
        if (event.getSession().getAttribute("booking") != null) {
            ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(event.getSession().getServletContext());
            assert ctx != null;
            AircraftSeatService aircraftSeatService = (AircraftSeatService) ctx.getBean("aircraftSeatService");
            Booking booking = (Booking) event.getSession().getAttribute("booking");
            booking.getBooking().getBookingDetailEntity().forEach(n-> System.out.println(n.getSeatsEntity().getNumber()));
            AircraftSeatUtils.setStatusForSeatAfterEndSeesion(aircraftSeatService,booking);
            System.out.println("session destroyed1");
        }
    }
}
