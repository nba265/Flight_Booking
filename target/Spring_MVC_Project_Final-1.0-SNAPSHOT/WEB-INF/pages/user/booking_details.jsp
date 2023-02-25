<%--
  Created by IntelliJ IDEA.
  User: speed
  Date: 03/27/22
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="myfn" uri="http://samplefn" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta name="description" content="Responsive Admin Template"/>
    <meta name="author" content="SmartUniversity"/>
    <title>Management</title>
    <link href="${pageContext.request.contextPath}/resources-management/plane.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.4.3.1.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/font-awesome.4.7.0.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css"/>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css"/>
    <!-- icons -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <!--bootstrap -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- Material Design Lite CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/assets/css/material_style.css">
    <!-- data tables -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- animation -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/pages/animate_page.css"
          rel="stylesheet">
    <!-- Template Styles -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/style.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/plugins.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/responsive.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/theme-color.css" rel="stylesheet"
          type="text/css"/>
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources-management/assets/img/favicon.ico"/>
    <style>
        /*
        *
        * ==========================================
        * CUSTOM UTIL CLASSES
        * ==========================================
        *
        */
        .datepicker td, .datepicker th {
            width: 2.5rem;
            height: 2.5rem;
            font-size: 0.85rem;
        }

        .datepicker {
            margin-bottom: 3rem;
        }

        /*
        *
        * ==========================================
        * FOR DEMO PURPOSES
        * ==========================================
        *
        */
        body {
            min-height: 100vh;
            background-color: #fafafa;
        }

        .input-group {
            border-radius: 30rem;
        }

        input.form-control {
            border-radius: 30rem 0 0 30rem;
            border: none;
        }

        input.form-control:focus {
            box-shadow: none;
        }

        input.form-control::placeholder {
            font-style: italic;
        }

        .input-group-text {
            border-radius: 0 30rem 30rem 0;
            border: none;
        }

        .datepicker-dropdown {
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            width: 250px;
        }

        html {
            box-sizing: border-box;
        }

        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }

        .cf:before,
        .cf:after {
            display: table;
            content: ' ';
        }

        .cf:after {
            clear: both;
        }

        .cf {
            *zoom: 1;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            color: #555;
            background-color: #f5f7fa;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        figure {
            margin: 0;
            padding: 10px;
        }

        figure a {
            display: block;
        }

        mark {
            padding: 0 5px;
            background-color: #ddd;
        }

        ::backdrop {
            background-color: rgba(0, 0, 0, 0.5);
        }

        .btn {
            padding: 10px 15px;
            cursor: pointer;
            color: #555;
            border-width: 1px;
            border-style: solid;
            border-radius: 3px;
            background-color: #f3f3f3;
        }

        .btn.disabled {
            cursor: not-allowed;
            color: #ddd;
            border-color: #ddd;
        }

        .btn-group {
            padding: 15px 20px;
            text-align: right;
            background-color: #f5f6f8;
        }

        .btn-primary {
            color: #fff;
            border-color: #0066c0;
            background-color: #0074d9;
        }

        .btn-primary:hover {
            background-color: #0066c0;
        }

        .btn-danger {
            color: #fff;
            border-color: #ab3326;
            background-color: #c0392b;
        }

        .btn-danger:hover {
            background-color: #ab3326;
        }

        .btn-cancel {
            color: #999;
            border-color: #ddd;
        }

        .btn-cancel:hover {
            background-color: #e6e6e6;
        }

        .site-header {
            text-align: center;
            background-color: #196e76;
        }

        .site-header h1,
        .site-header a {
            padding: 15px;
            text-transform: uppercase;
            color: #fff;
        }

        .site-header h1 {
            font-size: 18px;
            margin: 0;
        }

        .site-header a {
            font-size: 14px;
            font-weight: 300;
            display: block;
            text-decoration: none;
            background-color: #10474c;
        }

        .boxed-group {
            width: 90%;
            max-width: 680px;
            margin-top: 50px;
            margin-right: auto;
            margin-left: auto;
        }

        .boxed-group h3,
        .boxed-group h4 {
            font-weight: 400;
            margin: 0;
        }

        .boxed-group h3 {
            padding: 12px 20px;
            color: #fff;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            background-color: #434a54;
        }

        .boxed-group h4 {
            font-size: 18px;
            color: #555;
        }

        .boxed-group section {
            padding: 30px 20px;
        }

        .boxed-group section:first-child {
            border-bottom: 1px solid #e6e9ed;
        }

        .boxed-group section:only-of-type,
        .boxed-group section:only-child {
            border-bottom: 0;
        }

        .boxed-group .boxed-group-inner {
            font-size: 14px;
            font-weight: 300;
            color: #aaa;
            border-width: 0 1px 1px;
            border-style: solid;
            border-color: #e6e9ed;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            background-color: #fff;
        }

        .boxed-group .btn {
            float: right;
            margin-left: 20px;
        }

        .site-dialog {
            overflow: hidden;
            width: 95%;
            max-width: 500px;
            padding: 0;
            border-width: 0;
            border-radius: 5px;
            background: transparent;
            box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.3);
            visibility: hidden;
            transform: scale(1);
            transition: transform 300ms;
        }

        .site-dialog.dialog-scale {
            visibility: visible;
            transform: scale(1);
        }

        .site-dialog h1 {
            font-size: 16px;
            font-weight: normal;
            margin: 0;
            color: #fff;
        }

        .site-dialog p {
            font-size: 14px;
        }

        .site-dialog .dialog-header {
            padding: 12px 20px;
            background-color: #434a54;
        }

        .site-dialog .dialog-content {
            padding: 30px 20px;
            color: #555;
            background-color: #fff;
        }

        .site-dialog .dialog-content p:last-of-type,
        .site-dialog .dialog-content p:only-child {
            margin-top: 0;
            margin-bottom: 0;
        }

    </style>

