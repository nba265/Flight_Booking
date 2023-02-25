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
  <link href="${pageContext.request.contextPath}/resources-management/plane.css" rel="stylesheet" type="text/css"/>
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
            <div class=" pull-left">
              <div class="page-title">Add Aircraft</div>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <div class="card-box">
              <div class="card-head">
                <header>Add Aircraft</header>
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
              <form:form class="card-body row" method="post" action="addAircraft" modelAttribute="aircraft">
                <input type="hidden" name="id"  value="${aircraft.id}"  readonly>
                <div class="col-lg-6 p-t-20">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width ">
                    <input class="mdl-textfield__input" type="text" name="name"  value="${aircraft.name}" required>
                    <label class="mdl-textfield__label">Name Aircraft</label>
                  </div>
                </div>
                <div class="col-lg-6 p-t-20">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                    <input class="mdl-textfield__input" type="text"  name="number"  value="${aircraft.number}" required>
                    <label class="mdl-textfield__label">Aircraft Number</label>
                  </div>
                </div>
                <div class="col-lg-6 p-t-20">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                    <input class="mdl-textfield__input" type="text" name="col"  value="${aircraft.col}" required>
                    <label class="mdl-textfield__label">Column</label>
                  </div>
                </div>
                <div class="col-lg-6 p-t-20">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                    <input class="mdl-textfield__input" type="text" name="row"  value="${aircraft.row}" required>
                    <label class="mdl-textfield__label">Row</label>
                  </div>
                </div>
                <div class="col-lg-6 p-t-20">
                  <label style="color: #AAAAAA !important;
    font-size: 13px !important;">Status</label>
                  <select name="aircraftStatus" class=" form-control" required>
                    <option value="">Select Status</option>
                    <c:forEach items="${ListAircraftStatus}" var="item">
                      <c:choose>
                        <c:when test="${aircraft.aircraftStatus == item}">
                          <option value="${item}"
                                  selected>${item}</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${item}">${item}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
<%--                <div class="col-lg-6 p-t-20">
                  <label style="color: #AAAAAA !important;
    font-size: 13px !important;">Aircraft Image</label>
                  <div ><input type="file" name="file" multiple="multiple"  /></div>
                </div>--%>
                <div class="col-lg-12 p-t-20 text-center">
                  <input type="submit"
                         class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"
                         value="Submit"/>
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

</script>
<!-- end js include path -->
</body>
</html>
