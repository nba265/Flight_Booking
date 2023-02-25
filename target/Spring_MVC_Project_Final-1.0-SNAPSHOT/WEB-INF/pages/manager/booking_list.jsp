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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta name="description" content="Responsive Admin Template" />
    <meta name="author" content="SmartUniversity" />
    <title>Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.css">

    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
    <!-- icons -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!--bootstrap -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Material Design Lite CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/assets/css/material_style.css">
    <!-- data tables -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <!-- animation -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/pages/animate_page.css" rel="stylesheet">
    <!-- Template Styles -->
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources-management/assets/img/favicon.ico" />
    <!-- export -->

    <!--<style>
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
    </style>-->
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
                            <div class="page-title">All Bookings</div>
                        </div>

                    </div>
                </div>
                <div class="tab-content tab-space">
                    <div class="tab-pane active show" id="tab1">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    <div class="card-head">
                                        <div style="width: 70%;" class="m-2 mb-0">
                                        <form:form modelAttribute="searchDate" action="booking_list" method="get" autocomplete="off">
                                            <div style="display: inline-block">
                                            <div class="mb-4">
                                                <div class="datepicker date input-group p-0 shadow-sm" style="border-radius: 6rem" >
                                                    <input type="text" placeholder="Start date" class="form-control " id="startDate" name="startDate" style="border-radius: 6rem" />
                                                        <%--<input type="text" placeholder="Start date" class="form-control py-4 px-4"  id="startDate" name="startDate" required >--%>
                                                </div>
                                            </div>
                                            </div>
                                            <div style="display: inline-block">
                                            <div class=" mb-4">
                                                <div class="datepicker date input-group p-0 shadow-sm" >
                                                    <input type="text" placeholder="End date" class="form-control " id="endDate" name="endDate" style="border-radius: 6rem" />
                                                        <%--<input type="text" placeholder="End date" class="form-control py-4 px-4" id="endDate" name="endDate" required>--%>
                                                </div>
                                            </div>
                                            </div>
                                            <div style="display: inline-block;border-radius: 25px">
                                            <input type="submit" class="btn" >
                                            </div>
                                        </form:form>
                                        </div>
                                        <button id = "panel-button"
                                                class = "mdl-button mdl-js-button mdl-button--icon pull-right"
                                                data-upgraded = ",MaterialButton">
                                            <i class = "material-icons">more_vert</i>
                                        </button>
                                        <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                            data-mdl-for = "panel-button">
                                            <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i><button id="pdf1" class="btn btn-danger">TO PDF</button></li>
                                            <li ><button id="csv" class="btn btn-info " style="display: block; width: 100%">TO CSV</button></li>
                                        </ul>
                                    </div>
                                    <div class="card-body ">
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                <tr>
                                                    <th class="center"> Booking Date </th>
                                                    <th class="center"> Booking Number </th>
                                                    <th class="center"> Name </th>
                                                    <th class="center"> Mobile </th>
                                                    <th class="center"> Email </th>
                                                    <th class="center"> Amount </th>
                                                    <th id="ignore" class="center"> Action </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listBooking.iterator()}" var="item" >
                                                    <tr class="odd gradeX">
                                                        <td class="center">${item.bookingDate}</td>
                                                        <td class="center">${item.bookingNumber}</td>
                                                        <td class="center">${item.fullName}</td>
                                                        <td class="center"><a href="tel:${item.phoneNumber}">
                                                                ${item.phoneNumber}</a></td>
                                                        <td class="center"><a href="mailto:${item.email}">
                                                                ${item.email}</a></td>
                                                        <td class="center"><fmt:formatNumber type="currency" value="${item.paymentEntity.amount}" minFractionDigits="0" currencySymbol="$"> </fmt:formatNumber></td>
                                                        <td class="center">
                                                            <a href="bookingDetailList?id=${item.id}" class="btn btn-tbl-edit btn-xs">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>
                                                            <a class="btn btn-tbl-delete btn-xs">
                                                                <i class="fa fa-trash-o "></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
<!-- start js include path -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-3.6.0.js"></script>

<script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/popper/popper.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
<!-- Common js-->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/app.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/layout.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/theme-color.js" ></script>
<!-- data tables -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/jquery.dataTables.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/table/table_data.js" ></script>
<!-- Material -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.js"></script>
<!-- animation -->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/ui/animations.js" ></script>
<!-- Export -->
<script src="${pageContext.request.contextPath}/resources-management/export/jspdf.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/export/jspdf.plugin.autotable.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/export/tableHTMLExport.js" ></script>

<script>



    $('#csv').on('click',function(){
        $("#example4").tableHTMLExport({
            type:'csv',
            filename:'bookingList.csv',ignoreColumns:'#ignore'

        });
    });


    $('#pdf1').on('click',function(){
        $("#example4").tableHTMLExport({type:'pdf',filename:'sample.pdf'});
    });


    $( function() {
        var dateFormat = "yy-mm-dd",
            from = $( "#startDate" )
                .datepicker({
                    dateFormat: 'yy-mm-dd',
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,

                })
                .on( "change", function() {
                    to.datepicker( "option", "minDate", getDate( this ) );
                }),
            to = $( "#endDate" ).datepicker({
                dateFormat: 'yy-mm-dd',
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1
            })
                .on( "change", function() {
                    from.datepicker( "option", "maxDate", getDate( this ) );
                });

        function getDate( element ) {
            var date;
            try {
                date = $.datepicker.parseDate( dateFormat, element.value );
            } catch( error ) {
                date = null;
            }

            return date;
        }
    } );
</script>
<!-- end js include path -->
</body>


</html>
