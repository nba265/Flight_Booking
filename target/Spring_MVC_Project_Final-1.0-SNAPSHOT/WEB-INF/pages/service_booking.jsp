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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Flight - Travel and Tour</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dialog.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

    <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/seat_plane.css">
    <style>
        .disabled_link:hover {
            cursor: not-allowed;
        }

        #fight_route span {
            font-size: 16px;
            line-height: 18px;
            font-weight: bold;
            color: #00305B;
        }

        #weather {
            margin-top: 20px;
        }

        h1, h2 {
            color: white;
        }

    </style>
</head>
<body>
<jsp:include page="include/header1.jsp"/>


<div id="weather">
    <div class="container">
        <div class="row">
            <div class="wrapper">
                <div class="col-md-12">
                    <div class="weather-content"
                         style="background-image: url(https://i.pinimg.com/736x/8f/c0/8f/8fc08fd48cd8eda6dfca9ef25047c865.jpg)">
                        <div class="row">
                            <div class="col-md-12">
                                <ul id="tab" class="tabs clearfix info_link pl-0"><%--
                                    <li><a style="background-color:#45484b " href="#" aria-readonly="true">Select
                                        Flight</a></li>--%>
                                    <li><a style="background-color: #45484b;" href="seat_booking">Seat Selection</a>
                                    </li>
                                    <li><a style="background-color: #45484b;" href="passenger">Passenger</a></li>
                                    <li><a style="background-color: #dcdb40;" href="#" class="disabled_link"
                                           aria-readonly="true">Extra</a></li>
                                    <%--<li><a style="background-color: #45484b;" href="#" class="disabled_link"
                                           aria-readonly="true">Payment</a></li>--%>
                                </ul>
                            </div>
                            <c:if test="${check.equals('return')}">
                                <c:set var="flightId" value="${booking.returnFlight.id}"/>
                            </c:if>
                            <c:if test="${check.equals('depart')}">
                                <c:set var="flightId" value="${booking.departFlight.id}"/>
                            </c:if>
                            <div class="col-md-12">
                                <section id="second-tab-group" class="weathergroup">
                                    <div id="monday">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <a id="submit" href="payment"
                                                   class="btn btn-lg btn-outline-success mx-auto">
                                                    Continue
                                                </a>
                                            </div>
                                            <form:form action="doAddServiceBooking" modelAttribute="booking"
                                                       method="get" cssClass="col-md-12">
                                                <c:forEach var="item2" varStatus="status"
                                                           items="${sessionScope.booking.booking.bookingDetailEntity}">
                                                    <c:choose>
                                                        <c:when test="${item2.flightsEntity.id == booking.departFlight.id && status.first }">
                                                            <h1>Depart Service Booking</h1>
                                                        </c:when>
                                                        <c:when test="${sessionScope.booking.flightAndSeat.ifRoundTrip() && (status.index == sessionScope.booking.booking.bookingDetailEntity.size()/2) }">
                                                            <h1>Return Service Booking</h1>
                                                        </c:when>
                                                    </c:choose>
                                                    <h2>${item2.passengersEntity.fullName}</h2>
                                                    <c:forEach var="item" items="${serviceList}"
                                                               varStatus="status1">
                                                        <div style="margin-bottom: 2em" class="col-md-12">
                                                            <div class="weather-item"
                                                                 style="padding: 2%;background-color: rgb(255 232 232 / 61%) !important;">
                                                                <div class="container">
                                                                    <div class="row row-cols-3 align-items-center">
                                                                        <div style="width: 33.333333%"
                                                                             class="col col-md-3">
                                                                            <div id="carouselExampleControls${status.index}${status1.index}"
                                                                                 class="carousel slide"
                                                                                 data-bs-ride="carousel"
                                                                                 style="width: 100%;">
                                                                                <!-- The slideshow -->
                                                                                <div class="carousel-inner">
                                                                                    <c:forEach
                                                                                            items="${item.imageEntities}"
                                                                                            var="image"
                                                                                            varStatus="stat">
                                                                                        <c:if test="${stat.first}">
                                                                                            <div class="carousel-item active" >
                                                                                                <img style="height: 150px !important;"
                                                                                                     src="${pageContext.request.contextPath}/resources/images/${image.name}"
                                                                                                     alt="" width="200"
                                                                                                     height="150">
                                                                                            </div>
                                                                                        </c:if>
                                                                                        <c:if test="${not stat.first}">
                                                                                            <div class="carousel-item" >
                                                                                                <img style="height: 150px !important;"
                                                                                                     src="${pageContext.request.contextPath}/resources/images/${image.name}"
                                                                                                     alt="" width="200"
                                                                                                     height="150">
                                                                                            </div>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </div>
                                                                                <!-- Left and right controls -->
                                                                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${status.index}${status1.index}" data-bs-slide="prev">
                                                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                                    <span class="visually-hidden">Previous</span>
                                                                                </button>
                                                                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${status.index}${status1.index}" data-bs-slide="next">
                                                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                                    <span class="visually-hidden">Next</span>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <div style="width: 33.333333%"
                                                                             class="col col-md-6">
                                                                            <h3>${item.name}</h3>
                                                                            <h3 style="color: #8d0600;font-style: italic">
                                                                                $${item.price}</h3>
                                                                            <i class="fa fa-info">
                                                                                    ${item.description}
                                                                            </i>
                                                                        </div>
                                                                        <div style="width: 33.333333%"
                                                                             class="col col-md-3">
                                                                            <p class="mb-4 pb-2 text-danger">
                                                                                Quantity</p>
                                                                            <c:set var="value" value="0"/>
                                                                            <c:forEach var="item1"
                                                                                       items="${item2.serviceBookingEntities}">
                                                                                <c:if test="${item1.serviceEntity.id == item.id}">
                                                                                    <c:set var="value"
                                                                                           value="${item1.quantity}"/>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <c:choose>
                                                                                <c:when test="${item2.flightsEntity.id == booking.departFlight.id}">
                                                                                    <input type="number"
                                                                                           class="form-control"
                                                                                           style="padding: 2px 12px ;"
                                                                                           data-id="${item.id}"
                                                                                           data-foo="${item2.seatsEntity.id}"
                                                                                           data-flightid="${sessionScope.booking.departFlight.id}"
                                                                                           name="serviceDepart[${status.index}].quantity"
                                                                                           id="quantity"
                                                                                           value="${value}"
                                                                                           min="0"/>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="number"
                                                                                           class="form-control"
                                                                                           style="padding: 2px 12px ;"
                                                                                           data-id="${item.id}"
                                                                                           data-foo="${item2.seatsEntity.id}"
                                                                                           data-flightid="${sessionScope.booking.returnFlight.id}"
                                                                                           name="serviceDepart[${status.index}].quantity"
                                                                                           id="quantity"
                                                                                           value="${value}"
                                                                                           min="0"/>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:forEach>
                                                <%-- </c:if>--%>
                                                <div class="float-lg-right">
                                                    <h2 style="color: white">Total: $<i id="total">0</i></h2>
                                                </div>
                                                <br><br>
                                            </form:form>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('.info_link a').click(function () {
            if ($(this).attr('href') != null)
                window.location.href = $(this).attr('href');
        });
    });

    $(document).ready(function () {

        $('#total').text(${total})

        $('input[type="number"]').change(function () {
            let btn = $(this);
            let id = btn.data('id');
            let quantity = btn.val();
            let seat_id = btn.data('foo');
            let flightId = btn.data('flightid')
            $.ajax({
                url: 'changeItemServiceQuantity',
                type: 'GET',
                data: {
                    "serviceId": id,
                    "quantity": quantity,
                    "flightId": flightId,
                    "seat_id": seat_id
                },
                success: function (data) {
                    //response from controller
                    /*document.getElementById("total").innerHTML = "$" + data;*/
                    $('#total').text(data)
                }
            })
        });
    })
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap-input-spinner.js"></script>
<script>
    $("input[type='number']").inputSpinner()
</script>
</body>
</html>
