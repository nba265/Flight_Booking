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
        <jsp:include page="../include/menuManager.jsp"></jsp:include>
        <!-- end sidebar menu -->
        <!-- start page content -->
        <div class="page-content-wrapper">
            <div class="page-content">
                <div class="page-bar">
                    <div class="page-title-breadcrumb">
                        <div class=" pull-left">
                            <div class="page-title">Booking Details</div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <c:forEach items="${flightList}" var="flight">
                                <div class="col-lg-12 p-t-20" style="text-align: center">
                                    <h2 class="display-2">Flight: ${flight.flightRoute.departureAirport.name}
                                        to ${flight.flightRoute.destinationAirport.name}</h2>
                                </div>

                                <c:forEach items="${listBookingDetail}" var="item">
                                    <c:if test="${item.flightsEntity.id == flight.id }">
                                        <div class="card-body row border p-3" style="margin: 1em 2em"
                                             method="get">
                                            <div class="col-lg-12 p-t-20">
                                                <c:choose>
                                                    <c:when test="${item.bookingStatusEnum=='COMPLETED'}">
                                                        <button type="button"
                                                                class="btn btn-primary">${item.bookingStatusEnum}</button>
                                                    </c:when>
                                                    <c:when test="${item.bookingStatusEnum=='BOOKED'}">
                                                        <button type="button"
                                                                class="btn btn-success">${item.bookingStatusEnum}</button>
                                                    </c:when>
                                                    <c:when test="${item.bookingStatusEnum=='CHECK_IN'}">
                                                        <button type="button"
                                                                class="btn btn-info">${item.bookingStatusEnum}</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button"
                                                                class="btn btn-danger">${item.bookingStatusEnum}</button>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:if test="${item.bookingStatusEnum !='CANCEL'}">
                                                    <div class="dropdown show" style="float: right">
                                                        <button class="btn btn-secondary <%--dropdown-toggle--%>" type="button"
                                                                id="dropdownMenuButton" data-toggle="dropdown"
                                                                aria-haspopup="true" aria-expanded="false">
                                                            Change Status
                                                        </button><z></z>
                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink"
                                                             style="width: 6em">
                                                            <c:forEach var="status" items="${listBookingStatus}">
                                                                <c:if test="${status !='CANCEL'}">
                                                                    <c:choose>
                                                                        <c:when test="${item.bookingStatusEnum==status}">
                                                                            <a class="dropdown-item"
                                                                               href="editStatusBooking?id=${item.id}&status=${status}&idBooking=${idBooking}"
                                                                               id="${status}">${status}</a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <a class="dropdown-item"
                                                                               href="editStatusBooking?id=${item.id}&status=${status}&idBooking=${idBooking}"
                                                                               id="${status}">${status}</a>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </c:if>

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
                                            <div class="col-lg-6 p-t-20">
                                                <c:forEach items="${item.serviceBookingEntities}" var="services">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width input-group input-group-sm mb-3 col-lg-3 p-t-20"
                                                         style="float: left">
                                                        <input type="number" id="${item.id}${services.id}"
                                                               style="width: 5em;float: left;margin-right: 5px"
                                                               min="0" class="form-control"
                                                               value="${services.quantity}" readonly/>
                                                        <label for="${item.id}${services.id}">${services.serviceEntity.name}</label><br>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="col-lg-3 p-t-20">
                                                <div class="site-content cf">
                                                    <c:if test="${item.bookingStatusEnum !='CANCEL'}">
                                                        <button name="test" class="btn btn-info boxed-action"
                                                                data-id="confirm-delete${item.id}"
                                                                id="delete-account${item.id}">
                                                            Services
                                                        </button>
                                                    </c:if>
                                                    <dialog id="confirm-delete${item.id}" class="site-dialog cf">
                                                        <form:form modelAttribute="test" method="get"
                                                                   action="editServiceBooking" id="${item.id}">
                                                            <input type="text" name="idBooking"
                                                                   value="${idBooking}" readonly hidden>
                                                            <header class="dialog-header">
                                                                <h1 style="">Services</h1>
                                                                <c:forEach items="${service}" var="item1"
                                                                           varStatus="status1">
                                                                    <c:forEach items="${item.serviceBookingEntities}"
                                                                               var="item2">
                                                                        <%--   <c:set value="0" var="quantity"> </c:set>--%>
                                                                        <c:if test="${item2.serviceEntity.id==item1.id}">
                                                                            <c:set value="${item2.quantity}"
                                                                                   var="quantity"> </c:set>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input type="text"
                                                                           name="serviceBookingEntities[${status1.index}].bookingDetailEntity.id"
                                                                           value="${item.id}" hidden readonly>
                                                                    <c:choose>
                                                                        <c:when test="${item1.name=='Insurance'}">
                                                                            <input type="number" id="${item1.id}"
                                                                                   style="width: 5em"
                                                                                   name="serviceBookingEntities[${status1.index}].quantity"
                                                                                   max="1" min="0"
                                                                                   value="${quantity}"/>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="number" id="${item1.id}"
                                                                                   style="width: 5em"
                                                                                   name="serviceBookingEntities[${status1.index}].quantity"
                                                                                   min="0"
                                                                                   value="${quantity}"/>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <input type="text" id="${item1.id}"
                                                                           name="serviceBookingEntities[${status1.index}].serviceEntity.id"
                                                                           value="${item1.id}" hidden readonly/>
                                                                    <label for="${item1.id}"
                                                                           style="color:white;">${item1.name}</label><br>
                                                                    <c:set value="0" var="quantity"> </c:set>
                                                                </c:forEach>
                                                                <div style="position: absolute; right: 0; top: 0; text-align: right">
                                                                    <p class="btn btn-cancel"
                                                                       data-id="confirm-delete${item.id}"
                                                                       id="cancel${item.id}"
                                                                       name="cancel">x
                                                                    </p>
                                                                </div>
                                                            </header>
                                                            <div class="btn-group cf" style="width: 100%">
                                                                <input class="btn btn-danger" type="submit">
                                                            </div>
                                                        </form:form>
                                                    </dialog>
                                                </div>
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
        <!-- end page content -->
        <!-- start chat sidebar -->

        <!-- end chat sidebar -->
    </div>
    <!-- end page container -->
    <!-- start footer -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
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
<%--<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js"></script>--%>

<%--
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.bundle.4.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.min.js"></script>--%>
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

        $('p[name="cancel"]').click(function () {
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
