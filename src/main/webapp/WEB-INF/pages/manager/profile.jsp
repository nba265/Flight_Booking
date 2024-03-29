<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <ul class="nav navbar-nav navbar-left in">
                <li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
            </ul>
            <form class="search-form-opened" action="#" method="GET">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." name="query">
                    <span class="input-group-btn search-btn">
                          <a href="javascript:" class="btn submit">
                             <i class="icon-magnifier"></i>
                           </a>
                        </span>
                </div>
            </form>

            <!-- start mobile menu -->
            <a href="javascript:" class="menu-toggler responsive-toggler" data-toggle="collapse"
               data-target=".navbar-collapse">
                <span></span>
            </a>
            <!-- end mobile menu -->
            <!-- start header menu -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <!-- start notification dropdown -->
                    <!-- end notification dropdown -->
                    <!-- start message dropdown -->

                    <!-- end message dropdown -->
                    <!-- start manage user dropdown -->
                    <jsp:include page="../include/header.jsp"></jsp:include>
                    <!-- end manage user dropdown -->
                    <li class="dropdown dropdown-quick-sidebar-toggler">
                        <a id="headerSettingButton" class="mdl-button mdl-js-button mdl-button--icon pull-right"
                           data-upgraded=",MaterialButton">
                            <i class="material-icons">settings</i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
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
                            <div class="page-title">User Profile</div>
                        </div>
                        <ol class="breadcrumb page-breadcrumb pull-right">
                            <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
                                                                   href="index.html">Home</a>&nbsp;<i
                                    class="fa fa-angle-right"></i>
                            </li>
                            <li><a class="parent-item" href="">Extra</a>&nbsp;<i class="fa fa-angle-right"></i>
                            </li>
                            <li class="active">User Profile</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PROFILE SIDEBAR -->
                        <%--<div class="profile-sidebar">

                            <div class="card">
                                <div class="card-head card-topline-aqua">
                                    <header>About Me</header>
                                </div>
                                <div class="card-body no-padding height-9">

                                    <ul class="list-group list-group-unbordered">
                                        <li class="list-group-item">
                                            <b>Gender </b>
                                            <div class="profile-desc-item pull-right">${user.gender}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Operation Done </b>
                                            <div class="profile-desc-item pull-right">30+</div>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Degree </b>
                                            <div class="profile-desc-item pull-right">B.A., M.A., P.H.D.</div>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Designation</b>
                                            <div class="profile-desc-item pull-right">Jr. Professor</div>
                                        </li>
                                    </ul>
                                    <div class="row list-separated profile-stat">
                                        <div class="col-md-4 col-sm-4 col-6">
                                            <div class="uppercase profile-stat-title"> 37</div>
                                            <div class="uppercase profile-stat-text"> Projects</div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-6">
                                            <div class="uppercase profile-stat-title"> 51</div>
                                            <div class="uppercase profile-stat-text"> Tasks</div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-6">
                                            <div class="uppercase profile-stat-title"> 61</div>
                                            <div class="uppercase profile-stat-text"> Uploads</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-head card-topline-aqua">
                                    <header>Address</header>
                                </div>
                                <div class="card-body no-padding height-9">
                                    <div class="row text-center m-t-10">
                                        <div class="col-md-12">
                                            <p>456, Pragri flat, varacha road, Surat
                                                <br> Gujarat, India.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-head card-topline-aqua">
                                    <header>Work Expertise</header>
                                </div>
                                <div class="card-body no-padding height-9">
                                    <div class="work-monitor work-progress">
                                        <div class="states">
                                            <div class="info">
                                                <div class="desc pull-left">Java</div>
                                                <div class="percent pull-right">75%</div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar progress-bar-danger progress-bar-striped active width-75"
                                                     role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">75% </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="states">
                                            <div class="info">
                                                <div class="desc pull-left">Php</div>
                                                <div class="percent pull-right">40%</div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar progress-bar-success progress-bar-striped active width-40"
                                                     role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">40% </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="states">
                                            <div class="info">
                                                <div class="desc pull-left">Android</div>
                                                <div class="percent pull-right">60%</div>
                                            </div>
                                            <div class="progress progress-xs">
                                                <div class="progress-bar progress-bar-info progress-bar-striped active width-60"
                                                     role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">60% </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
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
                                                <hr>
                                                <p class="m-t-30">Completed my graduation in Arts from the well known
                                                    and renowned institution of India – SARDAR PATEL ARTS COLLEGE,
                                                    BARODA in 2000-01, which was affiliated to M.S. University. I ranker
                                                    in University exams from the same university from 1996-01.</p>
                                                <p>Worked as Professor and Head of the department at Sarda Collage,
                                                    Rajkot, Gujarat from 2003-2015 </p>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                    industry. Lorem Ipsum has been the industry's standard dummy text
                                                    ever since the 1500s, when an unknown printer took a galley of type
                                                    and scrambled it to make a type specimen book. It has survived not
                                                    only five centuries, but also the leap into electronic typesetting,
                                                    remaining essentially unchanged.</p>
                                                <br>
                                                <h4 class="font-bold">Education</h4>
                                                <hr>
                                                <ul>
                                                    <li>B.A.,Gujarat University, Ahmedabad,India.</li>
                                                    <li>M.A.,Gujarat University, Ahmedabad, India.</li>
                                                    <li>P.H.D., Shaurashtra University, Rajkot</li>
                                                </ul>
                                                <br>
                                                <h4 class="font-bold">Experience</h4>
                                                <hr>
                                                <ul>
                                                    <li>One year experience as Jr. Professor from April-2009 to
                                                        march-2010 at B. J. Arts College, Ahmedabad.
                                                    </li>
                                                    <li>Three year experience as Jr. Professor at V.S. Arts & Commerse
                                                        Collage from April - 2008 to April - 2011.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                </ul>
                                                <br>
                                                <h4 class="font-bold">Conferences, Cources & Workshop Attended</h4>
                                                <hr>
                                                <ul>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                    <li>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                        industry.
                                                    </li>
                                                </ul>
                                                <br>
                                            </div>
                                        </div>

                                        <div class="tab-pane" id="tab3">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="card-head">
                                                        <header>Password Change</header>
                                                    </div>
                                                    <div class="card-body " id="bar-parent1">
                                                        <form:form method="post" modelAttribute="newPassword" action="changePassword" >
                                                            <input type="email" name="email" class="form-control" value="${user.email}">
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
                                                                       placeholder="New Password">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="confirm_password">Confirm New Password</label>
                                                                <input type="password" class="form-control" name="newPassword"
                                                                       id="confirm_password" placeholder="Confirm New Password">
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
    var password = document.getElementById("password")
        , confirm_password = document.getElementById("confirm_password");

    function validatePassword(){
        if(password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
</body>
</html>