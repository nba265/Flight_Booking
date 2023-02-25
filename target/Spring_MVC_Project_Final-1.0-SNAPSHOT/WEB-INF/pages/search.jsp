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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="myfn" uri="http://samplefn" %>
<%@ page isELIgnored="false" %>
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
<c:if test="${message != null}">
    <h1>${message}</h1>
</c:if>
<c:if test="${message == null}">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 id="fight_route">
                    <i></i>
                    <span>Choose your flight</span><br>
                    <strong>${flight_route.departureAirport.name}</strong>
                    <span> (${flight_route.departureAirport.code}) to </span>
                    <strong>${flight_route.destinationAirport.name} </strong>
                    <span> (${flight_route.destinationAirport.code})</span>
                    <br>
                    <br>
                    <c:if test="${checkRoundTrip.equals(false)}">
                        <span>Departure Date: ${flightsList.get(0).departure}</span>
                    </c:if>
                    <c:if test="${checkRoundTrip.equals(true)}">
                        <span>Return Date: ${flightsList.get(0).departure}</span>
                    </c:if>
                </h2>
            </div>
        </div>
    </div>
    <div id="weather" style="margin-bottom: 3rem;">
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
                                                <c:if test="${checkRoundTrip.equals(false)}">
                                                    <c:forEach var="item" items="${flightsList}">
                                                        <div style="margin-bottom: 2em" class="col-md-6">
                                                            <div class="weather-item">
                                                                <div class="container">
                                                                    <div class="row row-cols-3">
                                                                        <div class="col">
                                                                            <p>Departure</p>
                                                                            <p class="time">${item.departureTime}</p>
                                                                            <p>${item.flightRoute.departureAirport.name}<i style="font-size: 10px">(${item.flightRoute.departureAirport.code})</i></p>
                                                                        </div>
                                                                        <div class="col">
                                                                            <p>Duration</p>
                                                                            <p class="time">${item.flightRoute.duration.toHoursPart()}h:${item.flightRoute.duration.toMinutesPart()}m</p>
                                                                            <p class="name">${item.aircraft.name}<i style="font-size: 15px">${item.aircraft.number}</i></p>
                                                                        </div>
                                                                        <div class="col">
                                                                            <p>Destination</p>
                                                                            <p class="time">${item.arrivalTime}</p>
                                                                            <p>${item.flightRoute.destinationAirport.name}<i style="font-size: 10px">(${item.flightRoute.destinationAirport.code})</i></p>
                                                                        </div>
                                                                     <%--   <fmt:parseNumber var="economyQuantity"
                                                                                         type="number" value="${0}"/>
                                                                        <fmt:parseNumber var="firstClassQuantity"
                                                                                         type="number" value="${0}"/>
                                                                        <fmt:parseNumber var="businessQuantity"
                                                                                         type="number" value="${0}"/>--%>
                                                                        <c:forEach var="item2" items="${item.aircraftSeatsList}">
                                                                            <c:if test="${item2.seatsStatus.toString().equals('AVAILABLE')}">
                                                                                <c:choose>
                                                                                    <c:when test="${item2.seatsType.toString() == 'ECONOMY'}">
                                                                                        <c:set var="ECONOMY"
                                                                                               value="ECONOMY"/>
                                                                                        <c:set var="economySeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                    </c:when>
                                                                                    <c:when test="${item2.seatsType.toString() == 'FIRST_CLASS'}">
                                                                                        <c:set var="FIRSTCLASS"
                                                                                               value="FIRSTCLASS"/>
                                                                                        <c:set var="firstClassSeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                    </c:when>
                                                                                    <c:when test="${item2.seatsType.toString() == 'BUSINESS'}">
                                                                                        <c:set var="BUSINESS"
                                                                                               value="BUSINESS"/>
                                                                                        <c:set var="businessSeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>

                                                                            <c:if test="${ECONOMY == 'ECONOMY'}">
                                                                                <div class="col">
                                                                                        ECONOMY
                                                                                    <br>
                                                                                    <a href="checkIfRoundTrip?id=${item.id}&seatType=ECONOMY&seatPrice=${economySeatPrice}&returnDate=${returnDate}"
                                                                                       class="btn btn-outline-dark">
                                                                                            $${economySeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${FIRSTCLASS == 'FIRSTCLASS'}">
                                                                                <div class="col">
                                                                                    FIRST CLASS
                                                                                    <br>
                                                                                    <a href="checkIfRoundTrip?id=${item.id}&seatType=FIRST_CLASS&seatPrice=${firstClassSeatPrice}&returnDate=${returnDate}"
                                                                                       class="btn btn-outline-dark">
                                                                                            $${firstClassSeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${BUSINESS == 'BUSINESS'}">
                                                                                <div class="col">
                                                                                    BUSINESS
                                                                                    <br>
                                                                                    <a href="checkIfRoundTrip?id=${item.id}&seatType=BUSINESS&seatPrice=${businessSeatPrice}&returnDate=${returnDate}"
                                                                                       class="btn btn-outline-dark">
                                                                                            $${businessSeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${checkRoundTrip.equals(true)}">
                                                    <c:forEach var="item" items="${flightsList}">
                                                        <div style="margin-bottom: 2em" class="col-md-6">
                                                            <div class="weather-item">
                                                                <div class="container">
                                                                    <div class="row row-cols-3">
                                                                        <div class="col">
                                                                            <p class="time">${item.departureTime}</p>
                                                                            <p>${item.flightRoute.departureAirport.code}</p>
                                                                        </div>
                                                                        <div class="col">
                                                                            <p class="time">${item.flightRoute.duration.toHoursPart()}h:${item.flightRoute.duration.toMinutesPart()}m</p>
                                                                            <p class="name">${item.aircraft.name}</p>
                                                                        </div>
                                                                        <div class="col">
                                                                            <p class="time">${item.arrivalTime}</p>
                                                                            <p>${item.flightRoute.destinationAirport.code}</p>
                                                                        </div>

                                                                        <c:forEach var="item2" items="${item.aircraftSeatsList}">
                                                                            <c:if test="${item2.seatsStatus.toString().equals('AVAILABLE')}">
                                                                                <c:choose>
                                                                                    <c:when test="${item2.seatsType.toString() == 'ECONOMY'}">
                                                                                        <c:set var="ECONOMY"
                                                                                               value="ECONOMY"/>
                                                                                        <c:set var="economySeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                    </c:when>
                                                                                    <c:when test="${item2.seatsType.toString() == 'FIRST_CLASS'}">
                                                                                        <c:set var="FIRSTCLASS"
                                                                                               value="FIRSTCLASS"/>
                                                                                        <c:set var="firstClassSeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                    </c:when>
                                                                                    <c:when test="${item2.seatsType.toString() == 'BUSINESS'}">
                                                                                        <c:set var="BUSINESS"
                                                                                               value="BUSINESS"/>
                                                                                        <c:set var="businessSeatPrice"
                                                                                               value="${item2.price}"/>
                                                                                        <%--    <fmt:parseNumber
                                                                                                    var="businessQuantity"
                                                                                                    type="number"
                                                                                                    value="${businessQuantity + 1}"/>--%>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>


                                                                            <c:if test="${ECONOMY == 'ECONOMY'}">
                                                                                <div class="col">
                                                                                    ECONOMY
                                                                                    <br>
                                                                                    <a href="flightCheck?departFlightId=${departFlight.id}&departSeatType=${departSeatType}&departSeatPrice=${departSeatPrice}&returnFlightId=${item.id}&returnSeatType=ECONOMY&returnSeatPrice=${economySeatPrice}"
                                                                                       class="btn btn-outline-dark">
                                                                                        $${economySeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${FIRSTCLASS == 'FIRSTCLASS'}">
                                                                                <div class="col">
                                                                                    FIRST CLASS
                                                                                    <br>
                                                                                    <a href="flightCheck?departFlightId=${departFlight.id}&departSeatType=${departSeatType}&departSeatPrice=${departSeatPrice}&returnFlightId=${item.id}&returnSeatType=FIRST_CLASS&returnSeatPrice=${firstClassSeatPrice}"
                                                                                       class="btn btn-outline-dark">
                                                                                        $${firstClassSeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${BUSINESS == 'BUSINESS'}">
                                                                                <div class="col">
                                                                                    BUSINESS
                                                                                    <br>
                                                                                    <a href="flightCheck?departFlightId=${departFlight.id}&departSeatType=${departSeatType}&departSeatPrice=${departSeatPrice}&returnFlightId=${item.id}&returnSeatType=BUSINESS&returnSeatPrice=${businessSeatPrice}"
                                                                                       class="btn btn-outline-dark">
                                                                                        $${businessSeatPrice}
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>


                                                                        <%--<c:forEach var="item1"
                                                                                   items="${item.aircraftSeatsList}">
                                                                            <div class="col">
                                                                                    ${item1.seatsType.seatType}
                                                                                <br>
                                                                                <a href="flightCheck?departFlightId=${departFlight.id}&departSeatId=${departSeat.id}&returnFlightId=${item.id}&returnSeatId=${item1.id}"
                                                                                   class="btn btn-outline-dark">
                                                                                        ${item1.price}$
                                                                                </a>
                                                                            </div>
                                                                        </c:forEach>--%>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

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
</c:if>
<%--<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="social-icons">
                    <li><a href="https://www.facebook.com/tooplate"><i style="margin-top: 30px;"
                                                                       class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i style="margin-top: 30px;" class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i style="margin-top: 30px;" class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i style="margin-top: 30px;" class="fa fa-rss"></i></a></li>
                    <li><a href="#"><i style="margin-top: 30px;" class="fa fa-behance"></i></a></li>
                </ul>
            </div>
            <div class="col-md-12">
                <p>Copyright &copy; 2018 Flight Tour and Travel Company

                    | Design: <a href="https://www.tooplate.com/view/2093-flight" target="_parent"><em>Flight</em></a>
                </p>
            </div>
        </div>
    </div>
</footer>--%>
<jsp:include page="include/footer1.jsp"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
</body>
</html>
