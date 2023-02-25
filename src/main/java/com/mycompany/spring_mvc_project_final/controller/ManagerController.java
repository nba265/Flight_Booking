package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.*;
import com.mycompany.spring_mvc_project_final.model.NewPassword;
import com.mycompany.spring_mvc_project_final.model.ServiceBookingList;
import com.mycompany.spring_mvc_project_final.model.StartDateEndDate;
import com.mycompany.spring_mvc_project_final.service.*;
import com.mycompany.spring_mvc_project_final.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDate;


@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    BookingService bookingService;

    @Autowired
    AirportService airportService;

    @Autowired
    AircraftService aircraftService;

    @Autowired
    PromotionService promotionService;

    @Autowired
    FlightService flightService;

    @Autowired
    ServiceService serviceService;

    @Autowired
    FlightsRoutesService flightsRoutesService;

    @Autowired
    AircraftSeatService aircraftSeatService;

    @Autowired
    ImageService imageService;

    @Autowired
    ServiceBookingService serviceBookingService;

    @Autowired
    BookingDetailService bookingDetailService;

    @Autowired
    CreditCardService creditCardService;

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    PaymentService paymentService;


    /*@RequestMapping(value="/test",method = RequestMethod.GET)
    public String test(Model model){

        model.addAttribute("listBooking",bookingService.findAll());
        return "manager/daypicker";
    }

    @RequestMapping(value="/test2",method = RequestMethod.GET)
    public String test2(Model model){
        model.addAttribute("listBooking",bookingService.findAll());
        return "manager/daypicker2";
    }*/
    /*@RequestMapping("/login")
    public String Index(@CookieValue(value = "setUser", defaultValue = "") String setUser, Model model) {
        Cookie cookie = new Cookie("setUser", setUser);
        model.addAttribute("cookieValue", cookie);
        return "login";
    }*/

    @RequestMapping("/home")
    public String viewHome(Model model) {

        model.addAttribute("orders",bookingService.countAll());
        model.addAttribute("total",paymentService.total());
        model.addAttribute("newBooking",bookingService.newBooking());
        model.addAttribute("incomeToday",paymentService.totalIncomeToday());
        model.addAttribute("incomeThisMonth",paymentService.totalIncomeThisMonth());
        model.addAttribute("incomeThisYear",paymentService.totalIncomeThisYear());
        return "manager/home_manager";
    }

    @RequestMapping(value="/homeManager",method = RequestMethod.GET)
    public String homeManager(Model model){

        return "manager/home_manager";
    }

    @RequestMapping(value="/booking_list",method = RequestMethod.GET)
    public String bookingList(Model model, @Valid @ModelAttribute(name = "searchDate") StartDateEndDate startDateEndDate){
        model.addAttribute("listBooking",bookingService.findAll(startDateEndDate.getStartDate(),startDateEndDate.getEndDate()));
        return "manager/booking_list";
    }

    @RequestMapping(value="/airport_list",method = RequestMethod.GET)
    public String airportList(Model model){
        model.addAttribute("airport", new AirportsEntity());
        model.addAttribute("listAirport",airportService.findAll());
        return "manager/airport_list";
    }

    @RequestMapping(value="/aircraft_list",method = RequestMethod.GET)
    public String aircraftList(Model model){
        model.addAttribute("listAircraft",aircraftService.findAll());
        model.addAttribute("ListAircraftStatus", AircrartsStatusEnum.values());
        return "manager/aircrafts_list";
    }

    @RequestMapping(value="/promotion_list",method = RequestMethod.GET)
    public String promotionList(Model model){
        model.addAttribute("listPromotion",promotionService.findAll());
        return "manager/promotion_list";
    }

    @RequestMapping(value="/flight_list",method = RequestMethod.GET)
    public String flightList(Model model){
        model.addAttribute("listFlight",flightService.findAll());
        return "manager/flight_list";
    }

    @RequestMapping(value="/listImageService",method = RequestMethod.GET)
    public String listImage(Model model, @RequestParam(name="id") int id){

        model.addAttribute("images",imageService.findByService(serviceService.findById(id).get()));
        model.addAttribute("idService",id);
        return "manager/image_list";
    }

    @RequestMapping(value="/deleteImage",method = RequestMethod.GET)
    public String deleteImage(Model model, @RequestParam(name="id") int id,@RequestParam(name = "idService" )int idService, HttpServletRequest request){
        imageService.deleteImage(id,request);

        return "redirect:/manager/listImageService?id="+idService;
    }

    @RequestMapping(value = "/flightRouteList",method = RequestMethod.GET)
    public String flightRouteList(Model model){
        model.addAttribute("flightRouteList",flightsRoutesService.findAll());
        return "manager/flight_route_list";
    }

    @RequestMapping(value = "/bookingDetailList",method = RequestMethod.GET)
    public String bookingDetailList(Model model,@RequestParam(name = "id") int id){
        model.addAttribute("flightList",flightService.findFlightlistByBookingDetails(bookingService.findById(id).get(),bookingDetailService));
        model.addAttribute("listBookingDetail",bookingDetailService.findByBooking(bookingService.findById(id).get()));
        model.addAttribute("service",serviceService.findAll());
        model.addAttribute("test", new ServiceBookingList());
        model.addAttribute("idBooking", id);
        model.addAttribute("listBookingStatus", BookingStatusEnum.values());
        return "manager/booking_detail";
    }

    @RequestMapping(value="/editStatusBooking",method = RequestMethod.GET)
    public String editBookingStatus(@RequestParam(name = "id") int id,@RequestParam(name = "status") String status, @RequestParam(name = "idBooking") String idBooking){
        BookingDetailEntity bookingDetailEntity = bookingDetailService.findById(id).get();
        BookingDetailUtilis.changeStatus(bookingDetailEntity,status);
        bookingDetailService.save(bookingDetailEntity);
        return "redirect:/manager/bookingDetailList?id="+idBooking;
    }

    @RequestMapping(value = "/editServiceBooking",method = RequestMethod.GET)
    public String editService( @Valid @ModelAttribute(name = "test") ServiceBookingList serviceBookingList, @RequestParam(name = "idBooking") String id) throws Exception {
        BookingDetailEntity bookingDetailEntity= bookingDetailService.findById(serviceBookingList.getServiceBookingEntities().get(0).getBookingDetailEntity().getId()).get();
        bookingDetailService.save(bookingDetailEntity,id,serviceBookingList);
        return "redirect:/manager/bookingDetailList?id="+id;
    }

    @RequestMapping(value="/service_list",method = RequestMethod.GET)
    public String serviceList(Model model){
        model.addAttribute("flightRouteList",flightsRoutesService.findAll());
        model.addAttribute("listService",serviceService.findAll());
        return "manager/service_list";
    }

    @RequestMapping(value="/newFlight",method = RequestMethod.GET)
    public String flight(Model model){
        model.addAttribute("listAircraft",aircraftService.findAll());
        model.addAttribute("flightObject",new FlightsEntity());
        model.addAttribute("flightRouteList",flightsRoutesService.findAll());
        model.addAttribute("listPromotion",promotionService.findAll());
        return "manager/flight";
    }

    @RequestMapping(value="/addNewFlight",method = RequestMethod.GET)
    public String addFlight(Model model, @RequestParam("promotion") String[] promotionEntities, @Valid @ModelAttribute(name = "flightObject") FlightsEntity flight){
        boolean aBoolean= FlightUtilis.checkAircraft(flight,flightService,flightsRoutesService,aircraftService);
        if(!aBoolean){
            model.addAttribute("message","Aircraft has been used");
            model.addAttribute("listAircraft",aircraftService.findAll());
            model.addAttribute("flightObject",flight);
            model.addAttribute("flightRouteList",flightsRoutesService.findAll());
            model.addAttribute("listPromotion",promotionService.findAll());
            return "manager/flight";
        }
        try {
            flightService.save(flight,promotionEntities);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("listFlight",flightService.findAll());
        return "manager/flight_list";
    }

    @RequestMapping(value="/editFlight",method = RequestMethod.GET)
    public String editFlight(Model model, @RequestParam(name = "id") int id){
        model.addAttribute("listAircraft",aircraftService.findAll());
        model.addAttribute("flightObject",flightService.findById(id).get());
        model.addAttribute("flightRouteList",flightsRoutesService.findAll());
        model.addAttribute("listPromotion",promotionService.findAll());
        model.addAttribute("listFlight",flightService.findAll());
        return "manager/flight";
    }


    @RequestMapping(value="/newAircraft",method = RequestMethod.GET)
    public String Aircraft(Model model){
        model.addAttribute("aircraft",new AircraftsEntity());
        model.addAttribute("ListAircraftStatus", AircrartsStatusEnum.values());
        return "manager/aircraft";
    }

    @RequestMapping(value="/addAircraft",method = RequestMethod.POST)
    public String addAircraft(Model model,@Valid @ModelAttribute(name = "aircraft")AircraftsEntity aircraftsEntity){
            aircraftService.save(aircraftsEntity);
        return "redirect:/manager/aircraft_list";

    }


    @RequestMapping(value="/editStatusAircraft",method = RequestMethod.GET)
    public String editAircraftStatus(@RequestParam(name = "id") int id,@RequestParam(name = "status") String status){
        AircraftsEntity aircraft = aircraftService.findById(id).get();
        AircraftUtils.changeStatus(aircraft,status);
        aircraftService.save(aircraft);
        return "redirect:/manager/aircraft_list";
    }


    @RequestMapping(value="/editSeat",method = RequestMethod.GET)
    public String editAircraftSeat(Model model, @RequestParam(name = "number") String number,@RequestParam(name="id")int id){
        model.addAttribute("aircraftseat",aircraftSeatService.findBySeatNumberAndFlight(number,id));
        model.addAttribute("seatTypes", SeatTypeEnum.values());
        model.addAttribute("seatStatus", SeatStatusEnum.values());
        return "manager/aircraftseat";
    }

    @RequestMapping(value = "/changeSeat",method = RequestMethod.GET)
    public String editAircraftSeat(Model model, @Valid @ModelAttribute(name = "aircraftseat") AircraftSeatsEntity aircraftSeatsEntity){

        aircraftSeatService.save(AircraftSeatUtils.changeDetail(aircraftSeatService.findById(aircraftSeatsEntity.getId()).get(),aircraftSeatsEntity));
        return "redirect:/manager/editFlight?id="+aircraftSeatService.findById(aircraftSeatsEntity.getId()).get().getFlight().getId();
    }

    @RequestMapping(value="/newService",method = RequestMethod.GET)
    public String newService(Model model){
        model.addAttribute("service", new ServiceEntity());
        return "manager/service";
    }

    @RequestMapping(value="/addService",method = RequestMethod.POST)
    public String addService(Model model, @Valid @ModelAttribute(name = "service")ServiceEntity serviceEntity,@RequestParam(name = "file") MultipartFile[] files, HttpServletRequest request){
        if (files != null && files.length > 0) {
            serviceEntity.setImageEntities(imageService.uploadImage(files, request,null,serviceEntity));
            serviceService.save(serviceEntity);
        }
        return "redirect:/manager/service_list";
    }

    @RequestMapping(value="/editService",method = RequestMethod.GET)
    public String editService(Model model, @RequestParam(name="id")int id){
        model.addAttribute("service",serviceService.findById(id).get());
        return "manager/service";
    }

    @RequestMapping(value="/deleteService",method = RequestMethod.GET)
    public String deleteService(Model model, @RequestParam(name="id")int id){
        serviceService.deleteById(id);
        return "redirect:/manager/service_list";
    }

    @RequestMapping(value = "/newFlightRoute",method = RequestMethod.GET)
    public String flightRoute(Model model){
        model.addAttribute("flightRoute",new FlightRoutesEntity());
        model.addAttribute("airports",airportService.findAll());
        return "manager/flight_route";
    }

    @RequestMapping(value = "/addFlightRoute",method = RequestMethod.GET)
    public String addFlightRoute(Model model, @Valid @ModelAttribute(name="flightRoute") FlightRoutesEntity flightRoutesEntity, @RequestParam(name = "duration1")  String test){
        flightsRoutesService.save(FlightRouteUtilis.addDuration(flightRoutesEntity,test));
        model.addAttribute("flightRouteList",flightsRoutesService.findAll());
        return "manager/flight_route_list";
    }

    @RequestMapping(value = "/editFlightRoute",method = RequestMethod.GET)
    public String editFlightRoute(Model model,@RequestParam(name = "id")int id){
        model.addAttribute("flightRoute",flightsRoutesService.findById(id).get());
        model.addAttribute("airports",airportService.findAll());
        return "manager/flight_route";
    }

    @RequestMapping(value="/newPromotion",method = RequestMethod.GET)
    public String newPromotion(Model model){
        LocalDate localDate = LocalDate.now();
        model.addAttribute("createDate",localDate.toString());
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("listPromotion",promotionService.findAll());
        return "manager/promotion";
    }

    @RequestMapping(value="/addPromotion",method = RequestMethod.GET)
    public String addPromotion(Model model, @Valid @ModelAttribute(name="promotion") PromotionEntity promotionEntity, BindingResult rs){
        promotionService.save(promotionEntity);
        model.addAttribute("listPromotion",promotionService.findAll());
        return "manager/promotion_list";
    }

    @RequestMapping(value="/editPromotion",method = RequestMethod.GET)
    public String editPromotion(Model model,@RequestParam(name = "id") int id){
        model.addAttribute("promotion",promotionService.findById(id).get());
        return "manager/promotion";
    }

    @RequestMapping(value="/deletePromotion",method = RequestMethod.GET)
    public String deletePromotion(Model model,@RequestParam(name = "id") int id){
        promotionService.deleteById(id);
        return "manager/promotion_list";
    }

    @RequestMapping(value="/addAirport",method = RequestMethod.POST)
    public String addAirport(Model model, @Valid @ModelAttribute(name="airport") AirportsEntity airportsEntity,@RequestParam("file") MultipartFile[] files,
                             HttpServletRequest request){

        if (files != null && files.length > 0) {
            airportsEntity.setImageList(imageService.uploadImage(files, request,airportsEntity,null));
            airportService.save(airportsEntity);
        }
        model.addAttribute("airport", new AirportsEntity());
        model.addAttribute("listAirport",airportService.findAll());
        return "manager/airport_list";
    }

    /*@RequestMapping(value="/editAirport",method = RequestMethod.GET)
    public String editAirport(Model model, @RequestParam(name="id") int id){
        model.addAttribute("airport", airportService.findById(id).get());
        model.addAttribute("listAirport",airportService.findAll());
        return "manager/airport_list";
    }

    @RequestMapping( value = "/deleteAirport",method = RequestMethod.GET)
    public String deleteBook(Model model,@RequestParam(name="id") int id) {
        airportService.deleteById(id);
        Iterable<AirportsEntity> bookEntities = airportService.findAll();
        model.addAttribute("listAirport",bookEntities);
        return "redirect:/manager/airport_list";
    }*/

    @RequestMapping( value = "/profile",method = RequestMethod.GET)
    public String profile(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username1 = principal.toString();
        if (principal instanceof UserDetails) {
            username1 = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("genderList", GenderEnum.values());
        model.addAttribute("user",userDetailsService.findByEmail(username1) );
        return "manager/profile_manager";
    }

    @RequestMapping( value = "/changePassword",method = RequestMethod.POST)
    public String changePassword(@Valid @ModelAttribute(name = "newPassword") NewPassword newPassword) {
        UserEntity userEntity= UserUtilis.changePassword(userDetailsService.findByEmail(newPassword.getEmail()),newPassword);
        userDetailsService.save(userEntity);
        return "redirect:/manager/profile";
    }

    @RequestMapping( value = "/editProfile",method = RequestMethod.GET)
    public String editProfile(@ModelAttribute(name="user")UserEntity user) {
        user=UserUtilis.editProfile(user, userDetailsService);
        userDetailsService.save(user);
        return "redirect:/manager/profile";

    }
}