</head>
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
<div class="page-wrapper">
    <!-- start header -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <!-- end header -->
    <!-- start page container -->
    <div class="page-container">
        <!-- start sidebar menu -->
        <!-- end sidebar menu -->
        <!-- start page content -->
        <div>
            <div class="page-content">
                <div class="m-2">
                    <div class="row">
                        <div class="col-sm-12">
                            <%--<div class="card-box mt-3 ">
                                <div class="card-head">
                                    <header>Booking Details</header>
                                    <button id="panel-button"
                                            class="mdl-button mdl-js-button mdl-button--icon pull-right"
                                            data-upgraded=",MaterialButton">
                                        <i class="material-icons">more_vert</i>
                                    </button>
                                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                        data-mdl-for="panel-button">
                                        <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
                                        </li>
                                        <li class="mdl-menu__item"><i class="material-icons">print</i>Another action
                                        </li>
                                        <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else
                                            here
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-12 p-t-20  align-content-center">
                                <a href="booking_history" class="btn btn-outline-primary btn-lg">Back</a>
                                </div>
                                <c:forEach items="${listBookingDetail}" var="item">
                                    <div class="card-body row border p-3" style="margin: 1em 2em"
                                         method="get">

                                        <div class="col-lg-12 p-t-20">
                                            <p>Flight: ${item.flightsEntity.id}</p>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.departure}" readonly>
                                                <label class="mdl-textfield__label">Departure Date</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.departureTime}" readonly>
                                                <label class="mdl-textfield__label">Departure Time</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.arrival}" readonly>
                                                <label class="mdl-textfield__label">arrival Date</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.arrivalTime}" readonly>
                                                <label class="mdl-textfield__label">Departure Time</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.flightRoute.departureAirport.name}"
                                                       readonly>
                                                <label class="mdl-textfield__label">Departure Place</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.flightsEntity.flightRoute.destinationAirport.name}"
                                                       readonly>
                                                <label class="mdl-textfield__label">Destination Place</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.passengersEntity.genderEnum}"
                                                       readonly>
                                                <label class="mdl-textfield__label">Gender</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floa  ting-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.passengersEntity.fullName}" readonly>
                                                <label class="mdl-textfield__label">Full Name</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floa  ting-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.passengersEntity.idenCode}" readonly>
                                                <label class="mdl-textfield__label">Identify Code</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floa  ting-label txt-full-width">
                                                <input class="mdl-textfield__input" type="text" name="number"
                                                       value="${item.seatsEntity.number}" readonly>
                                                <label class="mdl-textfield__label">Seat Number</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 p-t-20">
                                            <div class="site-content cf">
                                                <button name="test" class="btn btn-info boxed-action"
                                                        data-id="confirm-delete${item.id}"
                                                        id="delete-account${item.id}">
                                                    Services
                                                </button>
                                                <dialog id="confirm-delete${item.id}" class="site-dialog cf">
                                                        &lt;%&ndash;    <form:form modelAttribute="test" method="get" action="editServiceBooking" id="${item.id}">&ndash;%&gt;
                                                    <input type="text" name="idBooking"
                                                           value="${idBooking}" readonly hidden>
                                                    <header class="dialog-header">
                                                        <h1 style="">Services</h1>
                                                            &lt;%&ndash;  <c:forEach items="${service}" var="item1" varStatus="status1">&ndash;%&gt;
                                                        <c:forEach items="${item.serviceBookingEntities}" var="item1">
                                                            &lt;%&ndash; <c:if test="${item2.serviceEntity.id==item1.id}">
                                                               <c:set value="${item2.quantity}" var="quantity"> </c:set>
                                                             </c:if>
                                                           </c:forEach>&ndash;%&gt;
                                                            <input type="text"
                                                                   value="${item.id}" hidden readonly>
                                                            <input type="number" id="${item1.id}"
                                                                   value="${item1.quantity}" readonly/>
                                                            <input type="text" id="${item1.id}"
                                                                   value="${item1.id}" hidden readonly/>
                                                            <label for="${item1.id}"
                                                                   style="color:white;">${item1.serviceEntity.name}:
                                                                &ensp;
                                                                $${item1.serviceEntity.price * item1.quantity} </label><br>
                                                            &lt;%&ndash;   <c:set value="0" var="quantity"> </c:set>&ndash;%&gt;
                                                        </c:forEach>
                                                        <div style="position: absolute; right: 0; top: 0; text-align: right">
                                                            <button class="btn btn-cancel"
                                                                    data-id="confirm-delete${item.id}"
                                                                    id="cancel${item.id}"
                                                                    name="cancel">x
                                                            </button>
                                                        </div>
                                                    </header>
                                                        &lt;%&ndash;   </form:form>&ndash;%&gt;
                                                </dialog>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>--%>
                            <div class="card-box">
                                <div class="card-head">
                                    <header>Booking Details</header>
                                    <button id="panel-button"
                                            class="mdl-button mdl-js-button mdl-button--icon pull-right"
                                            data-upgraded=",MaterialButton">
                                        <i class="material-icons">more_vert</i>
                                    </button>
                                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                        data-mdl-for="panel-button">
                                        <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
                                        </li>
                                        <li class="mdl-menu__item"><i class="material-icons">print</i>Another action
                                        </li>
                                        <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else
                                            here
                                        </li>
                                    </ul>
                                </div>
                                <c:forEach items="${flightList}" var="flight">
                                    <div class="col-lg-12 p-t-20" style="text-align: center">
                                        <h2 class="display-2">Flight: ${flight.flightRoute.departureAirport.name} to ${flight.flightRoute.destinationAirport.name}</h2>
                                    </div>
                                    <c:forEach items="${listBookingDetail}" var="item">
                                        <c:if test="${item.flightsEntity.id == flight.id }">
                                            <div class="card-body row border p-3" style="margin: 1em 2em">
                                                <div class="col-lg-12 p-t-20">
                                                    <c:choose>
                                                        <c:when test="${item.bookingStatusEnum=='COMPLETED'}">
                                                            <button type="button" class="btn btn-primary">${item.bookingStatusEnum}</button>
                                                        </c:when>
                                                        <c:when test="${item.bookingStatusEnum=='BOOKED'}">
                                                            <button type="button" class="btn btn-success">${item.bookingStatusEnum}</button>
                                                            <c:if test="${cancelDate.isBefore(item.flightsEntity.departure.atTime(item.flightsEntity.departureTime))}">
                                                                <a href="../cancel_booking?id=${item.id}&number=${item.bookingEntity.bookingNumber}" class="btn btn-outline-danger ml-3">CANCEL BOOKING</a>
                                                            </c:if>
                                                        </c:when>
                                                        <c:when test="${item.bookingStatusEnum=='CHECK_IN'}">
                                                            <button type="button" class="btn btn-info">${item.bookingStatusEnum}</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" class="btn btn-danger">${item.bookingStatusEnum}</button>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.departure}" readonly>
                                                        <label class="mdl-textfield__label">Departure Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.departureTime}" readonly>
                                                        <label class="mdl-textfield__label">Departure Time</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.arrival}" readonly>
                                                        <label class="mdl-textfield__label">arrival Date</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.arrivalTime}" readonly>
                                                        <label class="mdl-textfield__label">Departure Time</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.flightRoute.departureAirport.name}"
                                                               readonly>
                                                        <label class="mdl-textfield__label">Departure Place</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.flightsEntity.flightRoute.destinationAirport.name}"
                                                               readonly>
                                                        <label class="mdl-textfield__label">Destination Place</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.passengersEntity.genderEnum}" readonly>
                                                        <label class="mdl-textfield__label">Gender</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.passengersEntity.fullName}" readonly>
                                                        <label class="mdl-textfield__label">Full Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.passengersEntity.idenCode}" readonly>
                                                        <label class="mdl-textfield__label">Identify Code</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class="mdl-textfield__input" type="text" name="number"
                                                               value="${item.seatsEntity.number}" readonly>
                                                        <label class="mdl-textfield__label">Seat Number</label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 p-t-20">
                                                    <c:forEach items="${item.serviceBookingEntities}" var="services">
                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width input-group input-group-sm mb-3 col-lg-3 p-t-20" style="float: left">
                                                            <input type="number"  id="${item.id}${services.id}" style="width: 5em;float: left;margin-right: 5px"
                                                                   min="0" class="form-control"
                                                                   value="${services.quantity}" readonly/>
                                                            <label for="${item.id}${services.id}" >${services.serviceEntity.name}</label><br>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page content -->
        <!-- start chat sidebar -->
        <div class="chat-sidebar-container" data-close-on-body-click="false">
            <div class="chat-sidebar">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_1" class="nav-link active tab-icon" data-toggle="tab">Theme
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_2" class="nav-link tab-icon" data-toggle="tab"> Chat
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#quick_sidebar_tab_3" class="nav-link tab-icon" data-toggle="tab"> Settings
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane chat-sidebar-settings in show active animated shake" role="tabpanel"
                         id="quick_sidebar_tab_1">
                        <div class="slimscroll-style">
                            <div class="theme-light-dark">
                                <h6>Sidebar Theme</h6>
                                <button type="button" data-theme="white"
                                        class="btn lightColor btn-outline btn-circle m-b-10 theme-button">Light Sidebar
                                </button>
                                <button type="button" data-theme="dark"
                                        class="btn dark btn-outline btn-circle m-b-10 theme-button">Dark Sidebar
                                </button>
                            </div>
                            <div class="theme-light-dark">
                                <h6>Sidebar Color</h6>
                                <ul class="list-unstyled">
                                    <li class="complete">
                                        <div class="theme-color sidebar-theme">
                                            <a href="#" data-theme="white"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="dark"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="blue"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="indigo"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="cyan"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="green"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="red"><span class="head"></span><span
                                                    class="cont"></span></a>
                                        </div>
                                    </li>
                                </ul>
                                <h6>Header Brand color</h6>
                                <ul class="list-unstyled">
                                    <li class="theme-option">
                                        <div class="theme-color logo-theme">
                                            <a href="#" data-theme="logo-white"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-dark"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-blue"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-indigo"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-cyan"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-green"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="logo-red"><span class="head"></span><span
                                                    class="cont"></span></a>
                                        </div>
                                    </li>
                                </ul>
                                <h6>Header color</h6>
                                <ul class="list-unstyled">
                                    <li class="theme-option">
                                        <div class="theme-color header-theme">
                                            <a href="#" data-theme="header-white"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-dark"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-blue"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-indigo"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-cyan"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-green"><span class="head"></span><span
                                                    class="cont"></span></a>
                                            <a href="#" data-theme="header-red"><span class="head"></span><span
                                                    class="cont"></span></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Start Doctor Chat -->

                    <!-- End Doctor Chat -->
                    <!-- Start Setting Panel -->

                </div>
            </div>
        </div>
        <!-- end chat sidebar -->
    </div>
    <!-- end page container -->
    <!-- start footer -->
    <div class="page-footer">
        <div class="page-footer-inner"> 2018 &copy; Spice Hotel Template By
            <a href="mailto:redstartheme@gmail.com" target="_top" class="makerCss">RedStar Theme</a>
        </div>
        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>
    <!-- end footer -->
