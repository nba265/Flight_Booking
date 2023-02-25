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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/seat_plane.css">
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
    </style>
</head>
<body>
<jsp:include page="include/header1.jsp"/>
<c:if test="${check.equals('return')}">
    <c:set var="flight" value="${booking.returnFlight}"/>
    <c:set var="seatList" value="${booking.returnSeatList}"/>
    <c:set var="seatType" value="${booking.flightAndSeat.returnSeatType}"/>
</c:if>
<c:if test="${check.equals('depart')}">
    <c:set var="flight" value="${booking.departFlight}"/>
    <c:set var="seatList" value="${booking.departSeatList}"/>
    <c:set var="seatType" value="${booking.flightAndSeat.departSeatType}"/>
</c:if>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2 id="fight_route">
                <i></i>
                <strong>${flight.flightRoute.departureAirport.name}</strong>
                <span> (${flight.flightRoute.departureAirport.code}) to </span>
                <strong>${flight.flightRoute.destinationAirport.name} </strong>
                <span> (${flight.flightRoute.destinationAirport.code})</span>
                <br>
                <br>
                <span>Departure Date: ${flight.departure}</span>
            </h2>
        </div>
    </div>
</div>
<div id="weather">
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <div class="col-md-12">
                    <div class="weather-content">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="tabs clearfix info_link">
                                    <%--<li><a style="background-color:#45484b " href="#" aria-readonly="true">Select
                                        Flight</a></li>--%>
                                    <li><a style="background-color: #dcdb40;" href="#" class="disabled_link"
                                           aria-readonly="true">Seat Selection</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Passenger</a></li>
                                    <li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Extra</a></li>
                                    <%--<li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Payment</a></li>--%>
                                </ul>
                            </div>
                            <div style="padding-top:5em " class="col-md-12">
                                <div style="padding-top:2em " class=" border border-primary rounded-pill">
                                    <p>---------------------------------------------------------------------------------------------------------------</p>
                                    <p>  You have selected <i id="quantity">0</i> seats for a price of
                                        <i id="price">$0</i></p>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <section id="second-tab-group" class="weathergroup">
                                    <div id="monday">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="plane" style="width: ${(flight.aircraft.col*60)+ 20}px;min-width: 200px">
                                                    <div class="cockpit">
                                                        <h1>${flight.aircraft.name} ${flight.aircraft.number}</h1>
                                                        <h3>${flight.flightRoute.departureAirport.code}
                                                            -> ${booking.departFlight.flightRoute.destinationAirport.code}</h3>
                                                        <h3>${flight.flightRoute.duration.toHoursPart()}h${flight.flightRoute.duration.toMinutesPart()}m</h3>
                                                        <h3>${flight.departureTime}</h3>
                                                    </div>
                                                    <div class="exit exit--front fuselage">
                                                    </div>
                                                    <ol class="cabin fuselage">
                                                        <li class="">
                                                            <ol class="seats" id="seats">
                                                                <c:set var="col"
                                                                       value="${flight.aircraft.col}"/>
                                                                <c:forEach var="item"
                                                                           items="${flight.aircraftSeatsList}"
                                                                           varStatus="i">
                                                                <c:if test="${item.seatsType.toString() == seatType}">
                                                                <c:choose>
                                                                <c:when test="${(i.index) % col != 0 }">
                                                                    <c:choose>
                                                                        <c:when test="${(item.seatsStatus.toString() != 'AVAILABLE' && item.seatsStatus.toString() != 'PROCESSING') || item.seatsType.toString() != seatType }">
                                                                            <li class="seat">
                                                                                <input type="checkbox"
                                                                                       id="${item.seat.number}"
                                                                                       disabled/>
                                                                                <label style="padding: 16px 0;"
                                                                                       for="${item.seat.number}">${item.seat.number}</label>
                                                                            </li>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:choose>
                                                                                <c:when test="${seatList.contains(item.seat.number)}">
                                                                                    <li class="seat">
                                                                                        <input type="checkbox"
                                                                                               name="selectedSeat"
                                                                                               id="${item.seat.number}"
                                                                                               data-id="${item.seat.number}"
                                                                                               value="${item.price}"
                                                                                               checked/>
                                                                                        <label style="padding: 16px 0;"
                                                                                               for="${item.seat.number}">${item.seat.number}</label>
                                                                                    </li>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <li class="seat">
                                                                                        <input type="checkbox"
                                                                                               name="selectedSeat"
                                                                                               id="${item.seat.number}"
                                                                                               data-id="${item.seat.number}"
                                                                                               value="${item.price}"/>
                                                                                        <label style="padding: 16px 0;"
                                                                                               for="${item.seat.number}">${item.seat.number}</label>
                                                                                    </li>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:when>
                                                                <c:otherwise>
                                                            </ol>
                                                        </li>
                                                        <li class="">
                                                            <ol class="seats">
                                                                <c:choose>
                                                                    <c:when test="${(item.seatsStatus.toString() != 'AVAILABLE' && item.seatsStatus.toString() != 'PROCESSING') || item.seatsType.toString() != seatType }">
                                                                        <li class="seat">
                                                                            <input type="checkbox"
                                                                                   id="${item.seat.number}"
                                                                                   data-id="${item.seat.number}"
                                                                                   value="${item.seat.number}"
                                                                                   name="selectedSeat"
                                                                                   disabled/>
                                                                            <label style="padding: 16px 0;"
                                                                                   for="${item.seat.number}">${item.seat.number}</label>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:when test="${seatList.contains(item.seat.number)}">
                                                                        <li class="seat">
                                                                            <input type="checkbox"
                                                                                   name="selectedSeat"
                                                                                   id="${item.seat.number}"
                                                                                   data-id="${item.seat.number}"
                                                                                   value="${item.price}"
                                                                                   checked/>
                                                                            <label style="padding: 16px 0;"
                                                                                   for="${item.seat.number}">${item.seat.number}</label>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li class="seat">
                                                                            <input type="checkbox"
                                                                                   id="${item.seat.number}"
                                                                                   data-id="${item.seat.number}"
                                                                                   value="${item.price}"
                                                                                   name="selectedSeat"
                                                                            />
                                                                            <label style="padding: 16px 0;"
                                                                                   for="${item.seat.number}">${item.seat.number}</label>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                </c:otherwise>
                                                                </c:choose>
                                                                </c:if>
                                                                </c:forEach>
                                                            </ol>
                                                        </li>
                                                    </ol>
                                                    <div class="exit exit--back fuselage">
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${check.equals('depart') && sessionScope.booking.flightAndSeat.ifRoundTrip() }">
                                                        <a id="submit" href="returnSeatBooking"
                                                           class="btn btn-lg btn-outline-success"
                                                           style="visibility: hidden">
                                                            Select Return Seat
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a id="submit" href="passenger"
                                                           class="btn btn-lg btn-outline-success"
                                                           style="visibility: hidden">
                                                            Continue
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
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

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $('.scroll-top').on('click', function (event) {
            event.preventDefault();
            $('html, body').animate({scrollTop: 0}, 'slow');
        });

        let check = '${check}';
        let temp = $('input:checkbox').not(":disabled");
        let checked = $('input:checkbox:checked');

       /* if (check === 'return') {*/
            if (checked.length === ${booking.flightAndSeat.quantity}) {
                $('input:checkbox:not(:checked)').not(":disabled").attr('disabled', true);
                document.getElementById('submit').style.visibility = 'visible';
            } else {
                temp.removeAttr('disabled');
                document.getElementById('submit').style.visibility = 'hidden';
            }
       /* }
        else{
            if (checked.length > 0) {
                document.getElementById('submit').style.visibility = 'visible';
            } else {
                document.getElementById('submit').style.visibility = 'hidden';
            }
        }*/

        $('input[type="checkbox"]').change(function () {

            setTimeout(function(){

            },2000);

            let quantity = document.getElementById("quantity");
            /*let quantity = $('#quantity');*/
            let checked = $('input:checkbox:checked');
            quantity.innerHTML = checked.length;
            let btn = $(this);
            let id = btn.data('id');
            let totalPrice = parseFloat(quantity.textContent) * parseFloat(btn.val());
            document.getElementById("price").innerHTML = '$' + totalPrice.toString();

           /* if (check === 'return') {*/
                if (checked.length >= ${booking.flightAndSeat.quantity}) {
                    $('input:checkbox:not(:checked)').not(":disabled").attr('disabled', true);
                    document.getElementById('submit').style.visibility = 'visible';
                } else {
                    temp.removeAttr('disabled');
                    document.getElementById('submit').style.visibility = 'hidden';
                }
           /* }
            else {
                if (checked.length > 0) {
                    document.getElementById('submit').style.visibility = 'visible';
                } else {
                    document.getElementById('submit').style.visibility = 'hidden';
                }
            }*/

            if ($(this).prop("checked") === false) {
                $.ajax({
                    url: 'uncheckSeat',
                    type: 'GET',
                    data: {
                        "seatNumber": id,
                        "flightId": ${flight.id}
                    },
                    success: function (data) {
                        if(data === false){
                            alert("Error, Pls try again!!!");
                            document.getElementById(id).checked = true;
                            temp.attr('disabled', true);
                        }
                    },
                    error:function (){
                        alert("Error, Pls try again!!!");
                        document.getElementById(id).checked = true;
                        temp.attr('disabled', true);
                    }
                })
            } else {
                $.ajax({
                    url: 'checkSeat',
                    type: 'GET',
                    data: {
                        "seatNumber": id,
                        "flightId": ${flight.id}
                    },
                    success: function (data) {
                        //response from controller
                        if(data === 0){
                            alert("This seat has been ordered!!!")
                            document.getElementById(id).checked = false;
                            temp.removeAttr('disabled');
                            document.getElementById('submit').style.visibility = 'hidden';
                          /*  window.location.reload();*/
                        }
                        else if (data === -1 ){
                            alert("Error, Pls try again!!!");
                            document.getElementById(id).checked = false;
                            temp.removeAttr('disabled');
                            document.getElementById('submit').style.visibility = 'hidden';
                        }
                    },
                    error:function (){
                        alert("Error, Pls try again!!!");
                        document.getElementById(id).checked = false;
                        temp.removeAttr('disabled');
                        document.getElementById('submit').style.visibility = 'hidden';
                    }
                })
            }
        })
        ;
    })
</script>

</body>
</html>
