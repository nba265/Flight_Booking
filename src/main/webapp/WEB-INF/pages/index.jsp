<%--
  Created by IntelliJ IDEA.
  User: bbb26
  Date: 03/27/22
  Time: 5:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Flight - Travel and Tour</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-theme.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/datepicker.css">
    <%-- <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css">--%>
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/hero-slider.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/owl-carousel.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/tooplate-style.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" type="text/css">

    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet"/>

    <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <script>
        function hdl_change(e) {
            document.getElementById('date2').style.visibility =
                e.checked && e.id === 'opt_2' ? 'visible' : 'hidden';
            document.getElementById('return').required =
                e.checked && e.id === 'opt_2';
            if ((e.checked && e.id !== 'opt_2')) {
                document.getElementById('return').value = '';
            }
        }

        function format() {
            /*$( "#departure" ).datepicker({
                format: 'YYYY-MM-DD'
            });*/
            alert(document.getElementById('departure').value);
        }
    </script>
    <style>
        .error {
            color: red;
            font-style: italic;
            margin: 10px 0 0 0;
            font-size: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<section class="banner" id="top">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="left-side">
                    <div class="logo">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
                             alt="Flight Template">
                    </div>
                    <div style="margin-top: 1rem">
                        <%--<c:choose>
                            <c:when test="${pageContext.request.userPrincipal.authenticated}">
                                <a type="button" class="btn btn-outline-warning btn-lg float-right" href="logout">Logout</a>
                                <a class="btn btn-outline-warning btn-lg float-right" href="user/home">Manage Account</a>
                            </c:when>
                            <c:otherwise>
                                <a type="button" class="btn btn-outline-warning btn-lg float-right" href="login">Login</a>
                            </c:otherwise>
                        </c:choose>--%>
                        <sec:authorize access="isAuthenticated()">
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <a type="button" class="btn btn-outline-warning btn-lg float-right"
                                   href="logout">Logout</a>
                                <a class="btn btn-outline-warning btn-lg float-right mr-5" href="user/booking_history">Manage
                                    Account</a>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a type="button" class="btn btn-outline-warning btn-lg float-right"
                                   href="logout">Logout</a>
                                <a class="btn btn-outline-warning btn-lg float-right mr-5" href="admin/home">Manager</a>
                            </sec:authorize>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <a type="button" class="btn btn-outline-warning btn-lg float-right" href="login">Login</a>
                        </sec:authorize>
                    </div>
                    <div class="tabs-content" style="margin-top: 30px;">
                        <h4>Choose Your Direction:</h4>
                        <ul class="social-links">
                            <li><a href="https://facebook.com">Find us on <em>Facebook</em><i
                                    class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="https://youtube.com">Our <em>YouTube</em> Channel<i
                                    class="fa fa-youtube"></i></a></li>
                            <li><a href="https://instagram.com">Follow our <em>instagram</em><i
                                    class="fa fa-instagram"></i></a></li>
                        </ul>
                        <div id="contact" class="page-direction-button">
                            <a href="tel:0766601064"><i
                                    class="fa fa-phone"></i>Contact Us Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="search" class="col-md-5 col-md-offset-1">
                <section id="first-tab-group" class="tabgroup">
                    <div id="tab1">
                        <div class="submit-form">
                            <h4>Check availability for <em>direction</em>:</h4>
                            <form:form id="form-submit" modelAttribute="flights" action="search" method="get">
                                <div class="row">
                                    <div class="col-md-6">
                                        <fieldset>
                                            <label for="from">From:</label>
                                            <select id="from" required name='flightRoute.departureAirport.name'>
                                                <option value="">Select a location...</option>
                                                <c:forEach var="item" items="${airports}">
                                                    <option value="${item.name}">${item.name}</option>
                                                </c:forEach>
                                            </select>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <label for="to">To:</label>
                                            <select id="to" required name="flightRoute.destinationAirport.name">
                                                <option value="">Select a location...</option>
                                                <c:forEach var="item" items="${airports}">
                                                    <option value="${item.name}">${item.name}</option>
                                                </c:forEach>
                                            </select>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6" id="date1">
                                        <fieldset>
                                            <label for="departure">Departure date:</label>
                                            <input name="departure" type="text" class="form-control" id="departure"
                                                   placeholder="Select date..." required onchange="checkDepartDate()"
                                                   style="font-size: 12px;margin-left: 0;border: none;background-color: #e7e7e7;color: #9a9a9a;">
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6" id="date2" style="visibility:hidden">
                                        <fieldset>
                                            <label for="return">Return date:</label>
                                            <input name="return" type="text" class="form-control" id="return"
                                                   placeholder="Select date..."
                                                   style="font-size: 12px;margin-left: 0;border: none;background-color: #e7e7e7;color: #9a9a9a;"
                                                   onchange="checkReturnDate()">
                                        </fieldset>
                                    </div>
                                    <div id="checkDate" class="col-md-12"></div>
                                    <div class="col-md-6">
                                        <div class="radio-select">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6 col-xs-6">
                                                    <label for="opt_1">Oneway</label>
                                                    <input type="radio" name="trip" id="opt_1" value="oneway"
                                                           required="required" onchange="hdl_change(this)" checked>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-6">
                                                    <label for="opt_2">Round</label>
                                                    <input type="radio" name="trip" id="opt_2" value="round"
                                                           onchange="hdl_change(this)">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <button type="submit" <%--id="form-submit"--%> class="btn"
                                            ">Order Ticket
                                            Now
                                            </button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>

<div style="text-align: center;margin: 5rem 0">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-6">
                <fieldset>
                    <label for="from1">From:</label>
                    <select class="form-control" id="from1" name='depart'>
                        <option value="">Select a location...</option>
                        <c:forEach var="item" items="${airports}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
            </div>
            <div class="col-xs-12 col-md-6">
                <fieldset>
                    <label for="to1">To:</label>
                    <select class="form-control" id="to1" required name="des">
                        <option value="">Select a location...</option>
                        <c:forEach var="item" items="${airports}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </fieldset>
            </div>
        </div>
        <br><br>
    </div>
    <div class="container table-bordered">
        <div id="search-home" class="row">
        </div>
    </div>
</div>


<section class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="service-item first-service">
                    <div class="service-icon"></div>
                    <h4>Easy Booking</h4>
                    <p>Providing a variety of services including booking as well as side stuffs </p>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-item second-service">
                    <div class="service-icon"></div>
                    <h4>Handful website</h4>
                    <p>Can be easily accessed from all over the world, which is a goal to achieve</p>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-item third-service">
                    <div class="service-icon"></div>
                    <h4>Best Support</h4>
                    <p>Support offices are available 24/7 in order to help customer anytime and anywhere</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>




<section id="most-visited">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Most Visited Places</h2>
                </div>
            </div>
            <div class="col-md-12">
                <div id="owl-mostvisited" class="owl-carousel owl-theme">
                    <c:forEach items="${airports}" var="item">
                        <div class="item col-md-12">
                            <div class="visited-item">
                                <img src="${pageContext.request.contextPath}/resources/images/${item.imageList.get(0).name}"
                                     alt="" width="200" height="200">
                                <div class="text-content">
                                    <span>${item.name}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                 <%--   <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-02.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Lorem ipsum dolor</h4>
                                <span>Tokyo</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-03.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Proin dignissim</h4>
                                <span>Paris</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-04.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Fusce sed ipsum</h4>
                                <span>Hollywood</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-02.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Vivamus egestas</h4>
                                <span>Tokyo</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-01.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Aliquam elit metus</h4>
                                <span>New York</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-03.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Phasellus pharetra</h4>
                                <span>Paris</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-04.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>In in quam efficitur</h4>
                                <span>Hollywood</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-01.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Sed faucibus odio</h4>
                                <span>NEW YORK</span>
                            </div>
                        </div>
                    </div>
                    <div class="item col-md-12">
                        <div class="visited-item">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/place-02.jpg"
                                 alt="">
                            <div class="text-content">
                                <h4>Donec varius porttitor</h4>
                                <span>Tokyo</span>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>


<%--<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="primary-button">
                    <a href="#" class="scroll-top">Back To Top</a>
                </div>
            </div>
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

<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<%--<script src="https://unpkg.com/js-datepicker"></script>--%>
<script type="text/javascript">

    $(document).ready(function () {
        /*$("#departure").datepicker({
            numberOfMonths: 2,
            onSelect: function(selected) {
                $("#return").datepicker("option","minDate", selected)
            }
        });
        $("#return").datepicker({
            numberOfMonths: 2,
            onSelect: function(selected) {
                $("#departure").datepicker("option","maxDate", selected)
            }
        });*/

        $('.scroll-link').on('click', function (event) {
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function (event) {
            event.preventDefault();
            $('html, body').animate({scrollTop: 0}, 'slow');
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });

    // scroll function
    function scrollToID(id, speed) {
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop: targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }

    if (typeof console === "undefined") {
        console = {
            log: function () {
            }
        };
    }
</script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
<script type="text/javascript">
    let $from = $("#departure").datepicker('getDate');
    let $to = $("#return").datepicker('getDate');
    let dateFormat = "yy-mm-dd";
    let $from1 = $('select[id$=from1]');
    let $to1 = $('select[id$=to1]');
    $(document).ready(function () {
        let fromID = $from1.val();
        let toID = $to1.val();
        if(fromID === '' && toID === '')
        {
            $.ajax({
                type: 'GET',
                url: 'search_home',
                dataType: 'json',
                data: {
                    "departure_id": fromID,
                    "destination_id": toID,
                },
                contentType: 'application/json',
                success: function (data) {
                    showFlight(data);
                },
                error: function () {
                    alert('error');
                }
            });
        }

        $('input[id$=departure]').datepicker({
            dateFormat: dateFormat,
            minDate: new Date()
        }).on("change", function () {
            $('input[id$=return]').datepicker("option", "mibDate", getDate(this));
        })
        ;

        $('input[id$=return]').datepicker({
            dateFormat: dateFormat,
            minDate: new Date()
        }).on("change", function () {
            $('input[id$=departure]').datepicker("option", "maxDate", getDate(this));
        });

        $('select[id$=from1]').on("change", function () {
            document.getElementById('search-home').innerHTML = "";
            search();
        });
        $('select[id$=to1]').on("change", function () {
            document.getElementById('search-home').innerHTML = "";
            search();
        });
    });

    function showFlight(data) {
        let i = 0, len = data.length;
        for (; i < len; ++i) {
            const flight = data[i];
            $('#search-home').append('<div class="col-md-4 table-bordered" style="margin: 0.5rem 0">' +
                '<div>' +
                '<div><img src="${pageContext.request.contextPath}/resources/images/' + flight.destinationImageName + '" width="200" height="200"> </div> <br>' +
                '<div><h4>' + flight.departureAirport + '(' + flight.departureAirportCode + ') to ' + flight.destinationAirport + '(' + flight.destinationAirportCode + ')</h4>' +
                ' <h4>Departure:' + flight.date + '</h4>' +
                ' <h4>From</h4><h5>' + flight.price + '$</h5>' +
                '</div> ' +
                '<button name="setFlight" class="btn btn-success" onclick="setFlight(\'' + flight.departureAirport + '\',\'' + flight.destinationAirport + '\',\'' + flight.date + '\')" >Select</button> ' +
                '</div> ' +
                '</div>');
        }
    }

    function search() {
        let fromID = $from1.val();
        let toID = $to1.val();
        $.ajax({
            type: 'GET',
            url: 'search_home',
            dataType: 'json',
            data: {
                "departure_id": fromID,
                "destination_id": toID,
            },
            contentType: 'application/json',
            success: function (data) {
                showFlight(data);
            },
            error: function () {
                alert('error');
            }
        });
    }

    function setFlight(departureAirport, destinationAirport, date) {
        $("#from").val(departureAirport);
        $("#to").val(destinationAirport);
        $("#departure").val(date);
        document.getElementById("search").scrollIntoView({behavior: "smooth"})
    }


    function checkDepartDate() {
        if ($from > $to && $from != null && $to != null) {
            document.getElementById('checkDate').innerHTML = "<p class='error'>Return Date must not before Departure Date</p>";
            document.getElementById('departure').value = '';
        } else {
            document.getElementById('checkDate').innerHTML = '';
        }
    }

    function checkReturnDate() {
        if ($from > $to && $from != null && $to != null) {
            document.getElementById('checkDate').innerHTML = "<p class='error'>Return Date must not before Departure Date</p>";
            document.getElementById('return').value = '';
        } else {
            document.getElementById('checkDate').innerHTML = '';
        }
    }

    function getDate(element) {
        let date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }
        return date;
    }
</script>
</body>
</html>
