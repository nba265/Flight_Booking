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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta name="description" content="Responsive Admin Template"/>
    <meta name="author" content="SmartUniversity"/>
    <title>Management</title>
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
                            <div class="page-title">All Airports</div>
                        </div>
                    </div>
                </div>
                <div class="tab-content tab-space">
                    <div class="tab-pane active show" id="tab1">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    <div class="card-head">
                                    </div>
                                    <div class="card-body ">
                                        <form:form class="form-inline" method="post" enctype="multipart/form-data" action="addAirport"  modelAttribute="airport" >
                                            <input type="hidden" class="form-control" placeholder="name" name="id"
                                                   value="${airport.id}"/>
                                            <div class="form-group mx-sm-3 mb-2">

                                                <input type="text" class="form-control" id="name" placeholder="name"
                                                       name="name" value="${airport.name}" required/>
                                            </div>
                                            <div class="form-group mx-sm-3 mb-2">

                                                <input type="text" class="form-control" id="code" placeholder="code"
                                                       name="code" value="${airport.code}" required/>
                                            </div>
                                            <div class="form-group mx-sm-3 mb-2">
                                                <div ><input type="file" name="file" required /></div>
                                            </div>
                                            <input type="submit" class="btn btn-primary mb-2" value="Submit"/>
                                        </form:form>
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width"
                                                   id="example4">
                                                <thead>
                                                <tr>
                                                    <th class="center"> Images </th>
                                                    <th class="center"> City </th>
                                                    <th class="center"> Airport code </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listAirport}" var="item">
                                                    <tr class="odd gradeX">
                                                        <th class="col-20">
                                                            <div id="${fn:replace(item.name, ' ', '-')}"
                                                                 class="carousel slide" data-ride="carousel"
                                                                 style="width: 200px;">
                                                                <!-- The slideshow -->
                                                                <div class="carousel-inner">
                                                                    <c:forEach items="${item.imageList}" var="image"
                                                                               varStatus="stat">
                                                                        <c:if test="${stat.first}">
                                                                            <div class="carousel-item active">
                                                                                <img intrinsicsize="200x200"
                                                                                     src="${pageContext.request.contextPath}/resources/images/${image.name}"
                                                                                     alt="" width="200" height="200">
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${not stat.first}">
                                                                            <div class="carousel-item">
                                                                                <img intrinsicsize="200x200"
                                                                                     src="${pageContext.request.contextPath}/resources/images/${image.name}"
                                                                                     alt="" width="200" height="200">
                                                                            </div>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </div>
                                                                <!-- Left and right controls -->
                                                                <a class="carousel-control-prev"
                                                                   href="#${fn:replace(item.name, ' ', '-')}" data-slide="prev">
                                                                    <span class="carousel-control-prev-icon"></span>
                                                                </a> <a class="carousel-control-next"
                                                                        href="#${fn:replace(item.name, ' ', '-')}" data-slide="next">
                                                                <span class="carousel-control-next-icon"></span>
                                                            </a>
                                                            </div>
                                                        </th>
                                                        <td class="center"><c:out value="${item.name}"/></td>
                                                        <td class="center"><c:out value="${item.code}"/></td>
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
<!-- end js include path -->
</body>
</html>
