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
    <div class="page-header navbar navbar-fixed-top">
        <div class="page-header-inner ">
            <!-- logo start -->
            <div class="page-logo">
                <a href="index.html">
                    <img alt="" src="assets/img/logo.png">
                    <span class="logo-default" >Spice</span> </a>
            </div>
            <!-- logo end -->



            <!-- start mobile menu -->

            <!-- end mobile menu -->
            <!-- start header menu -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <!-- start notification dropdown -->

                    <!-- end notification dropdown -->
                    <!-- start message dropdown -->

                    <!-- end message dropdown -->
                    <!-- start manage user dropdown -->
                    <li class="dropdown dropdown-user">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img alt="" class="img-circle " src="assets/img/dp.jpg" />
                            <span class="username username-hide-on-mobile"><security:authorize access="isAuthenticated()"><security:authentication property="principal.username" /> </security:authorize></span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default animated jello">
                            <li>
                                <a href="profile">
                                    <i class="icon-user"></i> Profile </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="icon-settings"></i> Settings
                                </a>
                            </li>

                            <li class="divider"> </li>

                            <li>
                                <a href="/logout">
                                    <i class="icon-logout"></i> Log Out </a>
                            </li>
                        </ul>
                    </li>
                    <!-- end manage user dropdown -->

                    </li>
                </ul>
            </div>
        </div>
    </div>
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
                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
                <!-- start widget -->
                <div class="state-overview">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 col-12">
                            <div class="info-box bg-blue">
                                <span class="info-box-icon push-bottom"><i class="material-icons">style</i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Orders</span>
                                    <span class="info-box-number">450</span>
                                    <div class="progress">
                                        <div class="progress-bar width-60"></div>
                                    </div>
                                    <span class="progress-description">
                                                60% Increase in 28 Days
                                            </span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-xl-3 col-md-6 col-12">
                            <div class="info-box bg-orange">
                                <span class="info-box-icon push-bottom"><i class="material-icons">card_travel</i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">New Booking</span>
                                    <span class="info-box-number">155</span>
                                    <div class="progress">
                                        <div class="progress-bar width-40"></div>
                                    </div>
                                    <span class="progress-description">
                                                40% Increase in 28 Days
                                            </span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-xl-3 col-md-6 col-12">
                            <div class="info-box bg-purple">
                                <span class="info-box-icon push-bottom"><i class="material-icons">phone_in_talk</i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Inquiry</span>
                                    <span class="info-box-number">52</span>
                                    <div class="progress">
                                        <div class="progress-bar width-80"></div>
                                    </div>
                                    <span class="progress-description">
                                                80% Increase in 28 Days
                                            </span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-xl-3 col-md-6 col-12">
                            <div class="info-box bg-success">
                                <span class="info-box-icon push-bottom"><i class="material-icons">monetization_on</i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Total Earning</span>
                                    <span class="info-box-number">13,921</span><span>$</span>
                                    <div class="progress">
                                        <div class="progress-bar width-60"></div>
                                    </div>
                                    <span class="progress-description">
                                                60% Increase in 28 Days
                                            </span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
                <!-- end widget -->
                <!-- chart start -->

                <!-- Chart end -->

                <!-- start Payment Details -->

                <div class="tab-content tab-space">
                    <div class="tab-pane active show" id="tab1">

                        <div class="profile-content">
                            <div class="row">
                                <div class="profile-tab-box">
                                    <div class="p-l-20">
                                        <ul class="nav ">
                                            <li class="nav-item tab-all"><a
                                                    class="nav-link active show" href="#tab1" data-toggle="tab">About
                                                Me</a></li>
                                            <li class="nav-item tab-all p-l-20"><a class="nav-link"
                                                                                   href="#tab3" data-toggle="tab">Settings</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="white-box">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active fontawesome-demo" id="tab1">
                                            <div id="biography">
                                                <div class="row">
                                                    <div class="col-md-2 col-6 b-r"><strong>Full Name</strong>
                                                        <br>
                                                        <p class="text-muted">${user.fullName}</p>
                                                    </div>
                                                    <div class="col-md-2 col-6 b-r"><strong>Gender</strong>
                                                        <br>
                                                        <p class="text-muted">${user.genderEntity.genderEnum}</p>
                                                    </div>
                                                    <div class="col-md-2 col-6 b-r"><strong>Mobile</strong>
                                                        <br>
                                                        <p class="text-muted">${user.phoneNumber}</p>
                                                    </div>
                                                    <div class="col-md-2 col-6 b-r"><strong>Email</strong>
                                                        <br>
                                                        <p class="text-muted">${user.email}</p>
                                                    </div>
                                                    <div class="col-md-2 col-6"><strong>Address</strong>
                                                        <br>
                                                        <p class="text-muted">${user.address}</p>
                                                    </div>
                                                </div>
                                                <form:form id="formPromotion" class="card-body row"
                                                           modelAttribute="user" method="get"
                                                           action="editProfile">
                                                    <input type="text" name="id" value="${user.id}"
                                                           hidden>
                                                    <input type="text" name="email" value="${user.email}"
                                                           hidden>
                                                    <div class="col-lg-6 p-t-20">
                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                            <input class="mdl-textfield__input" type="text"
                                                                   name="fullName"
                                                                   value="${user.fullName}" required>
                                                            <label class="mdl-textfield__label">Full Name</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 p-t-20">
                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                            <input class="mdl-textfield__input" type="tel"
                                                                   name="phoneNumber" value="${user.phoneNumber}"
                                                                   required pattern="[0-9]{10}" >
                                                            <label class="mdl-textfield__label">Phone Number</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 p-t-20">
                                                        <label>BirthDay</label>
                                                        <div class="form-group mb-4">
                                                            <div class="datepicker date input-group p-0 shadow-sm">
                                                                <input type="date" placeholder="Start date"
                                                                       class="form-control py-4 px-4" id="startDate"
                                                                       name="birthday" value="${user.birthday}"
                                                                       max="2015-12-31" required>
                                                                    <%--<input type="text" placeholder="Start date" class="form-control py-4 px-4"  id="startDate" name="startDate" required >--%>
                                                                    <%--<div class="input-group-append"><span
                                                                            class="input-group-text px-4"><i
                                                                            class="fa fa-clock-o"></i></span></div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 p-t-20">
                                                        <label>Gender</label>
                                                        <div class="form-group mb-4">
                                                            <div class="datepicker date input-group p-0 shadow-sm">
                                                                <select style="height: 66px;"
                                                                        name="genderEntity.id"
                                                                        class="form-control" required>
                                                                    <c:forEach var="item" items="${genderList}">
                                                                        <c:choose>
                                                                            <c:when test="${user.genderEntity.id == item.id}">
                                                                                <option value="${item.id}"
                                                                                        selected>${item.genderEnum}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${item.id}">${item.genderEnum}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </select>
                                                                    <%--<input type="text" placeholder="Start date" class="form-control py-4 px-4"  id="startDate" name="startDate" required >--%>
                                                                    <%--<div class="input-group-append"><span
                                                                            class="input-group-text px-4"><i
                                                                            class="fa fa-clock-o"></i></span></div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%-- <div class="col-lg-6 p-t-20">
                                                         <label>End Date</label>
                                                         <div class="form-group mb-4">
                                                             <div class="datepicker date input-group p-0 shadow-sm">
                                                                 <input type="text" placeholder="End date"
                                                                        class="form-control py-4 px-4" id="endDate"
                                                                        name="endDate" value="${promotion.endDate}">
                                                                     &lt;%&ndash;<input type="text" placeholder="End date" class="form-control py-4 px-4" id="endDate" name="endDate" required>&ndash;%&gt;
                                                                 <div class="input-group-append"><span
                                                                         class="input-group-text px-4"><i
                                                                         class="fa fa-clock-o"></i></span></div>
                                                             </div>
                                                         </div>
                                                     </div>--%>
                                                    <div class="col-lg-12 p-t-20">
                                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                            <input class="mdl-textfield__input" type="text"
                                                                   name="address" value="${user.address}">
                                                            <label class="mdl-textfield__label">Address</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 p-t-20 text-center">
                                                        <input type="submit"
                                                               class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink"
                                                               value="Submit"/>
                                                    </div>
                                                    <div class="col-lg-12 p-t-20 text-center">
                                                        <p><span class="error" id="errorDate" aria-live="polite"
                                                                 style="color: red;font-style: italic;"></span></p>
                                                    </div>
                                                </form:form>
                                            </div>

                                        </div>

                                        <div class="tab-pane" id="tab3">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="card-head">
                                                        <header>Password Change</header>
                                                    </div>
                                                    <div class="card-body " id="bar-parent1">
                                                        <form:form method="post" modelAttribute="newPassword"
                                                                   action="changePassword">
                                                            <input type="email" name="email" class="form-control"
                                                                   value="${user.email}" readonly>
                                                            <div class="form-group">
                                                                <label for="simpleFormEmail">Old Password</label>
                                                                <input type="password" class="form-control"
                                                                       id="simpleFormEmail" name="oldPassword"
                                                                       placeholder="Enter Old Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="newpassword">New Password</label>
                                                                <input type="password" class="form-control"
                                                                       id="newpassword"
                                                                       placeholder="New Password"
                                                                       onchange="validatePassword()">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="confirm_password">Confirm New
                                                                    Password</label>
                                                                <input type="password" class="form-control"
                                                                       name="newPassword"
                                                                       id="confirm_password"
                                                                       placeholder="Confirm New Password"
                                                                       onchange="validatePassword()">
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Submit
                                                            </button>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
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