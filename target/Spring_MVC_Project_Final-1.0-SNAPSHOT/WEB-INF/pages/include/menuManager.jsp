<%--
  Created by IntelliJ IDEA.
  User: speed
  Date: 03/28/22
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
<div class="sidebar-container" >
    <div class="sidemenu-container navbar-collapse collapse fixed-menu">
        <div id="remove-scroll">
            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                <li class="sidebar-toggler-wrapper hide">
                    <div class="sidebar-toggler">
                        <span></span>
                    </div>
                </li>

                <li class="nav-item start">
                    <a href="home" class="nav-link nav-toggle">
                        <i class="material-icons">dashboard</i>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="booking_list" class="nav-link nav-toggle">
                        <i class="material-icons">business_center</i>
                        <span class="title">Booking</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">business_center</i>
                        <span class="title">Service</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="newService" class="nav-link ">
                                <span class="title">Add Service</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="service_list" class="nav-link ">
                                <span class="title">View All Services</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">vpn_key</i>
                        <span class="title">Promotions</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="newPromotion" class="nav-link ">
                                <span class="title">Add Promotion</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="promotion_list" class="nav-link ">
                                <span class="title">View All Promotions</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">vpn_key</i>
                        <span class="title">Aircrafts</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="newAircraft" class="nav-link ">
                                <span class="title">Add Aircraft</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="aircraft_list" class="nav-link ">
                                <span class="title">View All Aircrafts</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="airport_list" class="nav-link ">
                        <span class="title">Airports</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">group</i>
                        <span class="title">Flight</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="newFlight" class="nav-link ">
                                <span class="title">Add Flight</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="flight_list" class="nav-link ">
                                <span class="title">View All Flights</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">group</i>
                        <span class="title">Flight Routes</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="newFlightRoute" class="nav-link ">
                                <span class="title">Add Flight Routes</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="flightRouteList" class="nav-link ">
                                <span class="title">View All Flight Routes</span>
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
