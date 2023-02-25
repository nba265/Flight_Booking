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
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta name="description" content="Responsive Admin Template"/>
    <meta name="author" content="SmartUniversity"/>
    <title>Management</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/plane.css">
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
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="card-head">
                                <header>Add Flights</header>
                                <button id="panel-button"
                                        class="mdl-button mdl-js-button mdl-button--icon pull-right"
                                        data-upgraded=",MaterialButton">
                                    <i class="material-icons">more_vert</i>
                                </button>
                                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                    data-mdl-for="panel-button">
                                    <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                    <li class="mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                    <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else here
                                    </li>
                                </ul>
                            </div>
                            <div style="text-align: center">
                            <p style="color: red;font-size: 2em" ><c:out value="${message}"></c:out></p>
                            </div>
                            <form:form id="formPromotion" class="card-body row" modelAttribute="flightObject"
                                       method="get" action="addNewFlight">
                                <input type="text" name="id" hidden readonly value="${flightObject.id} ">
                                <div class="col-lg-4 p-t-20">
                                    <label>Aircraft</label>
                                    <select name="aircraft.id" class=" form-control" required>
                                        <option value="">Select Aircraft</option>
                                        <c:forEach items="${listAircraft}" var="item">
                                            <c:if test="${item.aircraftStatus==('ACTIVE')}">
                                            <c:choose>
                                                <c:when test="${flightObject.aircraft.id==item.id}">
                                                    <option value="${item.id}"
                                                            selected>${item.name}${item.number}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.id}">${item.name}${item.number}</option>
                                                </c:otherwise>
                                            </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-4 p-t-20">
                                    <label>Destination</label>
                                    <select name="flightRoute.id" class=" form-control" required>
                                        <option value="">Select location</option>
                                        <c:forEach items="${flightRouteList}" var="item">
                                            <c:choose>
                                                <c:when test="${flightObject.flightRoute.id==item.id}">
                                                    <option value="${item.id}" selected>${item.departureAirport.name}
                                                        to ${item.destinationAirport.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.id}">${item.departureAirport.name}
                                                        to ${item.destinationAirport.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-4 p-t-20">
                                    <label>Departure Date</label>
                                    <div class="form-group mb-4">
                                        <div class="datepicker date input-group p-0 shadow-sm">
                                            <input type="text" placeholder="DepartDate" class="form-control py-4 px-4"
                                                   name="departure" value="${flightObject.departure}" required>
                                            <div class="input-group-append"><span class="input-group-text px-4"><i
                                                    class="fa fa-clock-o"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <header>Departure Time</header>
                                    <div class="p-t-20">
                                        <div class="form-control-wrapper">
                                            <input type="text" id="time" class="floating-label mdl-textfield__input"
                                                   placeholder="departureTime" name="departureTime"
                                                   value="${flightObject.departureTime}" required >
                                        </div>
                                    </div>
                                </div>
                                <input name="promotion" value="0" hidden >
                                <div class="col-lg-4 p-t-20">
                                    <label>Promotions</label>
                                    <select name="promotion" id="multiselect" class=" form-control select" multiple >
                                        <c:forEach items="${listPromotion}" var="item">
                                            <c:choose>
                                                <c:when test="${myfn:contains(flightObject.promotionEntities,item)}">
                                                    <option type="checkbox" value="${item.id}"
                                                            selected>${item.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option type="checkbox" value="${item.id}">${item.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                            <div class="col-lg-12 p-t-20">
                                <c:if test="${not (flightObject.aircraft.row ==null)}">
                                    <div class="plane">
                                        <div class="exit exit--front fuselage">
                                        </div>
                                        <ol class="cabin fuselage" style="margin-bottom: 0">
                                            <c:forEach begin="1" end="${flightObject.aircraft.row}" var="row">
                                                <li class="">
                                                    <ol class="seats" type="A">
                                                        <c:forEach begin="1" end="${flightObject.aircraft.col}"
                                                                   var="col">
                                                            <li class="seat">
                                                                <a href="editSeat?number=${row}${myfn:getCharForNumber(col)}&id=${flightObject.id}"
                                                                   class="btn btn-primary" style="width: 100%;">${row}${myfn:getCharForNumber(col)}</a>
                                                            </li>
                                                        </c:forEach>
                                                    </ol>
                                                </li>
                                            </c:forEach>
                                        </ol>
                                        <div class="exit exit--back fuselage">
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-lg-12 p-t-20 text-center">
                                    <input type="submit"
                                           class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"
                                           value="Submit"/>
                                </div>
                            </div>
                            </form:form>
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
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js"></script>


<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.bundle.4.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.min.js"></script>
<script>
    $(function () {

        // INITIALIZE DATEPICKER PLUGIN
        $('.datepicker').datepicker({
            clearBtn: true,
            format: "yyyy-mm-dd"
        });


    });

    $(document).ready(function () {
        $('#multiselect').on('change', function () {
           /* alert($('#multiselect').val());*/
            if ($('#multiselect').val() === ''  || $('#multiselect').val() === null){
                alert("heheh")
                $('#multiselect').val('0');
            }
        });
    })

</script>
<!-- end js include path -->
</body>
</html>
