<%--
  Created by IntelliJ IDEA.
  User: bbb26
  Date: 03/28/22
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Flight - Travel and Tour</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap.min.css"
          type="text/css">
    <%--<link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/bootstrap4.5/bootstrap-grid.min.css"
          type="text/css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-theme.min.css"
          type="text/css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/datepicker.css"
          type="text/css">--%>
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/hero-slider.css"
          type="text/css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl-carousel.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/tooplate-style.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

    <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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

        .pass-info input, select, option {
            height: 4rem;
        }

        #promotion {
            visibility: hidden;
            height: 0;
        }

        #promotion button:focus {
            outline: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light bg-light" style="min-height: 60px; margin-bottom: 0; border: 0;
                                                background: linear-gradient(90deg, rgba(5,41,48,1) 19%, rgba(107,135,140,1) 42%, rgba(204,235,241,1) 73%);">
    <a class="navbar-brand" href="index">
        <img src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
             alt="Flight Template" class="d-inline-block align-text-top"
             style="max-width: 70%; padding-left: 2rem;">
    </a>
    <div class="clearfix" style="margin-right: 30px">
        <sec:authorize access="isAuthenticated()">
            <sec:authorize access="hasRole('ROLE_USER')">
                <a type="button" class="btn btn-outline-warning float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary float-right mr-5" href="user/booking_history">Manage Account</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <a type="button" class="btn btn-outline-warning float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary float-right mr-5" href="admin/home">Manager</a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MANAGER')">
                <a type="button" class="btn btn-outline-warning float-right" href="logout">Logout</a>
                <a class="btn btn-outline-primary float-right mr-5" href="manager/home">Manager</a>
            </sec:authorize>
            <h5 class="float-right mr-5 text-center text-monospace text-black-50"><sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username" /> </sec:authorize></h5>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a type="button" class="btn btn-outline-warning float-right" href="login">Login</a>
        </sec:authorize>
    </div>
</nav>
<br>

<c:if test="${sessionScope.booking.message != null}">
    <div style="width: 100%">
    <h3  class="text-danger text-center">${sessionScope.booking.message}</h3>
    </div>
</c:if>

