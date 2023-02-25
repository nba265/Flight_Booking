<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.css">

    <script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources-management/datepicker2/jquery-ui.js"></script>

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
    <link rel="shortcut icon" href="assets/img/favicon.ico"/>
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
                    <span class="logo-default">Spice</span> </a>
            </div>
            <!-- logo end -->
            <!-- start mobile menu -->
            <!-- end mobile menu -->
            <!-- start header menu -->
            <jsp:include page="../include/header.jsp"/>
        </div>
    </div>
    <!-- end header -->
    <!-- start page container -->
    <div class="page-container">
        <!-- start sidebar menu -->
        <!-- end sidebar menu -->
        <!-- start page content -->
        <div class="">
            <div class="page-content">
                <div class="m-3">
                <div class="page-bar">
                    <div class="page-title-breadcrumb">
                        <div class=" pull-left">
                            <div class="page-title">User Profile</div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PROFILE SIDEBAR -->
                        <!-- END BEGIN PROFILE SIDEBAR -->
                        <!-- BEGIN PROFILE CONTENT -->
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
                                                        <p class="text-muted">${user.genderEnum}</p>
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
                                                                        name="genderEnum"
                                                                        class="form-control" required>
                                                                    <c:forEach var="item" items="${genderList}">
                                                                        <c:choose>
                                                                            <c:when test="${user.genderEnum == item}">
                                                                                <option value="${item}"
                                                                                        selected>${item}</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="${item}">${item}</option>
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
                        <!-- END PROFILE CONTENT -->
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
<!-- Material -->
<script src="${pageContext.request.contextPath}/resources-management/assets/plugins/material/material.min.js"></script>
<!-- animation -->
<script src="${pageContext.request.contextPath}/resources-management/assets/js/pages/ui/animations.js"></script>
<!-- end js include path -->
<script type="text/javascript">

    $(document).ready(function () {
        var newpassword = document.getElementById("newpassword")
            , confirm_password = document.getElementById("confirm_password");

        function validatePassword() {
            if (newpassword.value !== confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        newpassword.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;

        $(function () {
            var dateFormat = "yy-mm-dd",
                from = $("#startDate")
                    .datepicker({
                        dateFormat: 'yy-mm-dd',
                        defaultDate: "+1w",
                        changeMonth: true,
                        numberOfMonths: 1,
                    })
            ;

            function getDate(element) {
                var date;
                try {
                    date = $.datepicker.parseDate(dateFormat, element.value);
                } catch (error) {
                    date = null;
                }
                return date;
            }
        });
    });


</script>
</body>
</html>