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
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta name="description" content="Responsive Admin Template"/>
    <meta name="author" content="SmartUniversity"/>
    <title>Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.css">

    <script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.js"></script>
<%--    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.4.3.1.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/font-awesome.4.7.0.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.css" rel="stylesheet" type="text/css" />--%>
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
                        <div class=" pull-left">
                            <div class="page-title">Add Promotion</div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="card-head">

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
                            <form:form id="formPromotion" class="card-body row" modelAttribute="promotion" method="get"
                                       action="addPromotion">
                                <input type="text" name="id" value="${promotion.id}"  hidden>
                                <input type="text" name="createDate" value="${promotion.startDate}" hidden>
                                <div class="col-lg-4 p-t-20">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <input class="mdl-textfield__input" type="text" name="name" value="${promotion.name}" required  >
                                        <label class="mdl-textfield__label">Name</label>
                                    </div>
                                </div>

                                <div class="col-lg-4 p-t-20">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <input class="mdl-textfield__input" type="text" name="code" value="${promotion.code}" required  >
                                        <label class="mdl-textfield__label">Code</label>
                                    </div>
                                </div>
                                <div class="col-lg-4 p-t-20">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                        <input class="mdl-textfield__input" type="text" name="discount" value=" <fmt:formatNumber type = "number" minFractionDigits="0" value = "${promotion.discount}" />" required>
                                        <label class="mdl-textfield__label">Discount(Percent)</label>
                                    </div>
                                </div>

                                <div class="col-lg-6 p-t-20">
                                    <label >Start Date</label>
                                    <div class="form-group mb-4">
                                        <div class="datepicker date input-group p-0 shadow-sm">
                                            <input type="text" placeholder="Start date" class="form-control py-4 px-4" id="startDate" name="startDate" value="${promotion.startDate}" required>
                                            <%--<input type="text" placeholder="Start date" class="form-control py-4 px-4"  id="startDate" name="startDate" required >--%>
                                            <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 p-t-20">
                                    <label >End Date</label>
                                    <div class="form-group mb-4">
                                        <div class="datepicker date input-group p-0 shadow-sm">
                                            <input type="text" placeholder="End date" class="form-control py-4 px-4" id="endDate" name="endDate" value="${promotion.endDate}"  required>
                                            <%--<input type="text" placeholder="End date" class="form-control py-4 px-4" id="endDate" name="endDate" required>--%>
                                            <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 p-t-20">
                                    <div class="mdl-textfield mdl-js-textfield txt-full-width">
					                     <textarea class="mdl-textfield__input" rows="4"  name="description" required>
                                              ${promotion.description}
                                         </textarea>
                                        <label class="mdl-textfield__label">Description</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 p-t-20 text-center">
                                    <input type="submit"
                                           class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"
                                           value="Submit"/>
                                </div>
                                <div class="col-lg-12 p-t-20 text-center">
                                    <p><span class="error" id="errorDate"  aria-live="polite" style="color: red;font-style: italic;"></span></p>
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
!-- start js include path -->
<%--<script src="${pageContext.request.contextPath}/resources-management/datepicker/jquery-3.3.1.slim.min.js"></script>--%>
<!-- start js include path -->

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



<%--<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap.bundle.4.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/datepicker/bootstrap-datepicker.1.9.0.min.js"></script>
<script>
    $(function () {

        // INITIALIZE DATEPICKER PLUGIN
        $('.datepicker').datepicker({
            clearBtn: true,
            format: "yyyy-mm-dd"
        });



    });

</script>
<script>
    $("#endDate").change(function() {
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        if ((Date.parse(endDate) <= Date.parse(startDate))) {
            //alert("End date should be greater than Start date");
            document.getElementById("endDate").value = "";
            document.getElementById("errorDate").innerHTML = "End date should be greater than Start date";

        }
        else{
            document.getElementById("errorDate").innerHTML = "";
        }
    });
    $("#startDate").change(function() {
        var startDate = document.getElementById("startDate").value;
        var today = new Date();
        var curDate= today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();

        if ((Date.parse(startDate) <= Date.parse(curDate))) {
            //alert("End date should be greater than Start date");
            document.getElementById("startDate").value = "";
            document.getElementById("errorDate").innerHTML = "Start date should be greater than today";

        }
        else{
            document.getElementById("errorDate").innerHTML = "";
        }
    });
</script>--%>
<script>
    $( function() {
        var dateFormat = "yy-mm-dd",
            from = $( "#startDate" )
                .datepicker({
                    dateFormat: 'yy-mm-dd',
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1,
                    minDate: new Date()
                })
                .on( "change", function() {
                    to.datepicker( "option", "minDate", getDate( this ) );
                }),
            to = $( "#endDate" ).datepicker({
                dateFormat: 'yy-mm-dd',
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                minDate: new Date()
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