<div class="container d-flex justify-content-center mt-5 mb-5">
    <div class="row g-3">
        <div class="col-md-6"><span>Payment Method</span>
            <div class="card">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header p-0">
                            <h2 class="mb-0">
                                <button class="btn btn-light btn-block text-left p-3 rounded-0" <%--data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"--%>>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <span>Credit card</span>
                                        <div class="icons">
                                            <img src="https://i.imgur.com/2ISgYja.png" width="30">
                                            <img src="https://i.imgur.com/W1vtnOV.png" width="30">
                                            <img src="https://i.imgur.com/35tC99g.png" width="30">
                                            <img src="https://i.imgur.com/2ISgYja.png" width="30"></div>
                                    </div>
                                </button>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                             data-parent="#accordionExample">
                            <form:form action="checkPayment" method="get" modelAttribute="credit-card">
                                <div class="card-body payment-card-body">
                                    <span class="font-weight-normal card-text">Name</span>
                                    <div class="input"><i class="fa"></i>
                                        <input name="name" required type="text" class="form-control"  placeholder="FULL NAME" value="${sessionScope.booking.creditCardEntity.name}">
                                    </div>
                                    <span class="font-weight-normal card-text">Card Number</span>
                                    <div class="input"><i class="fa fa-credit-card"></i>
                                        <input name="cardNumber" type="tel" inputmode="numeric" class="form-control" pattern="[0-9\s]{13,19}" maxlength="19"
                                               required value="${sessionScope.booking.creditCardEntity.cardNumber}"
                                               placeholder="0000 0000 0000 0000">
                                    </div>
                                    <div class="row mt-3 mb-3">
                                        <div class="col-md-4"><span
                                                class="font-weight-normal card-text" style="font-size: 13px;">Expiry Month</span>
                                            <div class="input"><i class="fa fa-calendar"></i> <input type="number"
                                                                                                     max="12"
                                                                                                     name="expMonth"
                                                                                                     min="1" max="12"
                                                                                                     class="form-control"
                                                                                                     required
                                                                                                     value="${sessionScope.booking.creditCardEntity.expMonth}"
                                                                                                     placeholder="MM">
                                            </div>
                                        </div>
                                        <div class="col-md-4"><span
                                                class="font-weight-normal card-text" style="font-size: 13px;">Expiry Year</span>
                                            <div class="input"><i class="fa fa-calendar"></i><input type="number"
                                                                      min="1"
                                                                      max="99"
                                                                      name="expYear"
                                                                      class="form-control"
                                                                      required value="${sessionScope.booking.creditCardEntity.expYear}"
                                                                      placeholder="YY">
                                            </div>
                                        </div>
                                        <div class="col-md-4"><span class="font-weight-normal card-text" style="font-size: 15px;">CVC</span>
                                            <div class="input"><i class="fa fa-lock"></i> <input type="number"
                                                                                                 name="cvvCode"
                                                                                                 class="form-control"
                                                                                                 required value="${sessionScope.booking.creditCardEntity.cvvCode}"
                                                                                                 placeholder="000">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-3">
                                        <button type="submit" class="btn btn-primary btn-block free-button">Submit
                                        </button>
                                        <div class="text-center"><a class="btn btn-link border-0" id="have-promotion">Have a promo code?</a>
                                            <div id="promotion">
                                                <input id="input-promotion" class="form-control h-50 mb-2" type="text"
                                                       maxlength="10" name="promotion">
                                                <button type="button" id="add-promotion"
                                                        class="btn btn-outline-success btn-sm">Add
                                                </button>
                                                <div class="text-danger" id="message"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="text-muted certificate-text"><i class="fa fa-lock"></i> Your transaction is secured with ssl certificate</span>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6"><span>Summary</span>
            <div class="card">
                <div class="p-3">
                    <div class="d-flex justify-content-between ">
                        <span class="fa fa-plane"> ${sessionScope.booking.departFlight.flightRoute.departureAirport.code}
                            <c:choose>
                                <c:when test="${!sessionScope.booking.flightAndSeat.ifRoundTrip()}">
                                    <i class="fa fa-long-arrow-right"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa fa-arrows-h"></i>
                                </c:otherwise>
                            </c:choose>
                            ${sessionScope.booking.departFlight.flightRoute.destinationAirport.code}</span>
                        <span>${sessionScope.booking.departSeatList.size()} Passenger</span>
                    </div>
                    <hr class="mt-0 line">
                    <div class="d-flex justify-content-between">
                        <span class="text-success">
                            Departure: ${sessionScope.booking.departFlight.departureTime},${sessionScope.booking.departFlight.departure}</span>
                        <span id="depart-standard">$<fmt:formatNumber minFractionDigits="0"
                                                                      value="${sessionScope.booking.departFlight.flightRoute.standardPrice}"/></span>
                    </div>
                    <p>${sessionScope.booking.departFlight.flightRoute.departureAirport.name}(${sessionScope.booking.departFlight.flightRoute.departureAirport.code})
                        <i class="fa fa-fighter-jet" aria-hidden="true"></i>
                        ${sessionScope.booking.departFlight.flightRoute.destinationAirport.name}(${sessionScope.booking.departFlight.flightRoute.destinationAirport.code})
                    </p>
                    <div class="d-flex justify-content-between ">
                        <span class="text-primary">Seat(${departSeat.seatsType})</span>
                        <span>$<fmt:formatNumber minFractionDigits="0"
                                                 value="${departSeat.price}"/></span>
                    </div>
                    <p>
                        Duration: ${sessionScope.booking.departFlight.flightRoute.duration.toHoursPart()}h ${sessionScope.booking.departFlight.flightRoute.duration.toMinutesPart()}m
                    </p>
                    <c:if test="${sessionScope.booking.flightAndSeat.ifRoundTrip()}">
                        <c:set var="size" value="${sessionScope.booking.departFlight.id}"/>
                        <div class="d-flex justify-content-between ">
                            <span class="text-success">
                                Arrive: ${sessionScope.booking.returnFlight.departureTime},${sessionScope.booking.returnFlight.departure}</span>
                            <span id="return-standard">$<fmt:formatNumber minFractionDigits="0"
                                                                          value="${sessionScope.booking.returnFlight.flightRoute.standardPrice}"/></span>
                        </div>
                        <p>${sessionScope.booking.returnFlight.flightRoute.departureAirport.name}(${sessionScope.booking.returnFlight.flightRoute.departureAirport.code})
                            <i class="fa fa-fighter-jet" aria-hidden="true"></i>
                                ${sessionScope.booking.returnFlight.flightRoute.destinationAirport.name}(${sessionScope.booking.returnFlight.flightRoute.destinationAirport.code})
                        </p>
                        <div class="d-flex justify-content-between ">
                            <span class="text-primary">Seat(${returnSeat.seatsType})</span>
                            <span>$<fmt:formatNumber minFractionDigits="0"
                                                     value="${returnSeat.price}"/></span>
                        </div>
                        <p>
                            Duration: ${sessionScope.booking.departFlight.flightRoute.duration.toHoursPart()}h ${sessionScope.booking.departFlight.flightRoute.duration.toMinutesPart()}m
                        </p>
                    </c:if>
                    <div id="ticket-seat" class="d-flex justify-content-between ">
                        <span class="text-primary fa fa-long-arrow-right"></span>
                        <span id="ticket-seat-price"><%--$<fmt:formatNumber minFractionDigits="0"
                                                                        value="${ticketAndSeatPrice}"/>--%></span>
                    </div>
                </div>
                <hr class="mt-0 line">
                <div class="p-3">
                    <div class="d-flex justify-content-between "><span
                            class="text-success">Total Service Price</span>
                        <span>$<fmt:formatNumber minFractionDigits="0"
                                                 value="${servicePrice}"/></span>
                    </div>
                </div>
                <hr class="mt-0 line">
                <div class="p-3" style="padding-bottom: 27px !important;">
                    <c:forEach var="item" items="${fee}">
                        <c:choose>
                            <c:when test="${item.name.equals('tax')}">
                                <div class="d-flex justify-content-between"><span>TAX</span>
                                    <span>$<fmt:formatNumber minFractionDigits="0"
                                                             value="${ticketPrice*item.price/100}"/></span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="d-flex justify-content-between"><span>${item.name}</span>
                                    <span>$<fmt:formatNumber minFractionDigits="0"
                                                             value="${item.price*sessionScope.booking.booking.bookingDetailEntity.size()}"/></span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <hr class="mt-0 line">
                <div class="p-3">
                    <div class="d-flex justify-content-between mb-2"><span class="text-success">Total</span>
                        <span id="all-price"><%--$<fmt:formatNumber minFractionDigits="0"
                                                 value="${allPrice}"/>--%></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="d-flex justify-content-center mb-2">
    <a class="btn btn-lg btn-outline-primary" href="service_booking">Back</a>
</div>
<jsp:include page="include/footer1.jsp"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap4.5/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#ticket-seat-price').text("$" + ${ticketAndSeatPrice})
        $('#all-price').text("$" + ${allPrice})
        $('#have-promotion').click(function () {
            let visibility = $('#promotion').css("visibility");
            if (visibility === "hidden") {
                $('#promotion').css("visibility", "visible")
                $('#promotion').css("height", "5rem")
            } else {
                $('#promotion').css("visibility", "hidden")
                $('#promotion').css("height", "0")
            }
        });
        $('#add-promotion').click(function () {
            let code = $('#input-promotion').val();
            $.ajax({
                url: 'addPromotion',
                type: 'GET',
                data: {
                    "code": code
                },
                success: function (data) {
                    //response from controller
                    $('#message').text(data);
                    if (data === "Success!!") {
                        window.location.reload()
                    }
                }
            })
        });
    });
</script>
</body>
</html>
