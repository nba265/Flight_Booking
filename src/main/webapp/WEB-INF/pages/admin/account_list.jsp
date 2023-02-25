<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <meta name="description" content="Responsive Admin Template" />
  <meta name="author" content="SmartUniversity" />
  <title>Spice Hotel | Bootstrap 4 Admin Dashboard Template + UI Kit</title>
  <!-- google font -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
  <!-- icons -->
  <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <!--bootstrap -->
  <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/summernote/summernote.css" rel="stylesheet">
  <!-- morris chart -->
  <link href="${pageContext.request.contextPath}/resources-management/assets/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
  <!-- Material Design Lite CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/assets/css/material_style.css">
  <!-- animation -->
  <link href="${pageContext.request.contextPath}/resources-management/assets/css/pages/animate_page.css" rel="stylesheet">
  <!-- Template Styles -->
  <link href="${pageContext.request.contextPath}/resources-management/assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/resources-management/assets/css/style.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/resources-management/assets/css/responsive.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/resources-management/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
  <!-- favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources-management/assets/img/favicon.ico" />
</head>
<!-- END HEAD -->
<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
<div class="page-wrapper">
  <!-- start header -->
  <jsp:include page="../include/header.jsp"></jsp:include>
  <!-- end header -->
  <!-- start page container -->
  <div class="page-container" >
    <!-- start sidebar menu -->
    <!-- end sidebar menu -->
    <!-- start page content -->

      <div class="page-content" >
        <div style="padding: 0 2em">
        <div class="page-bar">
          <div class="page-title-breadcrumb">
            <div class=" pull-left">
              <div class="page-title">Dashboard</div>
            </div>
          </div>
        </div>
        <!-- start widget -->
        <div class="state-overview">
          <div class="row">
            <!-- /.col -->

            <!-- /.col -->

            <!-- /.col -->

            <!-- /.col -->
          </div>
        </div>
        <!-- end widget -->
        <!-- chart start -->

        <!-- Chart end -->

        <!-- start Payment Details -->

          <div class="tab-content tab-space">
            <div class="tab-pane active show" id="tab1">

              <div class="row">
                <div class="col-md-12">
                  <div class="card-box">
                    <div class="card-head">
                      <button id="panel-button"
                              class="mdl-button mdl-js-button mdl-button--icon pull-right"
                              data-upgraded=",MaterialButton">
                        <i class="material-icons">more_vert</i>
                      </button>
                      <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                          data-mdl-for="panel-button">
                        <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
                        </li>
                        <li class="mdl-menu__item"><i class="material-icons">print</i>Another action
                        </li>
                        <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something
                          else here
                        </li>
                      </ul>
                    </div>
                    <div class="card-body ">
                      <div class="table-scrollable">
                        <table class="table table-hover table-checkable order-column full-width"
                               id="example4">
                          <thead>
                          <tr>
                            <th class="center"> Name</th>
                            <th class="center"> Email</th>
                            <th class="center"> Birthday</th>
                            <th class="center"> Address</th>
                            <th class="center"> Gender</th>
                            <th class="center"> Phone Number</th>
                            <th class="center"> Status</th>
                            <th class="center"> Action</th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${listUser}" var="item">
                            <tr class="odd gradeX">
                              <td class="center"><c:out value="${item.fullName}"/></td>
                              <td class="center"><c:out value="${item.email}"/></td>
                              <td class="center"><c:out value="${item.birthday}"/></td>
                              <td class="center"><c:out value="${item.address}"/></td>
                              <td class="center"><c:out value="${item.genderEnum}"/></td>
                              <td class="center"><c:out value="${item.phoneNumber}"/></td>
                              <td class="center"><p id="${item.status}"><c:out value="${item.status}"/></p></td>
                              <td class="center">
                                <a href=""
                                   class="btn btn-tbl-edit btn-xs">
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
        <!-- end Payment Details -->

      </div>

    <!-- end page content -->
    <!-- start chat sidebar -->

    <!-- end chat sidebar -->
  </div>
  <!-- end page container -->
  <!-- start footer -->
  <div class="page-footer">
    <div class="page-footer-inner"> 2018 &copy; Spice Hotel Template By
      <a href="mailto:redstartheme@gmail.com" target="_top" class="makerCss">RedStar Theme</a>
    </div>
    <div class="scroll-to-top">
      <i class="icon-arrow-up"></i>
    </div>
  </div>
  <!-- end footer -->
</div>
<!-- start js include path -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/popper/popper.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/sparkline/jquery.sparkline.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/sparkline/sparkline-data.js" ></script>
<!-- Common js-->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/app.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/layout.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/theme-color.js" ></script>
<!-- data tables -->
<link href="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"
      rel="stylesheet" type="text/css"/>
<!-- material -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.js"></script>
<!-- animation -->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/ui/animations.js" ></script>
<!-- data tables -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/table/table_data.js"></script>
<!-- morris chart -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/morris/morris.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/morris/raphael-min.js" ></script>
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/chart/morris/morris_home_data.js" ></script>
<!-- end js include path -->
</body>
</html>