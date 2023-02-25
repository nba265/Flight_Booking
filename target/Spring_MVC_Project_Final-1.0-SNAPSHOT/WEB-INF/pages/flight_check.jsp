<%--
  Created by IntelliJ IDEA.
  User: bbb26
  Date: 03/28/22
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Flight - Travel and Tour</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap-grid.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-theme.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/datepicker.css"
          type="text/css">
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/hero-slider.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl-carousel.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/tooplate-style.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

    <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <style>
        .disabled_link:hover {
            cursor: not-allowed;
        }

        #fight_route::before {
            background-image: url("${pageContext.request.contextPath}/resources/assets/img/travel.png");
            background-size: 60px 60px;
            display: inline-block;
            width: 60px;
            height: 60px;
            content: "";
            margin-right: 1em;
        }

        #fight_route span {
            font-size: 16px;
            line-height: 18px;
            font-weight: bold;
            color: #00305B;
        }

        #fight_route {
            margin-top: 20px;
        }

        #weather {
            margin-top: 20px;
        }

        .time {
            font-family: cursive;
            font-size: 20px;
            margin-bottom: 0px;
        }

        .name {
            color: #be5a3a;
            font-family: monospace;
            font-size: large;
        }
    </style>
</head>
<body>
<jsp:include page="include/header1.jsp"/>
<%--<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2 id="fight_route">
                <i></i>
                <span>Choose your flight</span><br>
                &lt;%&ndash;<strong>${flight_route.departureAirport.name}</strong>
                <span> (${flight_route.departureAirport.code}) to </span>
                <strong>${flight_route.destinationAirport.name} </strong><span> (${flight_route.destinationAirport.code})</span>&ndash;%&gt;
            </h2>
        </div>
    </div>
</div>--%>
<div id="weather">
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <div class="col-md-12">
                    <div class="weather-content">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="tabs clearfix">
                                    <li><a style="background-color: #dcdb40" href="#" aria-readonly="true">Select
                                        Flight</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Passenger</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Extra</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Seat Selection</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Payment</a></li>
                                </ul>
                            </div>
                            <div class="col-md-12">
                                <section id="second-tab-group" class="weathergroup">
                                    <div id="monday">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <div style="margin-bottom: 2em" class="col-md-12">
                                                    <h1>Departure Date: ${departFlight.departure}</h1>
                                                    <div class="weather-item">
                                                        <div class="container">
                                                            <div class="row row-cols-3">
                                                                <div class="col">
                                                                    <p>Departure</p>
                                                                    <p class="time">${departFlight.departureTime}</p>
                                                                    <p>${departFlight.flightRoute.departureAirport.name}<i style="font-size: 10px">(${departFlight.flightRoute.departureAirport.code})</i></p>
                                                                </div>
                                                                <div class="col">
                                                                    <p>Duration</p>
                                                                    <p class="time">${departFlight.flightRoute.duration.toHoursPart()}h:${departFlight.flightRoute.duration.toMinutesPart()}m</p>
                                                                    <p class="name">${departFlight.aircraft.name}</p>
                                                                </div>
                                                                <div class="col">
                                                                    <p>Destination</p>
                                                                    <p class="time">${departFlight.arrivalTime}</p>
                                                                    <p>${departFlight.flightRoute.destinationAirport.name}<i style="font-size: 10px">(${departFlight.flightRoute.destinationAirport.code})</i></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${checkIfRoundTrip == true}">
                                                    <div style="margin-bottom: 2em" class="col-md-12">
                                                        <h1>Return Date: ${returnFlight.departure}</h1>
                                                        <div class="weather-item">
                                                            <div class="container">
                                                                <div class="row row-cols-3">
                                                                    <div class="col">
                                                                        <p>Departure</p>
                                                                        <p class="time">${returnFlight.departureTime}</p>
                                                                        <p>${returnFlight.flightRoute.departureAirport.name}<i style="font-size: 10px">(${returnFlight.flightRoute.departureAirport.code})</i></p>
                                                                    </div>
                                                                    <div class="col">
                                                                        <p>Duration</p>
                                                                        <p class="time">${returnFlight.flightRoute.duration.toHoursPart()}h:${returnFlight.flightRoute.duration.toMinutesPart()}m</p>
                                                                        <p class="name">${returnFlight.aircraft.name}</p>
                                                                    </div>
                                                                    <div class="col">
                                                                        <p>Destination</p>
                                                                        <p class="time">${returnFlight.arrivalTime}</p>
                                                                        <p>${returnFlight.flightRoute.destinationAirport.name}<i style="font-size: 10px">(${returnFlight.flightRoute.destinationAirport.code})</i></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div style="margin-bottom: 2em" class="col-md-3">
                                                <h1>Flight Infomation</h1>
                                                <div class="weather-item">
                                                    <div class="container">
                                                        <div class="row">
                                                            <p>
                                                                ${departFlight.flightRoute.departureAirport.name}
                                                                -> ${departFlight.flightRoute.destinationAirport.name}
                                                            </p>
                                                            <br>
                                                            <p>
                                                                Price:
                                                                $${departFlight.flightRoute.standardPrice + departSeatPrice}
                                                            </p>
                                                        </div>
                                                        <c:if test="${checkIfRoundTrip == true}">
                                                            <div class="row">
                                                                <p>
                                                                        ${returnFlight.flightRoute.departureAirport.name}
                                                                    -> ${returnFlight.flightRoute.destinationAirport.name}
                                                                </p>
                                                                <br>
                                                                <p>
                                                                    Price:
                                                                    $${returnFlight.flightRoute.standardPrice + returnSeatPrice}
                                                                </p>
                                                            </div>
                                                            <div style="margin-top: 1rem" class="row">
                                                                <p style="color: #0cc745">Total Price:
                                                                    $${departFlight.flightRoute.standardPrice + returnFlight.flightRoute.standardPrice + departSeatPrice + returnSeatPrice } </p>
                                                            </div>
                                                        </c:if>
                                                        <div class="row">
                                                            <form:form id="flightAndSeat" action="booking"
                                                                       modelAttribute="flightAndSeat"
                                                                       method="get">
                                                                <input type="hidden" name="departFlightId"
                                                                       value="${departFlight.id}">
                                                                <input type="hidden" name="departSeatType"
                                                                       value="${departSeatType}">
                                                                <c:if test="${checkIfRoundTrip == true}">
                                                                    <input type="hidden" name="returnFlightId"
                                                                           value="${returnFlight.id}">
                                                                    <input type="hidden" name="returnSeatType"
                                                                           value="${returnSeatType}">
                                                                </c:if>
                                                                <label for="quantity">Enter the number of
                                                                    passenger</label>
                                                                <input class="form-control" id="quantity" type="number"
                                                                       min="1" max="5" name="quantity" value="1"
                                                                       required>
                                                                <button type="submit"
                                                                        class="btn btn-outline-primary btn-lg mt-2">Continue
                                                                </button>
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer1.jsp"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>