</div>

<script src="${pageContext.request.contextPath}/resources-management/datepicker/jquery-3.3.1.slim.min.js"></script>
<!-- start js include path -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Common js-->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/layout.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/theme-color.js"></script>
<!-- data tables -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/table/table_data.js"></script>
<!-- Material -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.js"></script>
<!-- animation -->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/ui/animations.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js"></script>


<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.bundle.4.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('button[name="test"]').click(function () {
            let btn = $(this);
            let id = btn.data('id');
            let element = document.getElementById(id);
            element.showModal();
            document.getElementById(id).style.visibility = 'visible';

            /*if (element.style.visibility === 'hidden') {
                document.getElementById(id).style.visibility = 'visible';
            } else {
                document.getElementById(id).style.visibility = 'hidden';
            }*/
        });

        $('button[name="cancel"]').click(function () {
            let btn = $(this);
            let id = btn.data('id');
            let element = document.getElementById(id);
            element.close();
            document.getElementById(id).style.visibility = 'hidden'


            /*document.getElementById(id).style.visibility = 'hidden';*/
        });
    });


    /*'use strict';

    var $accountDelete       = $('#delete-account'),
        $accountDeleteDialog = $('#confirm-delete'),
        transition;

    $accountDelete.on('click', function() {
        $accountDeleteDialog[0].showModal();
        transition = window.setTimeout(function() {
            $accountDeleteDialog.addClass('dialog-scale');
        }, 0.5);
    });

    $('#cancel').on('click', function() {
        $accountDeleteDialog[0].close();
        $accountDeleteDialog.removeClass('dialog-scale');
        clearTimeout(transition);
    });*/

    /*(function($) {
        'use strict';

        var $accountDelete       = $('#delete-account'),
            $accountDeleteDialog = $('#confirm-delete'),
            transition;

        $accountDelete.on('click', function() {
            $accountDeleteDialog[0].showModal();
            transition = window.setTimeout(function() {
                $accountDeleteDialog.addClass('dialog-scale');
            }, 0.5);
        });

        $('#cancel').on('click', function() {
            $accountDeleteDialog[0].close();
            $accountDeleteDialog.removeClass('dialog-scale');
            clearTimeout(transition);
        });

    })(jQuery);*/
    /*$(document).ready(function () {
        var $accountDelete = $('#delete-account');

        let $accountDeleteDialog = $('#confirm-delete');
        let confirm = document.getElementById('confirm-delete');

        $accountDelete.on('click', function () {
            if (confirm.style.visibility === 'hidden')
                confirm.style.visibility = 'visible';
        });

        $('#cancel').on('click', function () {
            if (confirm.style.visibility === 'visible')
                confirm.style.visibility = 'hidden';
        });
    });

    (function ($) {
        'use strict';

        var $accountDelete = $('#delete-account'),
            $accountDeleteDialog = $('#confirm-delete');

        $accountDelete.on('click', function () {
            $accountDeleteDialog[0].showModal();
        });

    })(jQuery);*/
</script>
<!-- end js include path -->
</body>
</html>
